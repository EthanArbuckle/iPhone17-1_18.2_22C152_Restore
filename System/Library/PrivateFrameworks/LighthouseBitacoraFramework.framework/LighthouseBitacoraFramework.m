uint64_t LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 8) = v26;
      }
      else if (v17 == 2)
      {
        v30 = PBReaderReadString();
        v31 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v30;
      }
      else if (v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          v20 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + 24) = v20 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_25454C5CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2545516F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  v13 = objc_msgSend_bmltIdentifiers(v7, v9, v10, v11, v12);

  if (v13)
  {
    v18 = (void *)LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      v24 = objc_msgSend_bmltIdentifiers(v7, v20, v21, v22, v23);
      v29 = objc_msgSend_trialTaskID(v24, v25, v26, v27, v28);
      v34 = objc_msgSend_bmltIdentifiers(v7, v30, v31, v32, v33);
      v39 = objc_msgSend_trialDeploymentID(v34, v35, v36, v37, v38);
      *(_DWORD *)buf = 138412546;
      v160 = v29;
      __int16 v161 = 2112;
      v162 = v39;
      _os_log_impl(&dword_254547000, v19, OS_LOG_TYPE_INFO, "bmltIdentifiers: %@ %@", buf, 0x16u);
    }
  }
  else
  {
    v40 = objc_msgSend_experimentIdentifiers(v7, v14, v15, v16, v17);

    if (v40)
    {
      v41 = (void *)LBFLogContextAggregator;
      if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
      {
        v42 = v41;
        v152 = objc_msgSend_experimentIdentifiers(v7, v43, v44, v45, v46);
        v51 = objc_msgSend_trialExperimentID(v152, v47, v48, v49, v50);
        v56 = objc_msgSend_experimentIdentifiers(v7, v52, v53, v54, v55);
        v61 = objc_msgSend_trialDeploymentID(v56, v57, v58, v59, v60);
        objc_msgSend_experimentIdentifiers(v7, v62, v63, v64, v65);
        v67 = id v66 = v8;
        v72 = objc_msgSend_trialTreatmentID(v67, v68, v69, v70, v71);
        *(_DWORD *)buf = 138412802;
        v160 = v51;
        __int16 v161 = 2112;
        v162 = v61;
        __int16 v163 = 2112;
        v164 = v72;
        _os_log_impl(&dword_254547000, v42, OS_LOG_TYPE_INFO, "bmltIdentifiers: %@ %@ %@", buf, 0x20u);

        id v8 = v66;
      }
    }
  }
  v150 = v7;
  v73 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v74 = *(void **)(a1 + 32);
    v75 = v73;
    v80 = objc_msgSend_startTime(v6, v76, v77, v78, v79, v7);
    v84 = objc_msgSend_dateToStringInUTCAndLocal_(v74, v81, (uint64_t)v80, v82, v83);
    *(_DWORD *)buf = 138412290;
    v160 = v84;
    _os_log_impl(&dword_254547000, v75, OS_LOG_TYPE_INFO, "Bucket Start Time: %@", buf, 0xCu);
  }
  v85 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    v86 = *(void **)(a1 + 32);
    v87 = v85;
    v92 = objc_msgSend_endTime(v6, v88, v89, v90, v91);
    v96 = objc_msgSend_dateToStringInUTCAndLocal_(v86, v93, (uint64_t)v92, v94, v95);
    *(_DWORD *)buf = 138412290;
    v160 = v96;
    _os_log_impl(&dword_254547000, v87, OS_LOG_TYPE_INFO, "Bucket End Time:   %@", buf, 0xCu);
  }
  v151 = v6;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v97 = v8;
  uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v154, (uint64_t)v158, 16);
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v155;
    do
    {
      for (uint64_t i = 0; i != v100; ++i)
      {
        if (*(void *)v155 != v101) {
          objc_enumerationMutation(v97);
        }
        v103 = *(void **)(*((void *)&v154 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v104 = v103;
          v105 = (void *)LBFLogContextAggregator;
          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
          {
            v106 = *(void **)(a1 + 32);
            v107 = v105;
            v112 = objc_msgSend_timestamp(v104, v108, v109, v110, v111);
            v116 = objc_msgSend_dateToStringInUTCAndLocal_(v106, v113, (uint64_t)v112, v114, v115);
            *(_DWORD *)buf = 138412290;
            v160 = v116;
            v117 = v107;
            v118 = "BMLighthouseLedgerMlruntimedEvent %@";
LABEL_28:
            _os_log_impl(&dword_254547000, v117, OS_LOG_TYPE_INFO, v118, buf, 0xCu);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v119 = v103;
            v120 = (void *)LBFLogContextAggregator;
            if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
            {
              v121 = *(void **)(a1 + 32);
              v107 = v120;
              v112 = objc_msgSend_timestamp(v119, v122, v123, v124, v125);
              v116 = objc_msgSend_dateToStringInUTCAndLocal_(v121, v126, (uint64_t)v112, v127, v128);
              *(_DWORD *)buf = 138412290;
              v160 = v116;
              v117 = v107;
              v118 = "BMLighthouseLedgerLighthousePluginEvent %@";
              goto LABEL_28;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v129 = v103;
              v130 = (void *)LBFLogContextAggregator;
              if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
              {
                v131 = *(void **)(a1 + 32);
                v107 = v130;
                v112 = objc_msgSend_timestamp(v129, v132, v133, v134, v135);
                v116 = objc_msgSend_dateToStringInUTCAndLocal_(v131, v136, (uint64_t)v112, v137, v138);
                *(_DWORD *)buf = 138412290;
                v160 = v116;
                v117 = v107;
                v118 = "BMLighthouseLedgerTrialdEvent %@";
                goto LABEL_28;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              id v140 = v103;
              v141 = (void *)LBFLogContextAggregator;
              if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
              {
                v142 = *(void **)(a1 + 32);
                v107 = v141;
                v112 = objc_msgSend_timestamp(v140, v143, v144, v145, v146);
                v116 = objc_msgSend_dateToStringInUTCAndLocal_(v142, v147, (uint64_t)v112, v148, v149);
                *(_DWORD *)buf = 138412290;
                v160 = v116;
                v117 = v107;
                v118 = "BMLighthouseLedgerDediscoPrivacyEvent %@";
                goto LABEL_28;
              }
            }
          }
        }
      }
      uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v139, (uint64_t)&v154, (uint64_t)v158, 16);
    }
    while (v100);
  }
}

unsigned char *sub_254551E38(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_254551E48(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_2545534BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id sub_25455638C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_25455992C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_254559DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_25455A54C(uint64_t a1)
{
  if (!qword_269E08588) {
    qword_269E08588 = _sl_dlopen();
  }
  Class result = objc_getClass("FedStatsDataEncoder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_269E08580 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_25455A64C()
{
  uint64_t result = _sl_dlopen();
  qword_269E08588 = result;
  return result;
}

void sub_25455A6D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_25455A6F8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 8u);
}

id sub_25455A718(uint64_t a1, void *a2)
{
  return a2;
}

void sub_25455A734(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_25455A750(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_25455AF84(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qword_26B269D70 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, a3, a4, a5);
  return MEMORY[0x270F9A758]();
}

void sub_25455B120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25455B134(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 16))
  {
    id v7 = LBFLogContextBiomeManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_ERROR)) {
      sub_254585944(v7);
    }
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v8 = objc_msgSend_source(*(void **)(v6 + 8), a2, a3, a4, a5);
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;
}

void sub_25455B3E8(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    int v9 = 134217984;
    uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8);
    _os_log_impl(&dword_254547000, v4, OS_LOG_TYPE_INFO, "Completed with %ld events.", (uint8_t *)&v9, 0xCu);
  }
}

void sub_25455B4A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);
}

void sub_25455B624()
{
  v0 = LBFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_254547000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

uint64_t sub_25455B68C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = objc_msgSend_eventBody(a2, (const char *)a2, a3, a4, a5);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  return v7;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOEventStatusReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 8) = v26;
      }
      else if (v17 == 2)
      {
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v30;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + 24) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerLighthousePluginEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 100) {
        break;
      }
      switch(v18)
      {
        case 1:
          unint64_t v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 48), v22);
          if (!PBReaderPlaceMark()
            || !LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v22, a2))
          {
            goto LABEL_44;
          }
LABEL_37:
          PBReaderRecallMark();

          break;
        case 2:
          uint64_t v24 = PBReaderReadString();
          unsigned int v25 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v24;

          break;
        case 3:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          *(void *)(a1 + 8) = v21;
          break;
        default:
          goto LABEL_38;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    switch(v18)
    {
      case 'e':
        unint64_t v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        uint64_t v23 = 24;
        break;
      case 'f':
        unint64_t v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        uint64_t v23 = 32;
        break;
      case 'g':
        unint64_t v22 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOEventStatus);
        uint64_t v23 = 40;
        break;
      default:
LABEL_38:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_42;
    }
    objc_storeStrong((id *)(a1 + v23), v22);
    if (!PBReaderPlaceMark() || (LIGHTHOUSE_BITACORA_PROTOEventStatusReadFrom((uint64_t)v22, a2) & 1) == 0)
    {
LABEL_44:

      return 0;
    }
    goto LABEL_37;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unint64_t v18 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 32), v18);
          if (PBReaderPlaceMark()
            && LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v20;

          continue;
        case 3u:
          *(unsigned char *)(a1 + 44) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v24 = 0;
          }
          *(void *)(a1 + 8) = v24;
          continue;
        case 4u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v27) = 0;
          }
LABEL_45:
          *(_DWORD *)(a1 + 24) = v27;
          continue;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        uint64_t v36 = *(void *)(a2 + v35);
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)(a2 + *v4)) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0) {
          goto LABEL_47;
        }
        v32 += 7;
        BOOL v15 = v33++ >= 9;
        if (v15)
        {
          uint64_t v34 = 0;
          goto LABEL_49;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v34 = 0;
      }
LABEL_49:
      *(unsigned char *)(a1 + 40) = v34 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_25455F7B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void LBFLoggingUtilsInit()
{
  if (qword_26B269D68 != -1) {
    dispatch_once(&qword_26B269D68, &unk_2703DD298);
  }
}

uint64_t sub_25455F808()
{
  os_log_t v0 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventManager);
  v1 = (void *)LBFLogContextEventManager;
  LBFLogContextEventManager = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryAggregator);
  v3 = (void *)LBFLogContextAggregator;
  LBFLogContextAggregator = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventFiltering);
  uint64_t v5 = (void *)LBFLogContextEventFiltering;
  LBFLogContextEventFiltering = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBiomeManager);
  uint64_t v7 = (void *)LBFLogContextBiomeManager;
  LBFLogContextBiomeManager = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryEventsHolder);
  uint64_t v9 = (void *)LBFLogContextEventsHolder;
  LBFLogContextEventsHolder = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBiomeConverter);
  uint64_t v11 = (void *)LBFLogContextBiomeConverter;
  LBFLogContextBiomeConverter = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryProtoConverter);
  unint64_t v13 = (void *)LBFLogContextProtoConverter;
  LBFLogContextProtoConverter = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBitacoraStateInfo);
  BOOL v15 = (void *)LBFLogContextBitacoraStateInfo;
  LBFLogContextBitacoraStateInfo = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryTrialStatusDetector);
  unint64_t v17 = (void *)LBFLogContextTrialStatusDetector;
  LBFLogContextTrialStatusDetector = (uint64_t)v16;

  os_log_t v18 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryBitacoraStateTransition);
  uint64_t v19 = (void *)LBFLogContextBitacoraStateTransition;
  LBFLogContextBitacoraStateTransition = (uint64_t)v18;

  os_log_t v20 = os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryStateDetector);
  uint64_t v21 = (void *)LBFLogContextStateDetector;
  LBFLogContextStateDetector = (uint64_t)v20;

  LBFLogContextTrialIdentifires = (uint64_t)os_log_create((const char *)LRRLoggingSubsystem, (const char *)LRRLoggingCategoryTrialIdentifires);
  return MEMORY[0x270F9A758]();
}

id sub_25456009C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t LIGHTHOUSE_BITACORA_PROTOBitacoraStateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x269E07000uLL;
  unint64_t v8 = 0x269E07000uLL;
  uint64_t v9 = (int *)MEMORY[0x263F62268];
  unint64_t v10 = 0x269E07000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    unint64_t v20 = v13 >> 3;
    if ((int)(v13 >> 3) > 300)
    {
      if ((v13 >> 3) <= 0x12C)
      {
        switch((int)v20)
        {
          case 301:
            char v29 = 0;
            unsigned int v30 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x800u;
            while (2)
            {
              uint64_t v31 = *v3;
              unint64_t v32 = *(void *)(a2 + v31);
              if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v33 = *(unsigned char *)(*(void *)(a2 + *v9) + v32);
                *(void *)(a2 + v31) = v32 + 1;
                v23 |= (unint64_t)(v33 & 0x7F) << v29;
                if (v33 < 0)
                {
                  v29 += 7;
                  BOOL v17 = v30++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_173;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_173:
            uint64_t v123 = 68;
            goto LABEL_239;
          case 302:
            char v67 = 0;
            unsigned int v68 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x400u;
            while (2)
            {
              uint64_t v69 = *v3;
              unint64_t v70 = *(void *)(a2 + v69);
              if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v71 = *(unsigned char *)(*(void *)(a2 + *v9) + v70);
                *(void *)(a2 + v69) = v70 + 1;
                v23 |= (unint64_t)(v71 & 0x7F) << v67;
                if (v71 < 0)
                {
                  v67 += 7;
                  BOOL v17 = v68++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_198;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_198:
            uint64_t v123 = 64;
            goto LABEL_239;
          case 303:
            char v72 = 0;
            unsigned int v73 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x2000u;
            while (2)
            {
              uint64_t v74 = *v3;
              unint64_t v75 = *(void *)(a2 + v74);
              if (v75 == -1 || v75 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v76 = *(unsigned char *)(*(void *)(a2 + *v9) + v75);
                *(void *)(a2 + v74) = v75 + 1;
                v23 |= (unint64_t)(v76 & 0x7F) << v72;
                if (v76 < 0)
                {
                  v72 += 7;
                  BOOL v17 = v73++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_202;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_202:
            uint64_t v123 = 76;
            goto LABEL_239;
          case 304:
            char v77 = 0;
            unsigned int v78 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x1000u;
            while (2)
            {
              uint64_t v79 = *v3;
              unint64_t v80 = *(void *)(a2 + v79);
              if (v80 == -1 || v80 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v81 = *(unsigned char *)(*(void *)(a2 + *v9) + v80);
                *(void *)(a2 + v79) = v80 + 1;
                v23 |= (unint64_t)(v81 & 0x7F) << v77;
                if (v81 < 0)
                {
                  v77 += 7;
                  BOOL v17 = v78++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_206;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_206:
            uint64_t v123 = 72;
            goto LABEL_239;
          case 305:
            char v82 = 0;
            unsigned int v83 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x200u;
            while (2)
            {
              uint64_t v84 = *v3;
              unint64_t v85 = *(void *)(a2 + v84);
              if (v85 == -1 || v85 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v86 = *(unsigned char *)(*(void *)(a2 + *v9) + v85);
                *(void *)(a2 + v84) = v85 + 1;
                v23 |= (unint64_t)(v86 & 0x7F) << v82;
                if (v86 < 0)
                {
                  v82 += 7;
                  BOOL v17 = v83++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_210;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_210:
            uint64_t v123 = 60;
            goto LABEL_239;
          case 306:
            char v87 = 0;
            unsigned int v88 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x100u;
            break;
          default:
            JUMPOUT(0);
        }
        while (1)
        {
          uint64_t v89 = *v3;
          unint64_t v90 = *(void *)(a2 + v89);
          if (v90 == -1 || v90 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v91 = *(unsigned char *)(*(void *)(a2 + *v9) + v90);
          *(void *)(a2 + v89) = v90 + 1;
          v23 |= (unint64_t)(v91 & 0x7F) << v87;
          if ((v91 & 0x80) == 0) {
            goto LABEL_212;
          }
          v87 += 7;
          BOOL v17 = v88++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_214;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_212:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_214:
        uint64_t v123 = 56;
      }
      else
      {
        switch((int)v20)
        {
          case 501:
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x4000u;
            while (2)
            {
              uint64_t v24 = *v3;
              unint64_t v25 = *(void *)(a2 + v24);
              if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v26 = *(unsigned char *)(*(void *)(a2 + *v9) + v25);
                *(void *)(a2 + v24) = v25 + 1;
                v23 |= (unint64_t)(v26 & 0x7F) << v21;
                if (v26 < 0)
                {
                  v21 += 7;
                  BOOL v17 = v22++ >= 9;
                  if (v17)
                  {
                    LODWORD(v23) = 0;
                    goto LABEL_169;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v23) = 0;
            }
LABEL_169:
            uint64_t v123 = 104;
            goto LABEL_239;
          case 502:
            uint64_t v27 = PBReaderReadString();
            uint64_t v28 = 96;
            goto LABEL_79;
          case 503:
            uint64_t v27 = PBReaderReadString();
            uint64_t v28 = 88;
            goto LABEL_79;
          case 504:
            uint64_t v27 = PBReaderReadString();
            uint64_t v28 = 128;
            goto LABEL_79;
          case 505:
            uint64_t v27 = PBReaderReadString();
            uint64_t v28 = 120;
            goto LABEL_79;
          default:
            switch((int)v20)
            {
              case 401:
                char v39 = 0;
                unsigned int v40 = 0;
                uint64_t v23 = 0;
                *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x20u;
                while (2)
                {
                  uint64_t v41 = *v3;
                  unint64_t v42 = *(void *)(a2 + v41);
                  if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
                  {
                    *(unsigned char *)(a2 + *v5) = 1;
                  }
                  else
                  {
                    char v43 = *(unsigned char *)(*(void *)(a2 + *v9) + v42);
                    *(void *)(a2 + v41) = v42 + 1;
                    v23 |= (unint64_t)(v43 & 0x7F) << v39;
                    if (v43 < 0)
                    {
                      v39 += 7;
                      BOOL v17 = v40++ >= 9;
                      if (v17)
                      {
                        LODWORD(v23) = 0;
                        goto LABEL_181;
                      }
                      continue;
                    }
                  }
                  break;
                }
                if (*(unsigned char *)(a2 + *v5)) {
                  LODWORD(v23) = 0;
                }
LABEL_181:
                uint64_t v123 = 44;
                goto LABEL_239;
              case 402:
                char v107 = 0;
                unsigned int v108 = 0;
                uint64_t v23 = 0;
                *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x10u;
                while (2)
                {
                  uint64_t v109 = *v3;
                  unint64_t v110 = *(void *)(a2 + v109);
                  if (v110 == -1 || v110 >= *(void *)(a2 + *v4))
                  {
                    *(unsigned char *)(a2 + *v5) = 1;
                  }
                  else
                  {
                    char v111 = *(unsigned char *)(*(void *)(a2 + *v9) + v110);
                    *(void *)(a2 + v109) = v110 + 1;
                    v23 |= (unint64_t)(v111 & 0x7F) << v107;
                    if (v111 < 0)
                    {
                      v107 += 7;
                      BOOL v17 = v108++ >= 9;
                      if (v17)
                      {
                        LODWORD(v23) = 0;
                        goto LABEL_230;
                      }
                      continue;
                    }
                  }
                  break;
                }
                if (*(unsigned char *)(a2 + *v5)) {
                  LODWORD(v23) = 0;
                }
LABEL_230:
                uint64_t v123 = 40;
                goto LABEL_239;
              case 403:
                char v112 = 0;
                unsigned int v113 = 0;
                uint64_t v23 = 0;
                *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x80u;
                while (2)
                {
                  uint64_t v114 = *v3;
                  unint64_t v115 = *(void *)(a2 + v114);
                  if (v115 == -1 || v115 >= *(void *)(a2 + *v4))
                  {
                    *(unsigned char *)(a2 + *v5) = 1;
                  }
                  else
                  {
                    char v116 = *(unsigned char *)(*(void *)(a2 + *v9) + v115);
                    *(void *)(a2 + v114) = v115 + 1;
                    v23 |= (unint64_t)(v116 & 0x7F) << v112;
                    if (v116 < 0)
                    {
                      v112 += 7;
                      BOOL v17 = v113++ >= 9;
                      if (v17)
                      {
                        LODWORD(v23) = 0;
                        goto LABEL_234;
                      }
                      continue;
                    }
                  }
                  break;
                }
                if (*(unsigned char *)(a2 + *v5)) {
                  LODWORD(v23) = 0;
                }
LABEL_234:
                uint64_t v123 = 52;
                goto LABEL_239;
              case 404:
                char v117 = 0;
                unsigned int v118 = 0;
                uint64_t v23 = 0;
                *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x40u;
                break;
              default:
                goto LABEL_164;
            }
            break;
        }
        while (1)
        {
          uint64_t v119 = *v3;
          unint64_t v120 = *(void *)(a2 + v119);
          if (v120 == -1 || v120 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v121 = *(unsigned char *)(*(void *)(a2 + *v9) + v120);
          *(void *)(a2 + v119) = v120 + 1;
          v23 |= (unint64_t)(v121 & 0x7F) << v117;
          if ((v121 & 0x80) == 0) {
            goto LABEL_236;
          }
          v117 += 7;
          BOOL v17 = v118++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_238;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_236:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_238:
        uint64_t v123 = 48;
      }
LABEL_239:
      *(_DWORD *)(a1 + v123) = v23;
      goto LABEL_240;
    }
    if ((int)v20 > 101)
    {
      switch((int)v20)
      {
        case 201:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v23 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 4u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v9) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v23 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_177;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_177:
          uint64_t v123 = 32;
          goto LABEL_239;
        case 202:
          char v92 = 0;
          unsigned int v93 = 0;
          uint64_t v23 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 8u;
          while (2)
          {
            uint64_t v94 = *v3;
            unint64_t v95 = *(void *)(a2 + v94);
            if (v95 == -1 || v95 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v96 = *(unsigned char *)(*(void *)(a2 + *v9) + v95);
              *(void *)(a2 + v94) = v95 + 1;
              v23 |= (unint64_t)(v96 & 0x7F) << v92;
              if (v96 < 0)
              {
                v92 += 7;
                BOOL v17 = v93++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_218:
          uint64_t v123 = 36;
          goto LABEL_239;
        case 203:
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v23 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 1u;
          while (2)
          {
            uint64_t v99 = *v3;
            unint64_t v100 = *(void *)(a2 + v99);
            if (v100 == -1 || v100 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v101 = *(unsigned char *)(*(void *)(a2 + *v9) + v100);
              *(void *)(a2 + v99) = v100 + 1;
              v23 |= (unint64_t)(v101 & 0x7F) << v97;
              if (v101 < 0)
              {
                v97 += 7;
                BOOL v17 = v98++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_222;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_222:
          uint64_t v123 = 24;
          goto LABEL_239;
        case 204:
          char v102 = 0;
          unsigned int v103 = 0;
          uint64_t v23 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 2u;
          while (2)
          {
            uint64_t v104 = *v3;
            unint64_t v105 = *(void *)(a2 + v104);
            if (v105 == -1 || v105 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v106 = *(unsigned char *)(*(void *)(a2 + *v9) + v105);
              *(void *)(a2 + v104) = v105 + 1;
              v23 |= (unint64_t)(v106 & 0x7F) << v102;
              if (v106 < 0)
              {
                v102 += 7;
                BOOL v17 = v103++ >= 9;
                if (v17)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_226;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_226:
          uint64_t v123 = 28;
          goto LABEL_239;
        default:
          if (v20 == 102)
          {
            char v50 = 0;
            unsigned int v51 = 0;
            uint64_t v52 = 0;
            *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x8000u;
            while (1)
            {
              uint64_t v53 = *v3;
              unint64_t v54 = *(void *)(a2 + v53);
              if (v54 == -1 || v54 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v55 = *(unsigned char *)(*(void *)(a2 + *v9) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if ((v55 & 0x80) == 0) {
                goto LABEL_187;
              }
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                uint64_t v52 = 0;
                goto LABEL_189;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_187:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v52 = 0;
            }
LABEL_189:
            BOOL v124 = v52 != 0;
            uint64_t v125 = 136;
LABEL_190:
            *(unsigned char *)(a1 + v125) = v124;
          }
          else
          {
LABEL_164:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          break;
      }
      goto LABEL_240;
    }
    switch((int)v20)
    {
      case 1:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = *(int *)(v10 + 3788);
        goto LABEL_79;
      case 2:
        unint64_t v56 = v7;
        unint64_t v57 = v10;
        unint64_t v58 = v8;
        uint64_t v59 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
        objc_storeStrong((id *)(a1 + 112), v59);
        if (PBReaderPlaceMark()
          && LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v59, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v58;
          unint64_t v10 = v57;
          unint64_t v7 = v56;
LABEL_240:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = 16;
LABEL_79:
        uint64_t v60 = *(void **)(a1 + v28);
        *(void *)(a1 + v28) = v27;

        goto LABEL_240;
      case 4:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v63 = 0;
        while (2)
        {
          uint64_t v64 = *v3;
          unint64_t v65 = *(void *)(a2 + v64);
          if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v66 = *(unsigned char *)(*(void *)(a2 + *v9) + v65);
            *(void *)(a2 + v64) = v65 + 1;
            v63 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              BOOL v17 = v62++ >= 9;
              if (v17)
              {
                uint64_t v63 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v63 = 0;
        }
LABEL_194:
        *(void *)(a1 + 8) = v63;
        goto LABEL_240;
      default:
        if (v20 != 101) {
          goto LABEL_164;
        }
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(_DWORD *)(a1 + *(int *)(v7 + 3700)) |= 0x10000u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v17 = v45++ >= 9;
              if (v17)
              {
                uint64_t v46 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v46 = 0;
        }
LABEL_185:
        BOOL v124 = v46 != 0;
        uint64_t v125 = *(int *)(v8 + 3704);
        goto LABEL_190;
    }
  }
}

uint64_t sub_254563BAC()
{
  qword_26B269D88 = objc_alloc_init(LBFEventManager);
  return MEMORY[0x270F9A758]();
}

void sub_254563D08(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_25458636C();
  }
  os_log_t v2 = [LBFBiomeManager alloc];
  v3 = BiomeLibrary();
  unint64_t v8 = objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  unint64_t v13 = objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  int v18 = objc_msgSend_LighthousePluginEvent(v13, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 8);
  *(void *)(v23 + 8) = v22;
}

void sub_254563E78(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_2545863A0();
  }
  os_log_t v2 = [LBFBiomeManager alloc];
  v3 = BiomeLibrary();
  unint64_t v8 = objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  unint64_t v13 = objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  int v18 = objc_msgSend_TrialdEvent(v13, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 16);
  *(void *)(v23 + 16) = v22;
}

void sub_254563FE8(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_2545863D4();
  }
  os_log_t v2 = [LBFBiomeManager alloc];
  v3 = BiomeLibrary();
  unint64_t v8 = objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  unint64_t v13 = objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  int v18 = objc_msgSend_MlruntimedEvent(v13, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 24);
  *(void *)(v23 + 24) = v22;
}

void sub_254564158(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32)
    && os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
  {
    sub_254586408();
  }
  os_log_t v2 = [LBFBiomeManager alloc];
  v3 = BiomeLibrary();
  unint64_t v8 = objc_msgSend_Lighthouse(v3, v4, v5, v6, v7);
  unint64_t v13 = objc_msgSend_Ledger(v8, v9, v10, v11, v12);
  int v18 = objc_msgSend_DediscoPrivacyEvent(v13, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_init_(v2, v19, (uint64_t)v18, v20, v21);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 32);
  *(void *)(v23 + 32) = v22;
}

uint64_t sub_254564F58(uint64_t *a1, void *a2)
{
  id v3 = a2;
  unint64_t v8 = v3;
  if (a1[4]
    && (uint64_t v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !v9))
  {
    uint64_t v37 = 1;
  }
  else
  {
    unint64_t v13 = (void *)a1[5];
    uint64_t v14 = objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    int v18 = objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);

    if (objc_msgSend_eventType(v8, v19, v20, v21, v22) == 1)
    {
      uint64_t v27 = [LBFTrialEvent alloc];
      uint64_t v32 = objc_msgSend_eventSucceeded(v8, v28, v29, v30, v31);
      uint64_t v36 = objc_msgSend_initWithAllocation_(v27, v33, v32, v34, v35);
    }
    else
    {
      uint64_t v36 = 0;
    }
    if (objc_msgSend_eventType(v8, v23, v24, v25, v26) == 2)
    {
      unint64_t v42 = [LBFTrialEvent alloc];
      uint64_t v47 = objc_msgSend_eventSucceeded(v8, v43, v44, v45, v46);
      uint64_t v51 = objc_msgSend_initWithActivation_(v42, v48, v47, v49, v50);

      uint64_t v36 = (void *)v51;
    }
    if (objc_msgSend_eventType(v8, v38, v39, v40, v41) == 3)
    {
      unint64_t v56 = [LBFTrialEvent alloc];
      uint64_t v61 = objc_msgSend_eventSucceeded(v8, v57, v58, v59, v60);
      uint64_t v65 = objc_msgSend_initWithDeactivation_(v56, v62, v61, v63, v64);

      uint64_t v36 = (void *)v65;
    }
    uint64_t v66 = a1[6];
    char v67 = objc_msgSend_timestamp(v8, v52, v53, v54, v55);
    uint64_t v37 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v66 + 16))(v66, v18, v36, v67);
  }
  return v37;
}

void sub_25456520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_254565224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_254565234(uint64_t a1)
{
}

uint64_t sub_25456523C(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t sub_25456539C(uint64_t *a1, void *a2)
{
  id v3 = a2;
  unint64_t v8 = v3;
  if (a1[4]
    && (uint64_t v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !v9))
  {
    uint64_t v103 = 1;
  }
  else
  {
    unint64_t v13 = (void *)a1[5];
    uint64_t v14 = objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    int v18 = objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);

    uint64_t v23 = objc_msgSend_performTaskStatus(v8, v19, v20, v21, v22);

    if (v23)
    {
      uint64_t v28 = objc_msgSend_performTaskStatus(v8, v24, v25, v26, v27);
      char v33 = objc_msgSend_errorDomain(v28, v29, v30, v31, v32);

      if (v33)
      {
        id v34 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v39 = objc_msgSend_performTaskStatus(v8, v35, v36, v37, v38);
        uint64_t v44 = objc_msgSend_errorDomain(v39, v40, v41, v42, v43);
        uint64_t v49 = objc_msgSend_performTaskStatus(v8, v45, v46, v47, v48);
        int v54 = objc_msgSend_errorCode(v49, v50, v51, v52, v53);
        char v33 = objc_msgSend_initWithDomain_code_userInfo_(v34, v55, (uint64_t)v44, v54, 0);
      }
      unint64_t v56 = [LBFLighthouseEvent alloc];
      uint64_t v61 = objc_msgSend_performTaskStatus(v8, v57, v58, v59, v60);
      uint64_t v66 = objc_msgSend_succeeded(v61, v62, v63, v64, v65);
      uint64_t v23 = objc_msgSend_initWithPerformTaskStatus_error_(v56, v67, v66, (uint64_t)v33, v68);
    }
    uint64_t v69 = objc_msgSend_performTrialTaskStatus(v8, v24, v25, v26, v27);

    if (v69)
    {
      uint64_t v74 = objc_msgSend_performTrialTaskStatus(v8, v70, v71, v72, v73);
      uint64_t v79 = objc_msgSend_errorDomain(v74, v75, v76, v77, v78);

      if (v79)
      {
        id v80 = objc_alloc(MEMORY[0x263F087E8]);
        unint64_t v85 = objc_msgSend_performTrialTaskStatus(v8, v81, v82, v83, v84);
        unint64_t v90 = objc_msgSend_errorDomain(v85, v86, v87, v88, v89);
        unint64_t v95 = objc_msgSend_performTrialTaskStatus(v8, v91, v92, v93, v94);
        int v100 = objc_msgSend_errorCode(v95, v96, v97, v98, v99);
        char v102 = objc_msgSend_initWithDomain_code_userInfo_(v80, v101, (uint64_t)v90, v100, 0);
      }
      else
      {
        char v102 = 0;
      }
      uint64_t v104 = [LBFLighthouseEvent alloc];
      uint64_t v109 = objc_msgSend_performTrialTaskStatus(v8, v105, v106, v107, v108);
      uint64_t v114 = objc_msgSend_succeeded(v109, v110, v111, v112, v113);
      uint64_t v117 = objc_msgSend_initWithPerformTrialTaskStatus_error_(v104, v115, v114, (uint64_t)v102, v116);

      uint64_t v23 = (void *)v117;
    }
    unsigned int v118 = objc_msgSend_stop(v8, v70, v71, v72, v73);

    if (v118)
    {
      uint64_t v123 = objc_msgSend_stop(v8, v119, v120, v121, v122);
      uint64_t v128 = objc_msgSend_errorDomain(v123, v124, v125, v126, v127);

      if (v128)
      {
        id v129 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v134 = objc_msgSend_stop(v8, v130, v131, v132, v133);
        v139 = objc_msgSend_errorDomain(v134, v135, v136, v137, v138);
        uint64_t v144 = objc_msgSend_stop(v8, v140, v141, v142, v143);
        int v149 = objc_msgSend_errorCode(v144, v145, v146, v147, v148);
        v151 = objc_msgSend_initWithDomain_code_userInfo_(v129, v150, (uint64_t)v139, v149, 0);
      }
      else
      {
        v151 = 0;
      }
      v152 = [LBFLighthouseEvent alloc];
      long long v157 = objc_msgSend_stop(v8, v153, v154, v155, v156);
      uint64_t v162 = objc_msgSend_succeeded(v157, v158, v159, v160, v161);
      uint64_t v165 = objc_msgSend_initWithStop_error_(v152, v163, v162, (uint64_t)v151, v164);

      uint64_t v23 = (void *)v165;
    }
    uint64_t v166 = a1[6];
    v167 = objc_msgSend_timestamp(v8, v119, v120, v121, v122);
    uint64_t v103 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v166 + 16))(v166, v18, v23, v167);
  }
  return v103;
}

void sub_25456586C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_254565884(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t sub_2545659E4(uint64_t *a1, void *a2)
{
  id v3 = a2;
  unint64_t v8 = v3;
  if (a1[4]
    && (uint64_t v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !v9))
  {
    uint64_t v76 = 1;
  }
  else
  {
    unint64_t v13 = (void *)a1[5];
    uint64_t v14 = objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    int v18 = objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);

    uint64_t v23 = objc_msgSend_activityScheduleStatus(v8, v19, v20, v21, v22);

    if (v23)
    {
      uint64_t v28 = [LBFMLRuntimedEvent alloc];
      char v33 = objc_msgSend_activityScheduleStatus(v8, v29, v30, v31, v32);
      uint64_t v38 = objc_msgSend_scheduled(v33, v34, v35, v36, v37);
      uint64_t v23 = objc_msgSend_initWithScheduleStatus_(v28, v39, v38, v40, v41);
    }
    uint64_t v42 = objc_msgSend_taskFetched(v8, v24, v25, v26, v27);

    if (v42)
    {
      uint64_t v47 = objc_msgSend_taskFetched(v8, v43, v44, v45, v46);
      uint64_t v52 = objc_msgSend_errorDomain(v47, v48, v49, v50, v51);

      if (v52)
      {
        id v53 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v58 = objc_msgSend_taskFetched(v8, v54, v55, v56, v57);
        uint64_t v63 = objc_msgSend_errorDomain(v58, v59, v60, v61, v62);
        uint64_t v68 = objc_msgSend_taskFetched(v8, v64, v65, v66, v67);
        int v73 = objc_msgSend_errorCode(v68, v69, v70, v71, v72);
        unint64_t v75 = objc_msgSend_initWithDomain_code_userInfo_(v53, v74, (uint64_t)v63, v73, 0);
      }
      else
      {
        unint64_t v75 = 0;
      }
      uint64_t v77 = [LBFMLRuntimedEvent alloc];
      uint64_t v82 = objc_msgSend_taskFetched(v8, v78, v79, v80, v81);
      uint64_t v87 = objc_msgSend_succeeded(v82, v83, v84, v85, v86);
      uint64_t v90 = objc_msgSend_initWithTaskFetched_error_(v77, v88, v87, (uint64_t)v75, v89);

      uint64_t v23 = (void *)v90;
    }
    char v91 = objc_msgSend_taskScheduled(v8, v43, v44, v45, v46);

    if (v91)
    {
      char v96 = objc_msgSend_taskScheduled(v8, v92, v93, v94, v95);
      char v101 = objc_msgSend_errorDomain(v96, v97, v98, v99, v100);

      if (v101)
      {
        id v102 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v107 = objc_msgSend_taskScheduled(v8, v103, v104, v105, v106);
        uint64_t v112 = objc_msgSend_errorDomain(v107, v108, v109, v110, v111);
        uint64_t v117 = objc_msgSend_taskScheduled(v8, v113, v114, v115, v116);
        int v122 = objc_msgSend_errorCode(v117, v118, v119, v120, v121);
        BOOL v124 = objc_msgSend_initWithDomain_code_userInfo_(v102, v123, (uint64_t)v112, v122, 0);
      }
      else
      {
        BOOL v124 = 0;
      }
      uint64_t v125 = [LBFMLRuntimedEvent alloc];
      v130 = objc_msgSend_taskScheduled(v8, v126, v127, v128, v129);
      uint64_t v135 = objc_msgSend_succeeded(v130, v131, v132, v133, v134);
      uint64_t v138 = objc_msgSend_initWithTaskScheduled_error_(v125, v136, v135, (uint64_t)v124, v137);

      uint64_t v23 = (void *)v138;
    }
    v139 = objc_msgSend_taskCompleted(v8, v92, v93, v94, v95);

    if (v139)
    {
      uint64_t v144 = objc_msgSend_taskCompleted(v8, v140, v141, v142, v143);
      int v149 = objc_msgSend_errorDomain(v144, v145, v146, v147, v148);

      if (v149)
      {
        id v150 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v155 = objc_msgSend_taskCompleted(v8, v151, v152, v153, v154);
        uint64_t v160 = objc_msgSend_errorDomain(v155, v156, v157, v158, v159);
        uint64_t v165 = objc_msgSend_taskCompleted(v8, v161, v162, v163, v164);
        int v170 = objc_msgSend_errorCode(v165, v166, v167, v168, v169);
        v172 = objc_msgSend_initWithDomain_code_userInfo_(v150, v171, (uint64_t)v160, v170, 0);
      }
      else
      {
        v172 = 0;
      }
      v173 = [LBFMLRuntimedEvent alloc];
      v178 = objc_msgSend_taskCompleted(v8, v174, v175, v176, v177);
      uint64_t v183 = objc_msgSend_succeeded(v178, v179, v180, v181, v182);
      uint64_t v186 = objc_msgSend_initWithTaskCompleted_error_(v173, v184, v183, (uint64_t)v172, v185);

      uint64_t v23 = (void *)v186;
    }
    uint64_t v187 = a1[6];
    v188 = objc_msgSend_timestamp(v8, v140, v141, v142, v143);
    uint64_t v76 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v187 + 16))(v187, v18, v23, v188);
  }
  return v76;
}

void sub_254565F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_254565F28(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t sub_254566088(uint64_t *a1, void *a2)
{
  id v3 = a2;
  unint64_t v8 = v3;
  if (a1[4]
    && (uint64_t v9 = (void *)a1[5],
        objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend_isEqualIdentifiers_identifiers_(v9, v11, (uint64_t)v10, a1[4], v12),
        v10,
        !v9))
  {
    uint64_t v41 = 1;
  }
  else
  {
    unint64_t v13 = (void *)a1[5];
    uint64_t v14 = objc_msgSend_trialIdentifiers(v8, v4, v5, v6, v7);
    uint64_t v87 = objc_msgSend_convertToLBFTrialIdentifiers_(v13, v15, (uint64_t)v14, v16, v17);

    uint64_t v22 = objc_msgSend_event(v8, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_errorMessage(v22, v23, v24, v25, v26);

    if (v27)
    {
      id v28 = objc_alloc(MEMORY[0x263F087E8]);
      char v33 = objc_msgSend_event(v8, v29, v30, v31, v32);
      uint64_t v38 = objc_msgSend_errorMessage(v33, v34, v35, v36, v37);
      uint64_t v40 = objc_msgSend_initWithDomain_code_userInfo_(v28, v39, (uint64_t)v38, 0, 0);
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v42 = [LBFDprivacydEvent alloc];
    uint64_t v47 = objc_msgSend_event(v8, v43, v44, v45, v46);
    uint64_t v52 = objc_msgSend_phase(v47, v48, v49, v50, v51);
    uint64_t v57 = objc_msgSend_eventIdentifier(v8, v53, v54, v55, v56);
    uint64_t v62 = objc_msgSend_event(v8, v58, v59, v60, v61);
    uint64_t v67 = objc_msgSend_succeeded(v62, v63, v64, v65, v66);
    uint64_t v72 = objc_msgSend_aggregateFunction(v8, v68, v69, v70, v71);
    uint64_t v77 = objc_msgSend_count(v8, v73, v74, v75, v76);
    uint64_t v79 = objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_aggregateFunction_count_(v42, v78, v52, (uint64_t)v57, v67, v40, v72, v77);

    uint64_t v80 = a1[6];
    uint64_t v85 = objc_msgSend_timestamp(v8, v81, v82, v83, v84);
    uint64_t v41 = (*(uint64_t (**)(uint64_t, void *, void *, void *))(v80 + 16))(v80, v87, v79, v85);
  }
  return v41;
}

void sub_2545663B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2545663CC(uint64_t a1, int a2, id obj)
{
  return 0;
}

void sub_2545664A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2545667A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_25456712C()
{
  return v0;
}

uint64_t sub_254567144()
{
  return v0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEventReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 100) {
        break;
      }
      switch(v18)
      {
        case 1:
          uint64_t v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
          objc_storeStrong((id *)(a1 + 56), v19);
          if (!PBReaderPlaceMark()
            || !LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom((uint64_t)v19, a2))
          {
            goto LABEL_46;
          }
LABEL_37:
          PBReaderRecallMark();

          break;
        case 2:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v25;

          break;
        case 3:
          *(unsigned char *)(a1 + 64) |= 1u;
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v22 = 0;
          }
          *(void *)(a1 + 8) = v22;
          break;
        default:
LABEL_40:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          break;
      }
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    switch((int)v18)
    {
      case 'e':
        uint64_t v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOScheduleStatus);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark()
          || (LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_37;
      case 'f':
        uint64_t v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        uint64_t v23 = 40;
        break;
      case 'g':
        uint64_t v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        uint64_t v23 = 48;
        break;
      case 'h':
        uint64_t v19 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOTaskEvent);
        uint64_t v23 = 32;
        break;
      default:
        goto LABEL_40;
    }
    objc_storeStrong((id *)(a1 + v23), v19);
    if (!PBReaderPlaceMark() || (LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom((uint64_t)v19, a2) & 1) == 0)
    {
LABEL_46:

      return 0;
    }
    goto LABEL_37;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiersReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  os_log_t v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || !LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiersReadFrom((uint64_t)v17, a2))
        {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v17 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiersReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL sub_25456AEF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25456AF08(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25457D544();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_25456AF58(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_25456AF60@<X0>(unint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25457ACF8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_25456AF88()
{
  return *v0;
}

unint64_t sub_25456AF90@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_25457ACF8(*a1);
  *a2 = result;
  return result;
}

void sub_25456AFBC(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_25456AFC8(void *a1@<X8>)
{
  *a1 = &unk_2703DD178;
}

uint64_t sub_25456AFD8()
{
  return sub_2545870B0();
}

uint64_t sub_25456B03C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25457D598();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25456B088()
{
  return sub_2545870B0();
}

unint64_t sub_25456B0E8@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 3;
  if (result < 3) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t *sub_25456B0FC@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_25456B114(void *a1@<X8>)
{
  *a1 = &unk_2703DD230;
}

uint64_t sub_25456B124()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0A998);
  sub_25457AC5C(v0, (uint64_t)qword_269E0A998);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "experimentIdentifiers";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  unsigned int v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "bmltIdentifiers";
  *((void *)v10 + 1) = 15;
  v10[16] = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_25456B2DC()
{
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_25456B420();
    }
    else if (result == 1)
    {
      sub_25456B370();
    }
  }
  return result;
}

uint64_t sub_25456B370()
{
  return sub_254586EB0();
}

uint64_t sub_25456B420()
{
  return sub_254586EB0();
}

uint64_t sub_25456B4D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25456B540(v3, a1, a2, a3);
  if (!v4)
  {
    sub_25456B744(v3, a1, a2, a3);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_25456B540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  sub_25457523C(&qword_269E08270);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_25457D420(a1 + *(int *)(v11 + 20), (uint64_t)v6, &qword_269E08270);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_25457D4E8((uint64_t)v6, &qword_269E08270);
  }
  sub_25457ABF4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  sub_254579F7C(&qword_269E083E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_25456B744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  sub_25457523C(&qword_269E08278);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_25457D420(a1 + *(int *)(v11 + 24), (uint64_t)v6, &qword_269E08278);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_25457D4E8((uint64_t)v6, &qword_269E08278);
  }
  sub_25457ABF4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_254579F7C(&qword_269E083C0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_25456B94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_254586DA0();
  uint64_t v4 = a2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = a2 + *(int *)(a1 + 24);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(v6, 1, 1, v7);
}

unint64_t sub_25456BA18()
{
  return 0xD00000000000003ALL;
}

uint64_t (*sub_25456BA40())()
{
  return nullsub_1;
}

uint64_t sub_25456BA64()
{
  return sub_25456B2DC();
}

uint64_t sub_25456BA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25456B4D0(a1, a2, a3);
}

uint64_t sub_25456BA98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E08438, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25456BB18@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08058, (uint64_t)qword_269E0A998, a1);
}

uint64_t sub_25456BB3C(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25456BBAC()
{
  sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  return sub_254586F00();
}

uint64_t sub_25456BC30(uint64_t a1)
{
  return sub_25456C2A4(a1, 0xD000000000000016, 0x800000025458D140, qword_269E0A9B0, &qword_269E0A9B0[1]);
}

uint64_t sub_25456BC58()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0A9C0);
  sub_25457AC5C(v0, (uint64_t)qword_269E0A9C0);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "trialExperimentID";
  *(void *)(v6 + 8) = 17;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "trialDeploymentID";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "trialTreatmentID";
  *(void *)(v11 + 8) = 16;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_25456BE5C()
{
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 3 || result == 2 || result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      sub_254586E90();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t sub_25456BF24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25456C610(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  if (!v4)
  {
    sub_25456C68C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    sub_25456BFD4(v3);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_25456BFD4(uint64_t a1)
{
  uint64_t result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  if (*(void *)(a1 + *(int *)(result + 28) + 8)) {
    return sub_254586F50();
  }
  return result;
}

uint64_t sub_25456C050@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_254586DA0();
  uint64_t v5 = a1[6];
  unint64_t v6 = (void *)(a2 + a1[5]);
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (void *)(a2 + a1[7]);
  *uint64_t v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_25456C098(uint64_t a1, uint64_t a2)
{
  return sub_254571D98(a1, a2, &qword_269E08060, qword_269E0A9B0);
}

uint64_t sub_25456C0C0()
{
  return sub_25456BE5C();
}

uint64_t sub_25456C0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25456BF24(a1, a2, a3);
}

uint64_t sub_25456C0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E08468, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25456C16C@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08068, (uint64_t)qword_269E0A9C0, a1);
}

uint64_t sub_25456C190(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E083E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25456C1FC()
{
  sub_254579F7C(&qword_269E083E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
  return sub_254586F00();
}

uint64_t sub_25456C27C(uint64_t a1)
{
  return sub_25456C2A4(a1, 0xD000000000000010, 0x800000025458D1C0, qword_269E0A9D8, &qword_269E0A9D8[1]);
}

uint64_t sub_25456C2A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = sub_254587030();
  *a4 = 0xD00000000000003ALL;
  *a5 = 0x800000025458D0D0;
  return result;
}

uint64_t sub_25456C310()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0A9E8);
  sub_25457AC5C(v0, (uint64_t)qword_269E0A9E8);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "trialTaskID";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "trialDeploymentID";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_25456C4C8()
{
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2 || result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      sub_254586E90();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t sub_25456C578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25456C610(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  if (!v4)
  {
    sub_25456C68C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_25456C610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if (*(void *)(a1 + *(int *)(result + 20) + 8)) {
    return sub_254586F50();
  }
  return result;
}

uint64_t sub_25456C68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if (*(void *)(a1 + *(int *)(result + 24) + 8)) {
    return sub_254586F50();
  }
  return result;
}

uint64_t sub_25456C708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_254586DA0();
  uint64_t v5 = *(int *)(a1 + 24);
  unint64_t v6 = (void *)(a2 + *(int *)(a1 + 20));
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t sub_25456C744(uint64_t a1, uint64_t a2)
{
  return sub_254571D98(a1, a2, &qword_269E08070, qword_269E0A9D8);
}

uint64_t sub_25456C76C()
{
  return sub_25456C4C8();
}

uint64_t sub_25456C784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25456C578(a1, a2, a3);
}

uint64_t sub_25456C79C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E08470, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25456C818@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08078, (uint64_t)qword_269E0A9E8, a1);
}

uint64_t sub_25456C83C(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E083C0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25456C8A8()
{
  sub_254579F7C(&qword_269E083C0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  return sub_254586F00();
}

uint64_t sub_25456C928()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AA00);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AA00);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2545899F0;
  unint64_t v4 = v18 + v3 + v1[14];
  *(void *)(v18 + v3) = 1;
  *(void *)unint64_t v4 = "trialIdentifiers";
  *(void *)(v4 + 8) = 16;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_254586F90();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v18 + v3 + v2 + v1[14];
  *(void *)(v18 + v3 + v2) = 2;
  *(void *)unint64_t v8 = "contextID";
  *(void *)(v8 + 8) = 9;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v18 + v3 + 2 * v2);
  unint64_t v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 3;
  *(void *)unint64_t v10 = "timestamp";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v18 + v3 + 3 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 101;
  *(void *)unint64_t v12 = "performTaskStatus";
  *((void *)v12 + 1) = 17;
  v12[16] = 2;
  v7();
  char v13 = (void *)(v18 + v3 + 4 * v2);
  BOOL v14 = (char *)v13 + v1[14];
  void *v13 = 102;
  *(void *)BOOL v14 = "performTrialTaskStatus";
  *((void *)v14 + 1) = 22;
  v14[16] = 2;
  v7();
  int v15 = (void *)(v18 + v3 + 5 * v2);
  int v16 = (char *)v15 + v1[14];
  *int v15 = 103;
  *(void *)int v16 = "stop";
  *((void *)v16 + 1) = 4;
  v16[16] = 2;
  v7();
  return sub_254586FA0();
}

uint64_t sub_25456CBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v4 || (v10 & 1) != 0) {
      break;
    }
    if (result > 100)
    {
      switch(result)
      {
        case 'e':
          sub_25456CE28();
          break;
        case 'f':
          sub_25456CED8();
          break;
        case 'g':
          sub_25456CF88();
          break;
      }
    }
    else
    {
      switch(result)
      {
        case 1:
          sub_25456CD74(a1, v5, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
          break;
        case 2:
          type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
          sub_254586E90();
          break;
        case 3:
          type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
          sub_254586E80();
          break;
      }
    }
    uint64_t v4 = 0;
  }
  return result;
}

uint64_t sub_25456CD74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_254586EB0();
}

uint64_t sub_25456CE28()
{
  return sub_254586EB0();
}

uint64_t sub_25456CED8()
{
  return sub_254586EB0();
}

uint64_t sub_25456CF88()
{
  return sub_254586EB0();
}

uint64_t sub_25456D038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25456D144(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  if (!v4)
  {
    sub_25456C68C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
    sub_254572590(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
    sub_25456D354(v3, a1, a2, a3);
    sub_25456D558(v3, a1, a2, a3);
    sub_25456D75C(v3, a1, a2, a3);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_25456D144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  v15[3] = a4;
  v15[1] = a3;
  sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a5(0);
  sub_25457D420(a1 + *(int *)(v13 + 20), (uint64_t)v8, &qword_269E08488);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_25457D4E8((uint64_t)v8, &qword_269E08488);
  }
  sub_25457ABF4((uint64_t)v8, (uint64_t)v12, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v12, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25456D354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  sub_25457523C(&qword_269E08480);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_25457D420(a1 + *(int *)(v11 + 32), (uint64_t)v6, &qword_269E08480);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_25457D4E8((uint64_t)v6, &qword_269E08480);
  }
  sub_25457ABF4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25456D558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  sub_25457523C(&qword_269E08480);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_25457D420(a1 + *(int *)(v11 + 36), (uint64_t)v6, &qword_269E08480);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_25457D4E8((uint64_t)v6, &qword_269E08480);
  }
  sub_25457ABF4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25456D75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  sub_25457523C(&qword_269E08480);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_25457D420(a1 + *(int *)(v11 + 40), (uint64_t)v6, &qword_269E08480);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_25457D4E8((uint64_t)v6, &qword_269E08480);
  }
  sub_25457ABF4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25456D960@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  sub_254586DA0();
  uint64_t v4 = a2 + a1[5];
  uint64_t v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = a1[7];
  uint64_t v7 = (void *)(a2 + a1[6]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = a2 + v6;
  *(void *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 8) = 1;
  uint64_t v9 = a2 + a1[8];
  uint64_t v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))v13)((void *)(v10 - 8), v9, 1, 1, v10);
  v13(a2 + a1[9], 1, 1, v10);
  uint64_t v11 = a2 + a1[10];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13)(v11, 1, 1, v10);
}

unint64_t sub_25456DAA4()
{
  return 0xD00000000000003FLL;
}

uint64_t sub_25456DAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25456CBDC(a1, a2, a3);
}

uint64_t sub_25456DAD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25456D038(a1, a2, a3);
}

uint64_t sub_25456DAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E08478, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25456DB6C@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08080, (uint64_t)qword_269E0AA00, a1);
}

uint64_t sub_25456DB90(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E083A0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25456DBFC()
{
  sub_254579F7C(&qword_269E083A0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  return sub_254586F00();
}

uint64_t sub_25456DC7C()
{
  uint64_t result = sub_254587030();
  qword_269E0AA18 = 0xD00000000000003FLL;
  unk_269E0AA20 = 0x800000025458D1E0;
  return result;
}

uint64_t sub_25456DCF0()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AA28);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AA28);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "succeeded";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "errorDomain";
  *((void *)v10 + 1) = 11;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "errorCode";
  *(void *)(v11 + 8) = 9;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_25456DEF8(uint64_t a1, uint64_t a2)
{
  return sub_254571D98(a1, a2, &qword_269E08088, &qword_269E0AA18);
}

uint64_t sub_25456DF20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254571B00(a1, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25456DF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254571C00(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25456DFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084A0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25456E01C@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08090, (uint64_t)qword_269E0AA28, a1);
}

uint64_t sub_25456E040(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25456E0AC()
{
  sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
  return sub_254586F00();
}

uint64_t sub_25456E128(uint64_t a1, uint64_t a2)
{
  return sub_25457C12C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus) & 1;
}

uint64_t sub_25456E158()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AA40);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AA40);
  sub_25457523C(&qword_269E08440);
  v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_254589A00;
  unint64_t v4 = v20 + v3 + v1[14];
  *(void *)(v20 + v3) = 1;
  *(void *)unint64_t v4 = "trialIdentifiers";
  *(void *)(v4 + 8) = 16;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_254586F90();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v20 + v3 + v2 + v1[14];
  *(void *)(v20 + v3 + v2) = 2;
  *(void *)unint64_t v8 = "contextID";
  *(void *)(v8 + 8) = 9;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v20 + v3 + 2 * v2);
  uint64_t v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 3;
  *(void *)uint64_t v10 = "timestamp";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v20 + v3 + 3 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 101;
  *(void *)unint64_t v12 = "activityScheduleStatus";
  *((void *)v12 + 1) = 22;
  v12[16] = 2;
  v7();
  uint64_t v13 = (void *)(v20 + v3 + 4 * v2);
  BOOL v14 = (char *)v13 + v1[14];
  void *v13 = 102;
  *(void *)BOOL v14 = "taskFetched";
  *((void *)v14 + 1) = 11;
  v14[16] = 2;
  v7();
  int v15 = (void *)(v20 + v3 + 5 * v2);
  int v16 = (char *)v15 + v1[14];
  *int v15 = 103;
  *(void *)int v16 = "taskScheduled";
  *((void *)v16 + 1) = 13;
  v16[16] = 2;
  v7();
  char v17 = (void *)(v20 + v3 + 6 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *char v17 = 104;
  *(void *)uint64_t v18 = "taskCompleted";
  *((void *)v18 + 1) = 13;
  v18[16] = 2;
  v7();
  return sub_254586FA0();
}

uint64_t sub_25456E448()
{
  type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(0);
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  uint64_t v2 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = (void *)(v0
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = 1;
  uint64_t v5 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  uint64_t v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v9(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled, 1, 1, v8);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v9)(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted, 1, 1, v8);
  qword_269E080A8 = v0;
  return result;
}

uint64_t sub_25456E5EC(uint64_t a1)
{
  uint64_t v3 = sub_25457523C(&qword_269E084B0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v39 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25457523C(&qword_269E084B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v41 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  unint64_t v12 = (void *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *unint64_t v12 = 0;
  v12[1] = 0;
  uint64_t v13 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(void *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 8) = 1;
  uint64_t v14 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  uint64_t v37 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  uint64_t v15 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  uint64_t v38 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  uint64_t v17 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v18 = *(void (**)(void))(*(void *)(v17 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v18)(v16, 1, 1, v17);
  uint64_t v40 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  v18();
  uint64_t v42 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  v18();
  uint64_t v19 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_25457D420(v19, (uint64_t)v9, &qword_269E08488);
  swift_beginAccess();
  sub_25457D484((uint64_t)v9, v10, &qword_269E08488);
  swift_endAccess();
  uint64_t v20 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  swift_beginAccess();
  *unint64_t v12 = v22;
  v12[1] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
  swift_beginAccess();
  uint64_t v24 = *v23;
  LOBYTE(v23) = *((unsigned char *)v23 + 8);
  swift_beginAccess();
  *(void *)uint64_t v13 = v24;
  *(unsigned char *)(v13 + 8) = (_BYTE)v23;
  uint64_t v25 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  uint64_t v26 = v41;
  sub_25457D420(v25, v41, &qword_269E084B8);
  uint64_t v27 = v37;
  swift_beginAccess();
  sub_25457D484(v26, v27, &qword_269E084B8);
  swift_endAccess();
  uint64_t v28 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  uint64_t v29 = v39;
  sub_25457D420(v28, v39, &qword_269E084B0);
  uint64_t v30 = v38;
  swift_beginAccess();
  sub_25457D484(v29, v30, &qword_269E084B0);
  swift_endAccess();
  uint64_t v31 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_25457D420(v31, v29, &qword_269E084B0);
  uint64_t v32 = v40;
  swift_beginAccess();
  sub_25457D484(v29, v32, &qword_269E084B0);
  swift_endAccess();
  uint64_t v33 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_25457D420(v33, v29, &qword_269E084B0);
  swift_release();
  uint64_t v34 = v42;
  swift_beginAccess();
  sub_25457D484(v29, v34, &qword_269E084B0);
  swift_endAccess();
  return v1;
}

uint64_t sub_25456EB48()
{
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers, &qword_269E08488);
  swift_bridgeObjectRelease();
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus, &qword_269E084B8);
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched, &qword_269E084B0);
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled, &qword_269E084B0);
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted, &qword_269E084B0);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25456EC2C()
{
  return type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(0);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08138);
}

void sub_25456EC54()
{
  sub_25456EDE4(319, &qword_269E08148, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  if (v0 <= 0x3F)
  {
    sub_25456EDE4(319, &qword_269E08150, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
    if (v1 <= 0x3F)
    {
      sub_25456EDE4(319, &qword_269E08158, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08280);
}

void sub_25456EDE4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_254587040();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08260);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08250);
}

uint64_t sub_25456EE78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_254586E40();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result <= 100)
      {
        switch(result)
        {
          case 1:
            sub_25456F024();
            break;
          case 2:
            sub_254577E34();
            break;
          case 3:
            sub_254577C08(a2, a1, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp, MEMORY[0x263F50648]);
            break;
        }
      }
      else
      {
        switch(result)
        {
          case 'e':
            sub_25456F0F4();
            break;
          case 'f':
            sub_25456F1C4();
            break;
          case 'g':
            sub_25456F294();
            break;
          case 'h':
            sub_25456F364();
            break;
          default:
            break;
        }
      }
      uint64_t result = sub_254586E40();
    }
  }
  return result;
}

uint64_t sub_25456F024()
{
  return swift_endAccess();
}

uint64_t sub_25456F0F4()
{
  return swift_endAccess();
}

uint64_t sub_25456F1C4()
{
  return swift_endAccess();
}

uint64_t sub_25456F294()
{
  return swift_endAccess();
}

uint64_t sub_25456F364()
{
  return swift_endAccess();
}

uint64_t sub_25456F434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_25456F508(a1, a2, a3, a4);
  if (!v4)
  {
    sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
    sub_25456F724(a1);
    sub_25456F7B0(a1, a2, a3, a4);
    sub_25456F9CC(a1, a2, a3, a4);
    sub_25456FBE8(a1, a2, a3, a4);
    return sub_25456FE04(a1, a2, a3, a4);
  }
  return result;
}

uint64_t sub_25456F508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E08488);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E08488);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25456F724(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 8) & 1) == 0) {
    return sub_254586F40();
  }
  return result;
}

uint64_t sub_25456F7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E084B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E084B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E084B8);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_254579F7C(&qword_269E08340, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_25456F9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E084B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E084B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E084B0);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25456FBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E084B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E084B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E084B0);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25456FE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E084B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E084B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E084B0);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

BOOL sub_254570020(uint64_t a1, uint64_t a2)
{
  uint64_t v144 = a2;
  uint64_t v3 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v134 = v3;
  uint64_t v135 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v127 = (uint64_t)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_25457523C(&qword_269E084C0);
  uint64_t v6 = MEMORY[0x270FA5388](v133);
  uint64_t v123 = (uint64_t)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v126 = (uint64_t)&v122 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v130 = (uint64_t)&v122 - v10;
  uint64_t v11 = sub_25457523C(&qword_269E084B0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v122 = (uint64_t)&v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v125 = (char *)&v122 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v124 = (uint64_t)&v122 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v131 = (uint64_t)&v122 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v128 = (uint64_t)&v122 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v141 = (uint64_t)&v122 - v22;
  uint64_t v23 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
  uint64_t v137 = *(void *)(v23 - 8);
  uint64_t v138 = v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v129 = (uint64_t)&v122 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_25457523C(&qword_269E084C8);
  MEMORY[0x270FA5388](v136);
  uint64_t v139 = (uint64_t)&v122 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_25457523C(&qword_269E084B8);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v132 = (uint64_t)&v122 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v142 = (uint64_t)&v122 - v29;
  uint64_t v30 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v140 = (uint64_t)&v122 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_25457523C(&qword_269E08498);
  uint64_t v34 = v33 - 8;
  MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)&v122 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_25457523C(&qword_269E08488);
  uint64_t v38 = MEMORY[0x270FA5388](v37 - 8);
  uint64_t v143 = (uint64_t)&v122 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v122 - v40;
  uint64_t v42 = a1;
  uint64_t v43 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_25457D420(v43, (uint64_t)v41, &qword_269E08488);
  uint64_t v44 = v144;
  uint64_t v45 = v144
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  uint64_t v46 = (uint64_t)&v36[*(int *)(v34 + 56)];
  sub_25457D420((uint64_t)v41, (uint64_t)v36, &qword_269E08488);
  sub_25457D420(v45, v46, &qword_269E08488);
  uint64_t v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  if (v47((uint64_t)v36, 1, v30) == 1)
  {
    swift_retain();
    swift_retain();
    sub_25457D4E8((uint64_t)v41, &qword_269E08488);
    uint64_t v48 = v44;
    uint64_t v49 = v42;
    if (v47(v46, 1, v30) == 1)
    {
      sub_25457D4E8((uint64_t)v36, &qword_269E08488);
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v52 = &qword_269E08498;
    uint64_t v53 = (uint64_t)v36;
LABEL_7:
    sub_25457D4E8(v53, v52);
LABEL_8:
    swift_release();
    swift_release();
    return 0;
  }
  uint64_t v50 = v42;
  uint64_t v51 = v143;
  sub_25457D420((uint64_t)v36, v143, &qword_269E08488);
  if (v47(v46, 1, v30) == 1)
  {
    swift_retain();
    swift_retain();
    sub_25457D4E8((uint64_t)v41, &qword_269E08488);
    sub_254575BF8(v51, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  uint64_t v55 = v46;
  uint64_t v56 = v140;
  sub_25457ABF4(v55, v140, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  uint64_t v49 = v50;
  swift_retain();
  uint64_t v48 = v44;
  swift_retain();
  char v57 = sub_25457CBE0(v51, v56);
  sub_254575BF8(v56, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v41, &qword_269E08488);
  sub_254575BF8(v51, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v36, &qword_269E08488);
  if ((v57 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v58 = (uint64_t *)(v49
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  uint64_t v59 = *v58;
  uint64_t v60 = v58[1];
  uint64_t v61 = (void *)(v48
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  uint64_t v62 = v61[1];
  if (v60)
  {
    uint64_t v63 = v141;
    uint64_t v64 = v142;
    if (!v62 || (v59 != *v61 || v60 != v62) && (sub_254587070() & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v63 = v141;
    uint64_t v64 = v142;
    if (v62) {
      goto LABEL_8;
    }
  }
  uint64_t v65 = v49
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  double v66 = *(double *)v65;
  char v67 = *(unsigned char *)(v65 + 8);
  uint64_t v68 = v48
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  if (v67)
  {
    if ((*(unsigned char *)(v68 + 8) & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)(v68 + 8) & 1) != 0 || v66 != *(double *)v68)
  {
    goto LABEL_8;
  }
  uint64_t v69 = v49
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  sub_25457D420(v69, v64, &qword_269E084B8);
  uint64_t v70 = v48
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__activityScheduleStatus;
  swift_beginAccess();
  uint64_t v71 = v139;
  uint64_t v72 = v139 + *(int *)(v136 + 48);
  sub_25457D420(v64, v139, &qword_269E084B8);
  uint64_t v73 = v70;
  uint64_t v74 = v71;
  sub_25457D420(v73, v72, &qword_269E084B8);
  uint64_t v75 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v137 + 48);
  uint64_t v76 = v71;
  uint64_t v77 = v138;
  if (v75(v76, 1, v138) == 1)
  {
    sub_25457D4E8(v64, &qword_269E084B8);
    if (v75(v72, 1, v77) == 1)
    {
      sub_25457D4E8(v74, &qword_269E084B8);
      goto LABEL_30;
    }
LABEL_28:
    uint64_t v52 = &qword_269E084C8;
LABEL_43:
    uint64_t v53 = v74;
    goto LABEL_7;
  }
  uint64_t v78 = v132;
  sub_25457D420(v74, v132, &qword_269E084B8);
  if (v75(v72, 1, v77) == 1)
  {
    sub_25457D4E8(v142, &qword_269E084B8);
    sub_254575BF8(v78, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
    goto LABEL_28;
  }
  uint64_t v79 = v129;
  sub_25457ABF4(v72, v129, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  char v80 = sub_25457BF58(v78, v79);
  sub_254575BF8(v79, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_25457D4E8(v142, &qword_269E084B8);
  sub_254575BF8(v78, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  sub_25457D4E8(v74, &qword_269E084B8);
  if ((v80 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_30:
  uint64_t v81 = v49
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  sub_25457D420(v81, v63, &qword_269E084B0);
  uint64_t v82 = v48
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskFetched;
  swift_beginAccess();
  uint64_t v83 = v130;
  uint64_t v84 = v130 + *(int *)(v133 + 48);
  sub_25457D420(v63, v130, &qword_269E084B0);
  uint64_t v85 = v82;
  uint64_t v74 = v83;
  sub_25457D420(v85, v84, &qword_269E084B0);
  uint64_t v86 = v63;
  uint64_t v87 = v134;
  uint64_t v88 = v135 + 48;
  uint64_t v89 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v135 + 48);
  if (v89(v74, 1, v134) == 1)
  {
    sub_25457D4E8(v86, &qword_269E084B0);
    int v90 = v89(v84, 1, v87);
    uint64_t v91 = v131;
    if (v90 != 1)
    {
LABEL_42:
      uint64_t v52 = &qword_269E084C0;
      goto LABEL_43;
    }
    uint64_t v135 = v88;
    sub_25457D4E8(v74, &qword_269E084B0);
  }
  else
  {
    uint64_t v92 = v128;
    sub_25457D420(v74, v128, &qword_269E084B0);
    int v93 = v89(v84, 1, v87);
    uint64_t v91 = v131;
    if (v93 == 1)
    {
      sub_25457D4E8(v141, &qword_269E084B0);
      uint64_t v94 = v92;
LABEL_41:
      sub_254575BF8(v94, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      goto LABEL_42;
    }
    uint64_t v135 = v88;
    uint64_t v95 = v74;
    uint64_t v96 = v127;
    sub_25457ABF4(v84, v127, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    char v97 = sub_25457C12C(v92, v96, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_254575BF8(v96, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_25457D4E8(v141, &qword_269E084B0);
    sub_254575BF8(v92, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_25457D4E8(v95, &qword_269E084B0);
    if ((v97 & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v98 = v49
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  sub_25457D420(v98, v91, &qword_269E084B0);
  uint64_t v99 = v48
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskScheduled;
  swift_beginAccess();
  uint64_t v100 = v91;
  uint64_t v101 = v126;
  uint64_t v102 = v126 + *(int *)(v133 + 48);
  sub_25457D420(v100, v126, &qword_269E084B0);
  uint64_t v103 = v99;
  uint64_t v74 = v101;
  sub_25457D420(v103, v102, &qword_269E084B0);
  uint64_t v104 = v134;
  if (v89(v101, 1, v134) == 1)
  {
    sub_25457D4E8(v100, &qword_269E084B0);
    if (v89(v102, 1, v104) == 1)
    {
      sub_25457D4E8(v101, &qword_269E084B0);
      uint64_t v105 = (uint64_t)v125;
      goto LABEL_45;
    }
    goto LABEL_42;
  }
  uint64_t v106 = v101;
  uint64_t v107 = v124;
  sub_25457D420(v106, v124, &qword_269E084B0);
  int v108 = v89(v102, 1, v104);
  uint64_t v105 = (uint64_t)v125;
  if (v108 == 1)
  {
    sub_25457D4E8(v131, &qword_269E084B0);
    uint64_t v94 = v107;
    goto LABEL_41;
  }
  uint64_t v109 = v74;
  uint64_t v110 = v127;
  sub_25457ABF4(v102, v127, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  char v111 = sub_25457C12C(v107, v110, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_254575BF8(v110, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_25457D4E8(v131, &qword_269E084B0);
  sub_254575BF8(v107, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  sub_25457D4E8(v109, &qword_269E084B0);
  if ((v111 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_45:
  uint64_t v112 = v49
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  sub_25457D420(v112, v105, &qword_269E084B0);
  uint64_t v113 = v48
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework55LighthouseBitacoraProto_LighthouseLedgerMlruntimedEventP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__taskCompleted;
  swift_beginAccess();
  uint64_t v114 = v123;
  uint64_t v115 = v123 + *(int *)(v133 + 48);
  sub_25457D420(v105, v123, &qword_269E084B0);
  uint64_t v116 = v114;
  sub_25457D420(v113, v115, &qword_269E084B0);
  uint64_t v117 = v134;
  if (v89(v114, 1, v134) != 1)
  {
    uint64_t v118 = v114;
    uint64_t v119 = v122;
    sub_25457D420(v118, v122, &qword_269E084B0);
    if (v89(v115, 1, v117) == 1)
    {
      swift_release();
      swift_release();
      sub_25457D4E8(v105, &qword_269E084B0);
      sub_254575BF8(v119, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
      goto LABEL_50;
    }
    uint64_t v120 = v127;
    sub_25457ABF4(v115, v127, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    char v121 = sub_25457C12C(v119, v120, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    swift_release();
    swift_release();
    sub_254575BF8(v120, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_25457D4E8(v105, &qword_269E084B0);
    sub_254575BF8(v119, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
    sub_25457D4E8(v116, &qword_269E084B0);
    return (v121 & 1) != 0;
  }
  swift_release();
  swift_release();
  sub_25457D4E8(v105, &qword_269E084B0);
  if (v89(v115, 1, v117) != 1)
  {
LABEL_50:
    sub_25457D4E8(v116, &qword_269E084C0);
    return 0;
  }
  sub_25457D4E8(v114, &qword_269E084B0);
  return 1;
}

uint64_t sub_25457106C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2545797A0(a1, &qword_269E080A0, &qword_269E080A8, a2);
}

unint64_t sub_254571090()
{
  return 0xD000000000000039;
}

uint64_t sub_2545710AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2545774F8(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent._StorageClass, sub_25456E5EC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25456EE78);
}

uint64_t sub_254571114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254577EB8(a1, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25456F434);
}

uint64_t sub_254571154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084A8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2545711D0@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E08098, (uint64_t)qword_269E0AA40, a1);
}

uint64_t sub_2545711F4(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08360, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_254571260()
{
  sub_254579F7C(&qword_269E08360, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  return sub_254586F00();
}

uint64_t sub_2545712DC(uint64_t a1, uint64_t a2)
{
  return sub_25457BD5C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent, (uint64_t (*)(uint64_t, uint64_t))sub_254570020) & 1;
}

uint64_t sub_254571320()
{
  uint64_t result = sub_254587030();
  qword_269E0AA58 = 0xD000000000000039;
  unk_269E0AA60 = 0x800000025458D2A0;
  return result;
}

uint64_t sub_254571398()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AA68);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AA68);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_254589A10;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "scheduled";
  *(void *)(v4 + 8) = 9;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_254586F90();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_254586FA0();
}

uint64_t sub_2545714F4()
{
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1)
    {
      type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0);
      sub_254586E50();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t sub_25457158C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_2545715F8(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  if (!v4) {
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_2545715F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 20)) != 2) {
    return sub_254586F10();
  }
  return result;
}

uint64_t sub_254571674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_254586DA0();
  *(unsigned char *)(a2 + *(int *)(a1 + 20)) = 2;
  return result;
}

uint64_t sub_2545716A8(uint64_t a1, uint64_t a2)
{
  return sub_254571D98(a1, a2, &qword_269E080B0, &qword_269E0AA58);
}

uint64_t sub_2545716D0()
{
  return sub_2545714F4();
}

uint64_t sub_2545716E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25457158C(a1, a2, a3);
}

uint64_t sub_254571700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084D0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25457177C@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080B8, (uint64_t)qword_269E0AA68, a1);
}

uint64_t sub_2545717A0(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08340, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25457180C()
{
  sub_254579F7C(&qword_269E08340, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
  return sub_254586F00();
}

uint64_t sub_25457188C()
{
  uint64_t result = sub_254587030();
  qword_269E0AA80 = 0xD000000000000039;
  *(void *)algn_269E0AA88 = 0x800000025458D2A0;
  return result;
}

uint64_t sub_2545718FC()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AA90);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AA90);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "succeeded";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "errorDomain";
  *((void *)v10 + 1) = 11;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "errorCode";
  *(void *)(v11 + 8) = 9;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_254571B00(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  while (1)
  {
    uint64_t result = sub_254586E40();
    uint64_t v6 = v4;
    if (v4 || (v8 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 3:
        a4(0);
        sub_254586E70();
LABEL_3:
        uint64_t v6 = 0;
        break;
      case 2:
        a4(0);
        sub_254586E90();
        goto LABEL_3;
      case 1:
        a4(0);
        sub_254586E50();
        goto LABEL_3;
    }
    uint64_t v4 = v6;
  }
}

uint64_t sub_254571C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t result = sub_2545715F8(v6, a1, a2, a3, a4);
  if (!v7)
  {
    sub_25456C68C(v6, a1, a2, a3, a5);
    sub_254571CA4(v6, a1, a2, a3, a6);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_254571CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 28) + 4) & 1) == 0) {
    return sub_254586F30();
  }
  return result;
}

uint64_t sub_254571D20@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_254586DA0();
  uint64_t v5 = a1[6];
  *(unsigned char *)(a2 + a1[5]) = 2;
  uint64_t v6 = (void *)(a2 + v5);
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = a2 + a1[7];
  *(_DWORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 4) = 1;
  return result;
}

uint64_t sub_254571D70(uint64_t a1, uint64_t a2)
{
  return sub_254571D98(a1, a2, &qword_269E080C0, &qword_269E0AA80);
}

uint64_t sub_254571D98(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_254571DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254571B00(a1, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_254571E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254571C00(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_254571E70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084D8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_254571EEC@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080C8, (uint64_t)qword_269E0AA90, a1);
}

uint64_t sub_254571F10(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_254571F7C()
{
  sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
  return sub_254586F00();
}

uint64_t sub_254571FF8(uint64_t a1, uint64_t a2)
{
  return sub_25457C12C(a1, a2, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent) & 1;
}

uint64_t sub_254572028()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AAA8);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AAA8);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_254589A20;
  unint64_t v4 = v16 + v3;
  unint64_t v5 = v16 + v3 + v1[14];
  *(void *)(v16 + v3) = 1;
  *(void *)unint64_t v5 = "trialIdentifiers";
  *(void *)(v5 + 8) = 16;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_254586F90();
  char v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "contextID";
  *(void *)(v9 + 8) = 9;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 3;
  *(void *)uint64_t v11 = "timestamp";
  *((void *)v11 + 1) = 9;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "eventType";
  *((void *)v13 + 1) = 9;
  v13[16] = 2;
  v8();
  uint64_t v14 = v4 + 4 * v2 + v1[14];
  *(void *)(v4 + 4 * v2) = 5;
  *(void *)uint64_t v14 = "eventSucceeded";
  *(void *)(v14 + 8) = 14;
  *(unsigned char *)(v14 + 16) = 2;
  v8();
  return sub_254586FA0();
}

uint64_t sub_2545722A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  while (1)
  {
    uint64_t result = sub_254586E40();
    if (v4 || (v10 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        sub_25456CD74(a1, v5, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
        break;
      case 2:
        type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
        sub_254586E90();
        break;
      case 3:
        type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
        sub_254586E80();
        break;
      case 4:
        sub_254572424();
        break;
      case 5:
        type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
        sub_254586E50();
        break;
      default:
        continue;
    }
  }
}

uint64_t sub_254572424()
{
  return sub_254586E60();
}

uint64_t sub_25457249C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25456D144(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  if (!v4)
  {
    sub_25456C68C(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
    sub_254572590(v3, a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
    sub_25457260C(v3);
    sub_254572698(v3);
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_254572590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 28) + 8) & 1) == 0) {
    return sub_254586F40();
  }
  return result;
}

uint64_t sub_25457260C(uint64_t a1)
{
  uint64_t result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 32)) != 4)
  {
    sub_25457D544();
    return sub_254586F20();
  }
  return result;
}

uint64_t sub_254572698(uint64_t a1)
{
  uint64_t result = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  if (*(unsigned char *)(a1 + *(int *)(result + 36)) != 2) {
    return sub_254586F10();
  }
  return result;
}

uint64_t sub_254572710@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  sub_254586DA0();
  uint64_t v4 = a2 + a1[5];
  uint64_t v5 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v7 = a1[7];
  char v8 = (void *)(a2 + a1[6]);
  *char v8 = 0;
  v8[1] = 0;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v10 = a1[9];
  *(unsigned char *)(a2 + a1[8]) = 4;
  *(unsigned char *)(a2 + v10) = 2;
  return result;
}

unint64_t sub_2545727B8()
{
  return 0xD000000000000035;
}

uint64_t sub_2545727D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2545722A0(a1, a2, a3);
}

uint64_t sub_2545727EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25457249C(a1, a2, a3);
}

uint64_t sub_254572804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_254572880@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080D0, (uint64_t)qword_269E0AAA8, a1);
}

uint64_t sub_2545728A4(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E08300, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_254572910()
{
  sub_254579F7C(&qword_269E08300, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  return sub_254586F00();
}

uint64_t sub_254572990()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AAC0);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AAC0);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_254589A30;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "Unknown";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "allocation";
  *(void *)(v10 + 8) = 10;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 2;
  *(void *)uint64_t v12 = "activation";
  *((void *)v12 + 1) = 10;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)uint64_t v14 = "deactivation";
  *((void *)v14 + 1) = 12;
  v14[16] = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_254572BC8@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080D8, (uint64_t)qword_269E0AAC0, a1);
}

uint64_t sub_254572BEC()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AAD8);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AAD8);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_254589A40;
  unint64_t v4 = v55 + v3;
  unint64_t v5 = v55 + v3 + v1[14];
  *(void *)(v55 + v3) = 1;
  *(void *)unint64_t v5 = "telemetryID";
  *(void *)(v5 + 8) = 11;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_254586F90();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "trialIdentifiers";
  *(void *)(v9 + 8) = 16;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *unint64_t v10 = 3;
  *(void *)uint64_t v11 = "contextID";
  *((void *)v11 + 1) = 9;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "timestamp";
  *((void *)v13 + 1) = 9;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  void *v14 = 101;
  *(void *)uint64_t v15 = "isAllocated";
  *((void *)v15 + 1) = 11;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 102;
  *(void *)uint64_t v17 = "isActivated";
  *((void *)v17 + 1) = 11;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  void *v18 = 201;
  *(void *)uint64_t v19 = "countGeneralTargetting";
  *((void *)v19 + 1) = 22;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 202;
  *(void *)uint64_t v21 = "countGeneralTargettingMet";
  *((void *)v21 + 1) = 25;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 203;
  *(void *)uint64_t v22 = "countCustomTargetting";
  *(void *)(v22 + 8) = 21;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 204;
  *(void *)uint64_t v24 = "countCustomTargettingMet";
  *((void *)v24 + 1) = 24;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v4 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 301;
  *(void *)uint64_t v26 = "countTaskFetchedSucceeded";
  *((void *)v26 + 1) = 25;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v4 + 11 * v2);
  uint64_t v28 = (char *)v27 + v1[14];
  *uint64_t v27 = 302;
  *(void *)uint64_t v28 = "countTaskFetchedFailed";
  *((void *)v28 + 1) = 22;
  v28[16] = 2;
  v8();
  uint64_t v29 = (void *)(v4 + 12 * v2);
  uint64_t v30 = (char *)v29 + v1[14];
  void *v29 = 303;
  *(void *)uint64_t v30 = "countTaskScheduledSucceeded";
  *((void *)v30 + 1) = 27;
  v30[16] = 2;
  v8();
  uint64_t v31 = (void *)(v4 + 13 * v2);
  uint64_t v32 = (char *)v31 + v1[14];
  *uint64_t v31 = 304;
  *(void *)uint64_t v32 = "countTaskScheduledFailed";
  *((void *)v32 + 1) = 24;
  v32[16] = 2;
  v8();
  uint64_t v33 = (void *)(v4 + 14 * v2);
  uint64_t v34 = (char *)v33 + v1[14];
  *uint64_t v33 = 305;
  *(void *)uint64_t v34 = "countTaskCompletedSucceeded";
  *((void *)v34 + 1) = 27;
  v34[16] = 2;
  v8();
  uint64_t v35 = (void *)(v4 + 15 * v2);
  uint64_t v36 = (char *)v35 + v1[14];
  void *v35 = 306;
  *(void *)uint64_t v36 = "countTaskCompletedFailed";
  *((void *)v36 + 1) = 24;
  v36[16] = 2;
  v8();
  uint64_t v37 = v4 + 16 * v2 + v1[14];
  *(void *)(v4 + 16 * v2) = 401;
  *(void *)uint64_t v37 = "countPerformTaskSucceeded";
  *(void *)(v37 + 8) = 25;
  *(unsigned char *)(v37 + 16) = 2;
  v8();
  uint64_t v38 = (void *)(v4 + 17 * v2);
  uint64_t v39 = (char *)v38 + v1[14];
  *uint64_t v38 = 402;
  *(void *)uint64_t v39 = "countPerformTaskFailed";
  *((void *)v39 + 1) = 22;
  v39[16] = 2;
  v8();
  uint64_t v40 = (void *)(v4 + 18 * v2);
  uint64_t v41 = (char *)v40 + v1[14];
  void *v40 = 403;
  *(void *)uint64_t v41 = "countStopSucceeded";
  *((void *)v41 + 1) = 18;
  v41[16] = 2;
  v8();
  uint64_t v42 = (void *)(v4 + 19 * v2);
  uint64_t v43 = (char *)v42 + v1[14];
  void *v42 = 404;
  *(void *)uint64_t v43 = "countStopFailed";
  *((void *)v43 + 1) = 15;
  v43[16] = 2;
  v8();
  uint64_t v44 = (void *)(v4 + 20 * v2);
  uint64_t v45 = (char *)v44 + v1[14];
  *uint64_t v44 = 501;
  *(void *)uint64_t v45 = "trialIdentifierType";
  *((void *)v45 + 1) = 19;
  v45[16] = 2;
  v8();
  uint64_t v46 = (void *)(v4 + 21 * v2);
  uint64_t v47 = (char *)v46 + v1[14];
  *uint64_t v46 = 502;
  *(void *)uint64_t v47 = "trialExperimentID";
  *((void *)v47 + 1) = 17;
  v47[16] = 2;
  v8();
  uint64_t v48 = (void *)(v4 + 22 * v2);
  uint64_t v49 = (char *)v48 + v1[14];
  *uint64_t v48 = 503;
  *(void *)uint64_t v49 = "trialDeploymentID";
  *((void *)v49 + 1) = 17;
  v49[16] = 2;
  v8();
  uint64_t v50 = (void *)(v4 + 23 * v2);
  uint64_t v51 = (char *)v50 + v1[14];
  *uint64_t v50 = 504;
  *(void *)uint64_t v51 = "trialTreatmentID";
  *((void *)v51 + 1) = 16;
  v51[16] = 2;
  v8();
  uint64_t v52 = (void *)(v4 + 24 * v2);
  uint64_t v53 = (char *)v52 + v1[14];
  void *v52 = 505;
  *(void *)uint64_t v53 = "trialTaskID";
  *((void *)v53 + 1) = 11;
  v53[16] = 2;
  v8();
  return sub_254586FA0();
}

uint64_t sub_254573348()
{
  type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(0);
  swift_allocObject();
  uint64_t result = sub_254573388();
  qword_269E080F0 = result;
  return result;
}

uint64_t sub_254573388()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  uint64_t v2 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  unint64_t v3 = (void *)(v0
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = 1;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated) = 2;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated) = 2;
  uint64_t v5 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  *(_DWORD *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 4) = 1;
  uint64_t v6 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  *(_DWORD *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 4) = 1;
  uint64_t v7 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  *(_DWORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 4) = 1;
  uint64_t v8 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  *(_DWORD *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 4) = 1;
  uint64_t v9 = v0
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  *(_DWORD *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 4) = 1;
  uint64_t v10 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  *(_DWORD *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 4) = 1;
  uint64_t v11 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  *(_DWORD *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 4) = 1;
  uint64_t v12 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  *(_DWORD *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 4) = 1;
  uint64_t v13 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  *(_DWORD *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 4) = 1;
  uint64_t v14 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  *(_DWORD *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 4) = 1;
  uint64_t v15 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  *(_DWORD *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 4) = 1;
  uint64_t v16 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  *(_DWORD *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 4) = 1;
  uint64_t v17 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  *(_DWORD *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 4) = 1;
  uint64_t v18 = v0
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  *(_DWORD *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 4) = 1;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType) = 3;
  uint64_t v19 = (void *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  void *v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  void *v20 = 0;
  v20[1] = 0;
  uint64_t v21 = (void *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  *uint64_t v21 = 0;
  v21[1] = 0;
  uint64_t v22 = (void *)(v0
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  *uint64_t v22 = 0;
  v22[1] = 0;
  return v0;
}

uint64_t sub_2545735AC(uint64_t a1)
{
  uint64_t v3 = sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v90 = (uint64_t)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = 0;
  uint64_t v5 = v1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  uint64_t v89 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  uint64_t v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (void *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = v1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  *(void *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 8) = 1;
  uint64_t v91 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated) = 2;
  uint64_t v9 = (unsigned char *)(v1
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
  *uint64_t v9 = 2;
  uint64_t v10 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  *(_DWORD *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 4) = 1;
  uint64_t v11 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  uint64_t v92 = v9;
  uint64_t v93 = v11;
  *(_DWORD *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 4) = 1;
  uint64_t v12 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  uint64_t v94 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  *(_DWORD *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 4) = 1;
  uint64_t v13 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  uint64_t v95 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  *(_DWORD *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 4) = 1;
  uint64_t v14 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  uint64_t v96 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  *(_DWORD *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 4) = 1;
  uint64_t v15 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  uint64_t v97 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  *(_DWORD *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 4) = 1;
  uint64_t v16 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  uint64_t v98 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  *(_DWORD *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 4) = 1;
  uint64_t v17 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  uint64_t v99 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  *(_DWORD *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 4) = 1;
  uint64_t v18 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  uint64_t v100 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  *(_DWORD *)uint64_t v18 = 0;
  *(unsigned char *)(v18 + 4) = 1;
  uint64_t v19 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  uint64_t v101 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  *(_DWORD *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 4) = 1;
  uint64_t v20 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  uint64_t v102 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  *(_DWORD *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 4) = 1;
  uint64_t v21 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  uint64_t v103 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  *(_DWORD *)uint64_t v21 = 0;
  *(unsigned char *)(v21 + 4) = 1;
  uint64_t v22 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  uint64_t v104 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  *(_DWORD *)uint64_t v22 = 0;
  *(unsigned char *)(v22 + 4) = 1;
  uint64_t v23 = v1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  uint64_t v105 = v1
       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  *(unsigned char *)(v23 + 4) = 1;
  *(_DWORD *)uint64_t v23 = 0;
  uint64_t v24 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  unsigned char *v24 = 3;
  uint64_t v25 = (void *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  uint64_t v106 = v24;
  uint64_t v107 = v25;
  void *v25 = 0;
  v25[1] = 0;
  uint64_t v26 = (void *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  int v108 = (void *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  *uint64_t v26 = 0;
  v26[1] = 0;
  uint64_t v27 = (void *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  uint64_t v109 = (void *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  *uint64_t v27 = 0;
  v27[1] = 0;
  uint64_t v28 = (void *)(v1
                 + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  uint64_t v110 = (void *)(v1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  *uint64_t v28 = 0;
  v28[1] = 0;
  swift_beginAccess();
  uint64_t v29 = *(void *)(a1 + 16);
  uint64_t v30 = *(void *)(a1 + 24);
  swift_beginAccess();
  *(void *)(v1 + 16) = v29;
  *(void *)(v1 + 24) = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  uint64_t v32 = v90;
  sub_25457D420(v31, v90, &qword_269E08488);
  uint64_t v33 = v89;
  swift_beginAccess();
  sub_25457D484(v32, v33, &qword_269E08488);
  swift_endAccess();
  uint64_t v34 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
  swift_beginAccess();
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  swift_beginAccess();
  *uint64_t v7 = v36;
  v7[1] = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
  swift_beginAccess();
  uint64_t v38 = *v37;
  LOBYTE(v37) = *((unsigned char *)v37 + 8);
  swift_beginAccess();
  *(void *)uint64_t v8 = v38;
  *(unsigned char *)(v8 + 8) = (_BYTE)v37;
  uint64_t v39 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
  swift_beginAccess();
  LOBYTE(v39) = *v39;
  uint64_t v40 = v91;
  swift_beginAccess();
  unsigned char *v40 = (_BYTE)v39;
  uint64_t v41 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
  swift_beginAccess();
  LOBYTE(v41) = *v41;
  uint64_t v42 = v92;
  swift_beginAccess();
  unsigned char *v42 = (_BYTE)v41;
  uint64_t v43 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v43;
  LOBYTE(v43) = *(unsigned char *)(v43 + 4);
  swift_beginAccess();
  *(_DWORD *)uint64_t v10 = v42;
  *(unsigned char *)(v10 + 4) = v43;
  uint64_t v44 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v44;
  LOBYTE(v44) = *(unsigned char *)(v44 + 4);
  uint64_t v45 = v93;
  swift_beginAccess();
  *(_DWORD *)uint64_t v45 = v42;
  *(unsigned char *)(v45 + 4) = v44;
  uint64_t v46 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v46;
  LOBYTE(v46) = *(unsigned char *)(v46 + 4);
  uint64_t v47 = v94;
  swift_beginAccess();
  *(_DWORD *)uint64_t v47 = v42;
  *(unsigned char *)(v47 + 4) = v46;
  uint64_t v48 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v48;
  LOBYTE(v48) = *(unsigned char *)(v48 + 4);
  uint64_t v49 = v95;
  swift_beginAccess();
  *(_DWORD *)uint64_t v49 = v42;
  *(unsigned char *)(v49 + 4) = v48;
  uint64_t v50 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v50;
  LOBYTE(v50) = *(unsigned char *)(v50 + 4);
  uint64_t v51 = v96;
  swift_beginAccess();
  *(_DWORD *)uint64_t v51 = v42;
  *(unsigned char *)(v51 + 4) = v50;
  uint64_t v52 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v52;
  LOBYTE(v52) = *(unsigned char *)(v52 + 4);
  uint64_t v53 = v97;
  swift_beginAccess();
  *(_DWORD *)uint64_t v53 = v42;
  *(unsigned char *)(v53 + 4) = v52;
  uint64_t v54 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v54;
  LOBYTE(v54) = *(unsigned char *)(v54 + 4);
  uint64_t v55 = v98;
  swift_beginAccess();
  *(_DWORD *)uint64_t v55 = v42;
  *(unsigned char *)(v55 + 4) = v54;
  uint64_t v56 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v56;
  LOBYTE(v56) = *(unsigned char *)(v56 + 4);
  uint64_t v57 = v99;
  swift_beginAccess();
  *(_DWORD *)uint64_t v57 = v42;
  *(unsigned char *)(v57 + 4) = v56;
  uint64_t v58 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v58;
  LOBYTE(v58) = *(unsigned char *)(v58 + 4);
  uint64_t v59 = v100;
  swift_beginAccess();
  *(_DWORD *)uint64_t v59 = v42;
  *(unsigned char *)(v59 + 4) = v58;
  uint64_t v60 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v60;
  LOBYTE(v60) = *(unsigned char *)(v60 + 4);
  uint64_t v61 = v101;
  swift_beginAccess();
  *(_DWORD *)uint64_t v61 = v42;
  *(unsigned char *)(v61 + 4) = v60;
  uint64_t v62 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v62;
  LOBYTE(v62) = *(unsigned char *)(v62 + 4);
  uint64_t v63 = v102;
  swift_beginAccess();
  *(_DWORD *)uint64_t v63 = v42;
  *(unsigned char *)(v63 + 4) = v62;
  uint64_t v64 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v64;
  LOBYTE(v64) = *(unsigned char *)(v64 + 4);
  uint64_t v65 = v103;
  swift_beginAccess();
  *(_DWORD *)uint64_t v65 = v42;
  *(unsigned char *)(v65 + 4) = v64;
  uint64_t v66 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v66;
  LOBYTE(v66) = *(unsigned char *)(v66 + 4);
  uint64_t v67 = v104;
  swift_beginAccess();
  *(_DWORD *)uint64_t v67 = v42;
  *(unsigned char *)(v67 + 4) = v66;
  uint64_t v68 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
  swift_beginAccess();
  LODWORD(v42) = *(_DWORD *)v68;
  LOBYTE(v68) = *(unsigned char *)(v68 + 4);
  uint64_t v69 = v105;
  swift_beginAccess();
  *(_DWORD *)uint64_t v69 = v42;
  *(unsigned char *)(v69 + 4) = v68;
  uint64_t v70 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  swift_beginAccess();
  LOBYTE(v70) = *v70;
  uint64_t v71 = v106;
  swift_beginAccess();
  *uint64_t v71 = (_BYTE)v70;
  uint64_t v72 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
  swift_beginAccess();
  uint64_t v74 = *v72;
  uint64_t v73 = v72[1];
  uint64_t v75 = v107;
  swift_beginAccess();
  void *v75 = v74;
  v75[1] = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v76 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
  swift_beginAccess();
  uint64_t v78 = *v76;
  uint64_t v77 = v76[1];
  uint64_t v79 = v108;
  swift_beginAccess();
  *uint64_t v79 = v78;
  v79[1] = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v80 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
  swift_beginAccess();
  uint64_t v82 = *v80;
  uint64_t v81 = v80[1];
  uint64_t v83 = v109;
  swift_beginAccess();
  *uint64_t v83 = v82;
  v83[1] = v81;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  swift_beginAccess();
  uint64_t v86 = *v84;
  uint64_t v85 = v84[1];
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v87 = v110;
  swift_beginAccess();
  void *v87 = v86;
  v87[1] = v85;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_254573FEC()
{
  swift_bridgeObjectRelease();
  sub_25457D4E8(v0+ OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers, &qword_269E08488);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2545740C4()
{
  return type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(0);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08220);
}

void sub_2545740EC()
{
  sub_25456EDE4(319, &qword_269E08148, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_254574204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254574218);
}

uint64_t sub_25457421C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254574230);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_BitacoraState(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08230);
}

uint64_t sub_254574254()
{
  return sub_254574E68();
}

unsigned char *initializeBufferWithCopyOfBuffer for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2545743D0);
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

ValueMetadata *type metadata accessor for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType()
{
  return &type metadata for LighthouseBitacoraProto_BitacoraState.TrialIdentifierType;
}

uint64_t *sub_254574408(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_2545744D4(uint64_t a1)
{
  uint64_t v2 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_254574548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_2545745C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_254574654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2545746D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_254574754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254574768);
}

uint64_t sub_25457476C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
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

uint64_t sub_25457482C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254574840);
}

uint64_t sub_254574844(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_254586DB0();
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

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08240);
}

uint64_t sub_254574938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25457494C);
}

uint64_t sub_254574950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254574964);
}

uint64_t sub_254574968()
{
  return sub_254581270();
}

void *sub_25457497C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_254574A48(uint64_t a1)
{
  uint64_t v2 = sub_254586DB0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_254574AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_254574B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_254574BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_254574C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_254574C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254574CB0);
}

uint64_t sub_254574CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_254574D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254574DA0);
}

uint64_t sub_254574DA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_254586DB0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t sub_254574E5C()
{
  return sub_254574E68();
}

uint64_t sub_254574E68()
{
  uint64_t result = sub_254586DB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_254574EF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    unsigned int v10 = (char *)a1 + v9;
    int v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v13 = *((void *)v12 - 1);
    uint64_t v45 = v8;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_25457523C(&qword_269E08270);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = v12[6];
      uint64_t v21 = &v10[v20];
      uint64_t v22 = &v11[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = v12[7];
      uint64_t v25 = &v10[v24];
      uint64_t v26 = &v11[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      uint64_t v28 = *(void (**)(char *, void, uint64_t, int *))(v13 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v10, 0, 1, v12);
    }
    uint64_t v29 = *(int *)(a3 + 24);
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = sub_25457523C(&qword_269E08278);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      v45(v30, v31, v7);
      uint64_t v35 = *(int *)(v32 + 20);
      uint64_t v36 = &v30[v35];
      uint64_t v37 = &v31[v35];
      uint64_t v38 = *((void *)v37 + 1);
      *(void *)uint64_t v36 = *(void *)v37;
      *((void *)v36 + 1) = v38;
      uint64_t v39 = *(int *)(v32 + 24);
      uint64_t v40 = &v30[v39];
      uint64_t v41 = &v31[v39];
      uint64_t v42 = *((void *)v41 + 1);
      *(void *)uint64_t v40 = *(void *)v41;
      *((void *)v40 + 1) = v42;
      uint64_t v43 = *(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v43(v30, 0, 1, v32);
    }
  }
  return a1;
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E082B0);
}

uint64_t sub_25457523C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E082A0);
}

uint64_t sub_2545752A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  if (!result)
  {
    v5(v8, v4);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25457544C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  unsigned int v10 = (char *)(a2 + v8);
  int v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v43 = (void (*)(char *, char *, uint64_t))v7;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08270);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = v11[5];
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = v11[6];
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = v11[7];
    uint64_t v23 = &v9[v22];
    uint64_t v24 = &v10[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = *(void (**)(char *, void, uint64_t, int *))(v12 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v9, 0, 1, v11);
  }
  uint64_t v27 = *(int *)(a3 + 24);
  uint64_t v28 = (char *)(a1 + v27);
  uint64_t v29 = (char *)(a2 + v27);
  uint64_t v30 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    uint64_t v32 = sub_25457523C(&qword_269E08278);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    v43(v28, v29, v6);
    uint64_t v33 = *(int *)(v30 + 20);
    uint64_t v34 = &v28[v33];
    uint64_t v35 = &v29[v33];
    uint64_t v36 = *((void *)v35 + 1);
    *(void *)uint64_t v34 = *(void *)v35;
    *((void *)v34 + 1) = v36;
    uint64_t v37 = *(int *)(v30 + 24);
    uint64_t v38 = &v28[v37];
    uint64_t v39 = &v29[v37];
    uint64_t v40 = *((void *)v39 + 1);
    *(void *)uint64_t v38 = *(void *)v39;
    *((void *)v38 + 1) = v40;
    uint64_t v41 = *(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(v28, 0, 1, v30);
  }
  return a1;
}

uint64_t sub_254575720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 24);
  v58(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v60 = a1;
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  unsigned int v10 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v8, v9, v6);
      uint64_t v15 = v10[5];
      uint64_t v16 = &v8[v15];
      uint64_t v17 = &v9[v15];
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      uint64_t v18 = v10[6];
      uint64_t v19 = &v8[v18];
      uint64_t v20 = &v9[v18];
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = *((void *)v20 + 1);
      uint64_t v21 = v10[7];
      uint64_t v22 = &v8[v21];
      uint64_t v23 = &v9[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
      uint64_t v24 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_254575BF8((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    uint64_t v25 = sub_25457523C(&qword_269E08270);
    memcpy(v8, v9, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  v58((uint64_t)v8, (uint64_t)v9, v6);
  uint64_t v43 = v10[5];
  uint64_t v44 = &v8[v43];
  uint64_t v45 = &v9[v43];
  *(void *)uint64_t v44 = *(void *)v45;
  *((void *)v44 + 1) = *((void *)v45 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = v10[6];
  uint64_t v47 = &v8[v46];
  uint64_t v48 = &v9[v46];
  *(void *)uint64_t v47 = *(void *)v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v49 = v10[7];
  uint64_t v50 = &v8[v49];
  uint64_t v51 = &v9[v49];
  *(void *)uint64_t v50 = *(void *)v51;
  *((void *)v50 + 1) = *((void *)v51 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v26 = *(int *)(a3 + 24);
  uint64_t v27 = (char *)(v60 + v26);
  uint64_t v28 = (char *)(a2 + v26);
  uint64_t v29 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  int v32 = v31(v27, 1, v29);
  int v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      v58((uint64_t)v27, (uint64_t)v28, v6);
      uint64_t v52 = *(int *)(v29 + 20);
      uint64_t v53 = &v27[v52];
      uint64_t v54 = &v28[v52];
      *(void *)uint64_t v53 = *(void *)v54;
      *((void *)v53 + 1) = *((void *)v54 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v55 = *(int *)(v29 + 24);
      uint64_t v56 = &v27[v55];
      uint64_t v57 = &v28[v55];
      *(void *)uint64_t v56 = *(void *)v57;
      *((void *)v56 + 1) = *((void *)v57 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v60;
    }
    sub_254575BF8((uint64_t)v27, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    goto LABEL_12;
  }
  if (v33)
  {
LABEL_12:
    uint64_t v41 = sub_25457523C(&qword_269E08278);
    memcpy(v27, v28, *(void *)(*(void *)(v41 - 8) + 64));
    return v60;
  }
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v27, v28, v6);
  uint64_t v34 = *(int *)(v29 + 20);
  uint64_t v35 = &v27[v34];
  uint64_t v36 = &v28[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  uint64_t v37 = *(int *)(v29 + 24);
  uint64_t v38 = &v27[v37];
  uint64_t v39 = &v28[v37];
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = *((void *)v39 + 1);
  uint64_t v40 = *(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40(v27, 0, 1, v29);
  return v60;
}

uint64_t sub_254575BF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_254575C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)(a1 + v8);
  unsigned int v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08270);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
    *(_OWORD *)&v9[v11[6]] = *(_OWORD *)&v10[v11[6]];
    *(_OWORD *)&v9[v11[7]] = *(_OWORD *)&v10[v11[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_25457523C(&qword_269E08278);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v15, (uint64_t)v16, v6);
    *(_OWORD *)&v15[*(int *)(v17 + 20)] = *(_OWORD *)&v16[*(int *)(v17 + 20)];
    *(_OWORD *)&v15[*(int *)(v17 + 24)] = *(_OWORD *)&v16[*(int *)(v17 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_254575ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v52 = *(void *)(v6 - 8);
  uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 40);
  v51(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v53 = a1;
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  unsigned int v10 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v8, v9, v6);
      *(_OWORD *)&v8[v10[5]] = *(_OWORD *)&v9[v10[5]];
      *(_OWORD *)&v8[v10[6]] = *(_OWORD *)&v9[v10[6]];
      *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
      (*(void (**)(char *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_254575BF8((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    uint64_t v15 = sub_25457523C(&qword_269E08270);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v51((uint64_t)v8, (uint64_t)v9, v6);
  uint64_t v26 = v10[5];
  uint64_t v27 = &v8[v26];
  uint64_t v28 = &v9[v26];
  uint64_t v30 = *(void *)v28;
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = v30;
  *((void *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = v10[6];
  int v32 = &v8[v31];
  int v33 = &v9[v31];
  uint64_t v35 = *(void *)v33;
  uint64_t v34 = *((void *)v33 + 1);
  *(void *)int v32 = v35;
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = v10[7];
  uint64_t v37 = &v8[v36];
  uint64_t v38 = &v9[v36];
  uint64_t v40 = *(void *)v38;
  uint64_t v39 = *((void *)v38 + 1);
  *(void *)uint64_t v37 = v40;
  *((void *)v37 + 1) = v39;
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (char *)(v53 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      v51((uint64_t)v17, (uint64_t)v18, v6);
      uint64_t v41 = *(int *)(v19 + 20);
      uint64_t v42 = &v17[v41];
      uint64_t v43 = &v18[v41];
      uint64_t v45 = *(void *)v43;
      uint64_t v44 = *((void *)v43 + 1);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
      swift_bridgeObjectRelease();
      uint64_t v46 = *(int *)(v19 + 24);
      uint64_t v47 = &v17[v46];
      uint64_t v48 = &v18[v46];
      uint64_t v50 = *(void *)v48;
      uint64_t v49 = *((void *)v48 + 1);
      *(void *)uint64_t v47 = v50;
      *((void *)v47 + 1) = v49;
      swift_bridgeObjectRelease();
      return v53;
    }
    sub_254575BF8((uint64_t)v17, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = sub_25457523C(&qword_269E08278);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return v53;
  }
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v17, v18, v6);
  *(_OWORD *)&v17[*(int *)(v19 + 20)] = *(_OWORD *)&v18[*(int *)(v19 + 20)];
  *(_OWORD *)&v17[*(int *)(v19 + 24)] = *(_OWORD *)&v18[*(int *)(v19 + 24)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return v53;
}

uint64_t sub_2545762EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254576300);
}

uint64_t sub_254576300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25457523C(&qword_269E08270);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_25457523C(&qword_269E08278);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t sub_254576454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254576468);
}

uint64_t sub_254576468(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_254586DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_25457523C(&qword_269E08270);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_25457523C(&qword_269E08278);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_2545765C8()
{
  sub_254586DB0();
  if (v0 <= 0x3F)
  {
    sub_25456EDE4(319, &qword_269E08290, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    if (v1 <= 0x3F)
    {
      sub_25456EDE4(319, &qword_269E08298, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_254576704(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2545767F4(uint64_t a1)
{
  uint64_t v2 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25457687C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25457691C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2545769E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_254576A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_254576B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254576B24);
}

uint64_t sub_254576B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254576B3C);
}

uint64_t sub_254576B40()
{
  uint64_t result = sub_254586DB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_254576BD8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_254576CE4(uint64_t a1)
{
  uint64_t v2 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_254576D7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_254576E38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_254576F2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_254576FBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_254577080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254577094);
}

uint64_t sub_254577098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_254577168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25457717C);
}

uint64_t sub_254577180(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_254586DB0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_254577240()
{
  return sub_254581270();
}

unint64_t sub_254577254()
{
  unint64_t result = qword_269E082C0;
  if (!qword_269E082C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E082C0);
  }
  return result;
}

unint64_t sub_2545772AC()
{
  unint64_t result = qword_269E082C8;
  if (!qword_269E082C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E082C8);
  }
  return result;
}

unint64_t sub_254577304()
{
  unint64_t result = qword_269E082D0;
  if (!qword_269E082D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E082D0);
  }
  return result;
}

uint64_t sub_254577358()
{
  uint64_t v1 = sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = *(void *)(v0 + *(int *)(type metadata accessor for LighthouseBitacoraProto_BitacoraState(0) + 20));
  swift_beginAccess();
  if (!*(void *)(v4 + 24))
  {
    swift_retain();
LABEL_6:
    char v9 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_25457D420(v5, (uint64_t)v3, &qword_269E08488);
  uint64_t v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  LODWORD(v5) = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6);
  swift_retain();
  sub_25457D4E8((uint64_t)v3, &qword_269E08488);
  if (v5 == 1) {
    goto LABEL_6;
  }
  uint64_t v7 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID;
  swift_beginAccess();
  if (!*(void *)(v7 + 8)) {
    goto LABEL_6;
  }
  uint64_t v8 = v4
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  swift_beginAccess();
  char v9 = *(unsigned char *)(v8 + 8) ^ 1;
LABEL_7:
  swift_release();
  return v9 & 1;
}

uint64_t sub_2545774F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(void), uint64_t (*a6)(uint64_t), void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = *(int *)(a4(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    a5(0);
    swift_allocObject();
    uint64_t v14 = swift_retain();
    *(void *)(v7 + v13) = a6(v14);
    swift_release();
  }
  uint64_t v15 = swift_retain();
  a7(v15, a1, a2, a3);
  return swift_release();
}

uint64_t sub_2545775EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_254586E40();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result <= 300)
      {
        if (result > 101)
        {
          switch(result)
          {
            case 201:
            case 202:
            case 203:
            case 204:
LABEL_4:
              sub_254577D18();
              break;
            default:
              if (result == 102) {
LABEL_18:
              }
                sub_254577C94();
              break;
          }
        }
        else
        {
          switch(result)
          {
            case 1:
              sub_254577AB8();
              break;
            case 2:
              sub_254577B38();
              break;
            case 3:
LABEL_20:
              sub_254577E34();
              break;
            case 4:
              sub_254577C08(a2, a1, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp, MEMORY[0x263F50678]);
              break;
            default:
              if (result == 101) {
                goto LABEL_18;
              }
              break;
          }
        }
      }
      else
      {
        switch(result)
        {
          case 501:
            sub_254577D9C();
            break;
          case 502:
          case 503:
          case 504:
          case 505:
            goto LABEL_20;
          default:
            switch(result)
            {
              case 401:
              case 402:
              case 403:
              case 404:
                goto LABEL_4;
              default:
                goto LABEL_5;
            }
        }
      }
LABEL_5:
      uint64_t result = sub_254586E40();
    }
  }
  return result;
}

uint64_t sub_254577AB8()
{
  return swift_endAccess();
}

uint64_t sub_254577B38()
{
  return swift_endAccess();
}

uint64_t sub_254577C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = a2 + *a5;
  swift_beginAccess();
  a6(v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_254577C94()
{
  return swift_endAccess();
}

uint64_t sub_254577D18()
{
  return swift_endAccess();
}

uint64_t sub_254577D9C()
{
  return swift_endAccess();
}

uint64_t sub_254577E34()
{
  return swift_endAccess();
}

uint64_t sub_254577EB8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  a4(0);
  uint64_t v10 = swift_retain();
  a5(v10, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v5) {
    return sub_254586D90();
  }
  return result;
}

uint64_t sub_254577F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_2545782CC(a1);
  if (!v4)
  {
    sub_25457836C(a1, a2, a3, a4);
    sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
    sub_254578588(a1);
    sub_254578614(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
    sub_254578614(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded);
    sub_2545786A8(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed);
    sub_254578738(a1);
    sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
    sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
    sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
    return sub_2545787DC(a1, a2, a3, a4, &OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
  }
  return result;
}

uint64_t sub_2545782CC(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if (*(void *)(a1 + 24))
  {
    swift_bridgeObjectRetain();
    sub_254586F50();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25457836C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = sub_25457523C(&qword_269E08488);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
  swift_beginAccess();
  sub_25457D420(v12, (uint64_t)v7, &qword_269E08488);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25457D4E8((uint64_t)v7, &qword_269E08488);
  }
  sub_25457ABF4((uint64_t)v7, (uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_254586F80();
  return sub_254575BF8((uint64_t)v11, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_254578588(uint64_t a1)
{
  uint64_t v1 = a1
     + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v1 + 8) & 1) == 0) {
    return sub_254586F70();
  }
  return result;
}

uint64_t sub_254578614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = (unsigned char *)(a1 + *a5);
  uint64_t result = swift_beginAccess();
  if (*v5 != 2) {
    return sub_254586F10();
  }
  return result;
}

uint64_t sub_2545786A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1 + *a5;
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(v5 + 4) & 1) == 0) {
    return sub_254586F60();
  }
  return result;
}

uint64_t sub_254578738(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
  uint64_t result = swift_beginAccess();
  if (*v1 != 3)
  {
    sub_25457D598();
    return sub_254586F20();
  }
  return result;
}

uint64_t sub_2545787DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1 + *a5;
  uint64_t result = swift_beginAccess();
  if (*(void *)(v5 + 8))
  {
    swift_bridgeObjectRetain();
    sub_254586F50();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25457888C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25457523C(&qword_269E08498);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25457523C(&qword_269E08488);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v135 = (uint64_t)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v132 - v14;
  swift_beginAccess();
  uint64_t v136 = a1;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 24);
  swift_beginAccess();
  uint64_t v18 = *(void *)(a2 + 24);
  if (!v16)
  {
    if (!v18) {
      goto LABEL_8;
    }
    return 0;
  }
  if (!v18) {
    return 0;
  }
  if (v17 == *(void *)(a2 + 16) && v16 == v18 || (v19 = sub_254587070(), uint64_t result = 0, (v19 & 1) != 0))
  {
LABEL_8:
    uint64_t v133 = v7;
    uint64_t v134 = a2;
    uint64_t v21 = v136;
    uint64_t v22 = v136
        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
    swift_beginAccess();
    sub_25457D420(v22, (uint64_t)v15, &qword_269E08488);
    uint64_t v23 = v134;
    uint64_t v24 = v134
        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifiers;
    swift_beginAccess();
    uint64_t v25 = (uint64_t)&v10[*(int *)(v8 + 48)];
    sub_25457D420((uint64_t)v15, (uint64_t)v10, &qword_269E08488);
    sub_25457D420(v24, v25, &qword_269E08488);
    uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (v26((uint64_t)v10, 1, v4) == 1)
    {
      swift_retain();
      swift_retain();
      sub_25457D4E8((uint64_t)v15, &qword_269E08488);
      uint64_t v27 = v21;
      if (v26(v25, 1, v4) == 1)
      {
        sub_25457D4E8((uint64_t)v10, &qword_269E08488);
        uint64_t v28 = v23;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v29 = v135;
      sub_25457D420((uint64_t)v10, v135, &qword_269E08488);
      if (v26(v25, 1, v4) != 1)
      {
        uint64_t v30 = (uint64_t)v133;
        sub_25457ABF4(v25, (uint64_t)v133, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        uint64_t v27 = v136;
        swift_retain();
        swift_retain();
        char v31 = sub_25457CBE0(v29, v30);
        sub_254575BF8(v30, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        uint64_t v28 = v23;
        sub_25457D4E8((uint64_t)v15, &qword_269E08488);
        sub_254575BF8(v29, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
        sub_25457D4E8((uint64_t)v10, &qword_269E08488);
        if ((v31 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_16:
        int v32 = (uint64_t *)(v27
                        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
        swift_beginAccess();
        uint64_t v33 = *v32;
        uint64_t v34 = v32[1];
        uint64_t v35 = (void *)(v28
                       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__contextID);
        swift_beginAccess();
        uint64_t v36 = v35[1];
        if (v34)
        {
          if (!v36 || (v33 != *v35 || v34 != v36) && (sub_254587070() & 1) == 0) {
            goto LABEL_28;
          }
        }
        else if (v36)
        {
          goto LABEL_28;
        }
        uint64_t v37 = (uint64_t *)(v27
                        + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp);
        swift_beginAccess();
        uint64_t v38 = *v37;
        char v39 = *((unsigned char *)v37 + 8);
        uint64_t v40 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__timestamp;
        swift_beginAccess();
        if (v39)
        {
          uint64_t v41 = v134;
          if ((*(unsigned char *)(v40 + 8) & 1) == 0) {
            goto LABEL_28;
          }
        }
        else
        {
          if (*(unsigned char *)(v40 + 8)) {
            goto LABEL_28;
          }
          uint64_t v41 = v134;
          if (v38 != *(void *)v40) {
            goto LABEL_28;
          }
        }
        uint64_t v42 = (unsigned __int8 *)(v27
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
        swift_beginAccess();
        int v43 = *v42;
        uint64_t v44 = (unsigned __int8 *)(v41
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isAllocated);
        swift_beginAccess();
        int v45 = *v44;
        if (v43 == 2)
        {
          if (v45 != 2) {
            goto LABEL_28;
          }
        }
        else if (v45 == 2 || ((((v45 & 1) == 0) ^ v43) & 1) == 0)
        {
          goto LABEL_28;
        }
        uint64_t v46 = (unsigned __int8 *)(v27
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
        swift_beginAccess();
        int v47 = *v46;
        uint64_t v48 = (unsigned __int8 *)(v41
                                + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__isActivated);
        swift_beginAccess();
        int v49 = *v48;
        if (v47 == 2)
        {
          if (v49 != 2) {
            goto LABEL_28;
          }
        }
        else if (v49 == 2 || ((((v49 & 1) == 0) ^ v47) & 1) == 0)
        {
          goto LABEL_28;
        }
        uint64_t v50 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting);
        swift_beginAccess();
        int v51 = *v50;
        uint64_t v52 = v41;
        char v53 = *((unsigned char *)v50 + 4);
        uint64_t v54 = v52
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargetting;
        swift_beginAccess();
        if (v53)
        {
          if ((*(unsigned char *)(v54 + 4) & 1) == 0) {
            goto LABEL_28;
          }
        }
        else if ((*(unsigned char *)(v54 + 4) & 1) != 0 || v51 != *(_DWORD *)v54)
        {
          goto LABEL_28;
        }
        uint64_t v55 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet);
        swift_beginAccess();
        int v56 = *v55;
        char v57 = *((unsigned char *)v55 + 4);
        uint64_t v58 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countGeneralTargettingMet;
        swift_beginAccess();
        if (v57)
        {
          if ((*(unsigned char *)(v58 + 4) & 1) == 0) {
            goto LABEL_28;
          }
        }
        else if ((*(unsigned char *)(v58 + 4) & 1) != 0 || v56 != *(_DWORD *)v58)
        {
          goto LABEL_28;
        }
        uint64_t v59 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting);
        swift_beginAccess();
        int v60 = *v59;
        char v61 = *((unsigned char *)v59 + 4);
        uint64_t v62 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargetting;
        swift_beginAccess();
        if (v61)
        {
          if ((*(unsigned char *)(v62 + 4) & 1) == 0) {
            goto LABEL_28;
          }
        }
        else if ((*(unsigned char *)(v62 + 4) & 1) != 0 || v60 != *(_DWORD *)v62)
        {
          goto LABEL_28;
        }
        uint64_t v63 = (int *)(v27
                    + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet);
        swift_beginAccess();
        int v64 = *v63;
        char v65 = *((unsigned char *)v63 + 4);
        uint64_t v66 = v134
            + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countCustomTargettingMet;
        swift_beginAccess();
        if ((v65 & 1) == 0)
        {
          if ((*(unsigned char *)(v66 + 4) & 1) != 0 || v64 != *(_DWORD *)v66) {
            goto LABEL_28;
          }
LABEL_62:
          uint64_t v67 = (int *)(v27
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded);
          swift_beginAccess();
          int v68 = *v67;
          char v69 = *((unsigned char *)v67 + 4);
          uint64_t v70 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedSucceeded;
          swift_beginAccess();
          if (v69)
          {
            if ((*(unsigned char *)(v70 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v70 + 4) & 1) != 0 || v68 != *(_DWORD *)v70)
          {
            goto LABEL_28;
          }
          uint64_t v71 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed);
          swift_beginAccess();
          int v72 = *v71;
          char v73 = *((unsigned char *)v71 + 4);
          uint64_t v74 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskFetchedFailed;
          swift_beginAccess();
          if (v73)
          {
            if ((*(unsigned char *)(v74 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v74 + 4) & 1) != 0 || v72 != *(_DWORD *)v74)
          {
            goto LABEL_28;
          }
          uint64_t v75 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded);
          swift_beginAccess();
          int v76 = *v75;
          char v77 = *((unsigned char *)v75 + 4);
          uint64_t v78 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledSucceeded;
          swift_beginAccess();
          if (v77)
          {
            if ((*(unsigned char *)(v78 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v78 + 4) & 1) != 0 || v76 != *(_DWORD *)v78)
          {
            goto LABEL_28;
          }
          uint64_t v79 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed);
          swift_beginAccess();
          int v80 = *v79;
          char v81 = *((unsigned char *)v79 + 4);
          uint64_t v82 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskScheduledFailed;
          swift_beginAccess();
          if (v81)
          {
            if ((*(unsigned char *)(v82 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v82 + 4) & 1) != 0 || v80 != *(_DWORD *)v82)
          {
            goto LABEL_28;
          }
          uint64_t v83 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded);
          swift_beginAccess();
          int v84 = *v83;
          char v85 = *((unsigned char *)v83 + 4);
          uint64_t v86 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedSucceeded;
          swift_beginAccess();
          if (v85)
          {
            if ((*(unsigned char *)(v86 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v86 + 4) & 1) != 0 || v84 != *(_DWORD *)v86)
          {
            goto LABEL_28;
          }
          uint64_t v87 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed);
          swift_beginAccess();
          int v88 = *v87;
          char v89 = *((unsigned char *)v87 + 4);
          uint64_t v90 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countTaskCompletedFailed;
          swift_beginAccess();
          if (v89)
          {
            if ((*(unsigned char *)(v90 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v90 + 4) & 1) != 0 || v88 != *(_DWORD *)v90)
          {
            goto LABEL_28;
          }
          uint64_t v91 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded);
          swift_beginAccess();
          int v92 = *v91;
          char v93 = *((unsigned char *)v91 + 4);
          uint64_t v94 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskSucceeded;
          swift_beginAccess();
          if (v93)
          {
            if ((*(unsigned char *)(v94 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v94 + 4) & 1) != 0 || v92 != *(_DWORD *)v94)
          {
            goto LABEL_28;
          }
          uint64_t v95 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed);
          swift_beginAccess();
          int v96 = *v95;
          char v97 = *((unsigned char *)v95 + 4);
          uint64_t v98 = v134
              + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countPerformTaskFailed;
          swift_beginAccess();
          if (v97)
          {
            if ((*(unsigned char *)(v98 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v98 + 4) & 1) != 0 || v96 != *(_DWORD *)v98)
          {
            goto LABEL_28;
          }
          uint64_t v99 = (int *)(v136
                      + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded);
          swift_beginAccess();
          int v100 = *v99;
          char v101 = *((unsigned char *)v99 + 4);
          uint64_t v102 = v134
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopSucceeded;
          swift_beginAccess();
          if (v101)
          {
            if ((*(unsigned char *)(v102 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v102 + 4) & 1) != 0 || v100 != *(_DWORD *)v102)
          {
            goto LABEL_28;
          }
          uint64_t v103 = (int *)(v136
                       + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed);
          swift_beginAccess();
          int v104 = *v103;
          char v105 = *((unsigned char *)v103 + 4);
          uint64_t v106 = v134
               + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__countStopFailed;
          swift_beginAccess();
          if (v105)
          {
            if ((*(unsigned char *)(v106 + 4) & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if ((*(unsigned char *)(v106 + 4) & 1) != 0 || v104 != *(_DWORD *)v106)
          {
            goto LABEL_28;
          }
          uint64_t v107 = (unsigned __int8 *)(v136
                                   + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
          swift_beginAccess();
          int v108 = *v107;
          uint64_t v109 = (unsigned __int8 *)(v134
                                   + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialIdentifierType);
          swift_beginAccess();
          int v110 = *v109;
          if (v108 == 3)
          {
            if (v110 != 3) {
              goto LABEL_28;
            }
          }
          else if (v110 == 3 || v108 != v110)
          {
            goto LABEL_28;
          }
          char v111 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
          swift_beginAccess();
          uint64_t v112 = *v111;
          uint64_t v113 = v111[1];
          uint64_t v114 = (void *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialExperimentID);
          swift_beginAccess();
          uint64_t v115 = v114[1];
          if (v113)
          {
            if (!v115 || (v112 != *v114 || v113 != v115) && (sub_254587070() & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if (v115)
          {
            goto LABEL_28;
          }
          uint64_t v116 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
          swift_beginAccess();
          uint64_t v117 = *v116;
          uint64_t v118 = v116[1];
          uint64_t v119 = (void *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialDeploymentID);
          swift_beginAccess();
          uint64_t v120 = v119[1];
          if (v118)
          {
            if (!v120 || (v117 != *v119 || v118 != v120) && (sub_254587070() & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if (v120)
          {
            goto LABEL_28;
          }
          char v121 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
          swift_beginAccess();
          uint64_t v122 = *v121;
          uint64_t v123 = v121[1];
          uint64_t v124 = (void *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTreatmentID);
          swift_beginAccess();
          uint64_t v125 = v124[1];
          if (v123)
          {
            if (!v125 || (v122 != *v124 || v123 != v125) && (sub_254587070() & 1) == 0) {
              goto LABEL_28;
            }
          }
          else if (v125)
          {
            goto LABEL_28;
          }
          uint64_t v126 = (uint64_t *)(v136
                           + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
          swift_beginAccess();
          uint64_t v127 = *v126;
          uint64_t v128 = v126[1];
          uint64_t v129 = (void *)(v134
                          + OBJC_IVAR____TtCV27LighthouseBitacoraFramework37LighthouseBitacoraProto_BitacoraStateP33_36E24019A73ADCFF0D7B27133E537CB313_StorageClass__trialTaskID);
          swift_beginAccess();
          uint64_t v130 = v129[1];
          if (v128)
          {
            if (!v130) {
              goto LABEL_28;
            }
            if (v127 == *v129 && v128 == v130)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_release();
              swift_release();
            }
            else
            {
              char v131 = sub_254587070();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_release();
              swift_release();
              uint64_t result = 0;
              if ((v131 & 1) == 0) {
                return result;
              }
            }
          }
          else
          {
            swift_bridgeObjectRetain();
            swift_release();
            swift_release();
            if (v130)
            {
              swift_bridgeObjectRelease();
              return 0;
            }
          }
          return 1;
        }
        if (*(unsigned char *)(v66 + 4)) {
          goto LABEL_62;
        }
LABEL_28:
        swift_release();
        swift_release();
        return 0;
      }
      swift_retain();
      swift_retain();
      sub_25457D4E8((uint64_t)v15, &qword_269E08488);
      sub_254575BF8(v29, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    }
    sub_25457D4E8((uint64_t)v10, &qword_269E08498);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_25457977C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2545797A0(a1, &qword_269E080E8, &qword_269E080F0, a2);
}

uint64_t sub_2545797A0@<X0>(uint64_t a1@<X0>, void *a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  sub_254586DA0();
  uint64_t v8 = *(int *)(a1 + 20);
  if (*a2 != -1) {
    swift_once();
  }
  *(void *)(a4 + v8) = *a3;
  return swift_retain();
}

unint64_t sub_25457981C()
{
  return 0xD000000000000027;
}

uint64_t sub_25457983C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_254586DB0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_2545798A4(uint64_t a1)
{
  uint64_t v3 = sub_254586DB0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t sub_25457990C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2545774F8(a1, a2, a3, type metadata accessor for LighthouseBitacoraProto_BitacoraState, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_BitacoraState._StorageClass, sub_2545735AC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2545775EC);
}

uint64_t sub_254579974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_254577EB8(a1, a2, a3, (void (*)(void))type metadata accessor for LighthouseBitacoraProto_BitacoraState, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_254577F58);
}

uint64_t sub_2545799B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254579F7C(&qword_269E084F0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_254579A30@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080E0, (uint64_t)qword_269E0AAD8, a1);
}

uint64_t sub_254579A54(uint64_t a1)
{
  uint64_t v2 = sub_254579F7C(&qword_269E082E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_254579AC0()
{
  return sub_2545870B0();
}

uint64_t sub_254579B18()
{
  sub_254579F7C(&qword_269E082E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  return sub_254586F00();
}

uint64_t sub_254579B94()
{
  return sub_2545870B0();
}

uint64_t sub_254579BE8(uint64_t a1, uint64_t a2)
{
  return sub_25457BD5C(a1, a2, type metadata accessor for LighthouseBitacoraProto_BitacoraState, sub_25457888C) & 1;
}

uint64_t sub_254579C2C()
{
  uint64_t v0 = sub_254586FB0();
  sub_25457AC94(v0, qword_269E0AAF0);
  sub_25457AC5C(v0, (uint64_t)qword_269E0AAF0);
  sub_25457523C(&qword_269E08440);
  uint64_t v1 = (int *)(sub_25457523C(&qword_269E08448) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2545899E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "Unknown";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_254586F90();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "experiment";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 2;
  *(void *)uint64_t v11 = "BMLT";
  *(void *)(v11 + 8) = 4;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_254586FA0();
}

uint64_t sub_254579E2C@<X0>(uint64_t a1@<X8>)
{
  return sub_254579E50(&qword_269E080F8, (uint64_t)qword_269E0AAF0, a1);
}

uint64_t sub_254579E50@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_254586FB0();
  uint64_t v6 = sub_25457AC5C(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_254579EEC()
{
  return sub_254579F7C(&qword_269E082D8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
}

uint64_t sub_254579F34()
{
  return sub_254579F7C(&qword_269E082E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
}

uint64_t sub_254579F7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_254579FC4()
{
  return sub_254579F7C(&qword_269E082E8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
}

uint64_t sub_25457A00C()
{
  return sub_254579F7C(&qword_269E082F0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
}

uint64_t sub_25457A054()
{
  return sub_254579F7C(&qword_269E082F8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08528);
}

uint64_t sub_25457A0BC()
{
  return sub_254579F7C(&qword_269E08300, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
}

uint64_t sub_25457A104()
{
  return sub_254579F7C(&qword_269E08308, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
}

uint64_t sub_25457A14C()
{
  return sub_254579F7C(&qword_269E08310, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
}

uint64_t sub_25457A194()
{
  return sub_254579F7C(&qword_269E08318, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25457A1DC()
{
  return sub_254579F7C(&qword_269E08320, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25457A224()
{
  return sub_254579F7C(&qword_269E08328, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25457A26C()
{
  return sub_254579F7C(&qword_269E08330, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.TaskEvent);
}

uint64_t sub_25457A2B4()
{
  return sub_254579F7C(&qword_269E08338, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_25457A2FC()
{
  return sub_254579F7C(&qword_269E08340, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_25457A344()
{
  return sub_254579F7C(&qword_269E08348, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_25457A38C()
{
  return sub_254579F7C(&qword_269E08350, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus);
}

uint64_t sub_25457A3D4()
{
  return sub_254579F7C(&qword_269E08358, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
}

uint64_t sub_25457A41C()
{
  return sub_254579F7C(&qword_269E08360, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
}

uint64_t sub_25457A464()
{
  return sub_254579F7C(&qword_269E08368, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
}

uint64_t sub_25457A4AC()
{
  return sub_254579F7C(&qword_269E08370, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
}

uint64_t sub_25457A4F4()
{
  return sub_254579F7C(&qword_269E08378, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08518);
}

uint64_t sub_25457A55C()
{
  return sub_254579F7C(&qword_269E08380, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25457A5A4()
{
  return sub_254579F7C(&qword_269E08388, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25457A5EC()
{
  return sub_254579F7C(&qword_269E08390, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
}

uint64_t sub_25457A634()
{
  return sub_254579F7C(&qword_269E08398, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
}

uint64_t type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(uint64_t a1)
{
  return sub_25457A69C(a1, (uint64_t *)&unk_269E08500);
}

uint64_t sub_25457A69C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25457A6D4()
{
  return sub_254579F7C(&qword_269E083A0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
}

uint64_t sub_25457A71C()
{
  return sub_254579F7C(&qword_269E083A8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
}

uint64_t sub_25457A764()
{
  return sub_254579F7C(&qword_269E083B0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
}

uint64_t sub_25457A7AC()
{
  return sub_254579F7C(&qword_269E083B8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_25457A7F4()
{
  return sub_254579F7C(&qword_269E083C0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_25457A83C()
{
  return sub_254579F7C(&qword_269E083C8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_25457A884()
{
  return sub_254579F7C(&qword_269E083D0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
}

uint64_t sub_25457A8CC()
{
  return sub_254579F7C(&qword_269E083D8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_25457A914()
{
  return sub_254579F7C(&qword_269E083E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_25457A95C()
{
  return sub_254579F7C(&qword_269E083E8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_25457A9A4()
{
  return sub_254579F7C(&qword_269E083F0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
}

uint64_t sub_25457A9EC()
{
  return sub_254579F7C(&qword_269E083F8, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25457AA34()
{
  return sub_254579F7C(&qword_269E08400, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25457AA7C()
{
  return sub_254579F7C(&qword_269E08408, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25457AAC4()
{
  return sub_254579F7C(&qword_269E08410, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
}

uint64_t sub_25457AB0C()
{
  return sub_25457ABA4(&qword_269E08418, &qword_269E08420);
}

uint64_t sub_25457AB34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25457AB7C()
{
  return sub_25457ABA4(&qword_269E08428, &qword_269E08430);
}

uint64_t sub_25457ABA4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25457AB34(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25457ABF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25457AC5C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_25457AC94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_25457ACF8(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_25457AD08(uint64_t a1, uint64_t a2)
{
  uint64_t v128 = a1;
  uint64_t v129 = a2;
  uint64_t v2 = sub_254586DB0();
  uint64_t v109 = *(void *)(v2 - 8);
  uint64_t v110 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  int v108 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v107 = (char *)&v107 - v5;
  uint64_t v124 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v121 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v115 = (uint64_t)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_25457523C(&qword_269E08490);
  uint64_t v7 = MEMORY[0x270FA5388](v123);
  uint64_t v112 = (uint64_t)&v107 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v120 = (uint64_t)&v107 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v122 = (uint64_t)&v107 - v11;
  uint64_t v12 = sub_25457523C(&qword_269E08480);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v111 = (uint64_t)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v113 = (uint64_t)&v107 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v114 = (char *)&v107 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v116 = (char *)&v107 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v118 = (uint64_t)&v107 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v119 = (uint64_t)&v107 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v117 = (uint64_t)&v107 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v125 = (uint64_t)&v107 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v126 = (uint64_t)&v107 - v29;
  uint64_t v30 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v107 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_25457523C(&qword_269E08498);
  uint64_t v35 = v34 - 8;
  MEMORY[0x270FA5388](v34);
  uint64_t v37 = (char *)&v107 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_25457523C(&qword_269E08488);
  uint64_t v39 = MEMORY[0x270FA5388](v38 - 8);
  uint64_t v41 = (char *)&v107 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  uint64_t v44 = (char *)&v107 - v43;
  MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v107 - v45;
  uint64_t v47 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  sub_25457D420(v128 + *(int *)(v47 + 20), (uint64_t)v46, &qword_269E08488);
  uint64_t v127 = (int *)v47;
  sub_25457D420(v129 + *(int *)(v47 + 20), (uint64_t)v44, &qword_269E08488);
  uint64_t v48 = (uint64_t)&v37[*(int *)(v35 + 56)];
  sub_25457D420((uint64_t)v46, (uint64_t)v37, &qword_269E08488);
  sub_25457D420((uint64_t)v44, v48, &qword_269E08488);
  int v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  if (v49((uint64_t)v37, 1, v30) == 1)
  {
    sub_25457D4E8((uint64_t)v44, &qword_269E08488);
    sub_25457D4E8((uint64_t)v46, &qword_269E08488);
    if (v49(v48, 1, v30) == 1)
    {
      sub_25457D4E8((uint64_t)v37, &qword_269E08488);
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v50 = &qword_269E08498;
    uint64_t v51 = (uint64_t)v37;
LABEL_7:
    sub_25457D4E8(v51, v50);
LABEL_8:
    char v52 = 0;
    return v52 & 1;
  }
  sub_25457D420((uint64_t)v37, (uint64_t)v41, &qword_269E08488);
  if (v49(v48, 1, v30) == 1)
  {
    sub_25457D4E8((uint64_t)v44, &qword_269E08488);
    sub_25457D4E8((uint64_t)v46, &qword_269E08488);
    sub_254575BF8((uint64_t)v41, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  sub_25457ABF4(v48, (uint64_t)v33, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  char v54 = sub_25457CBE0((uint64_t)v41, (uint64_t)v33);
  sub_254575BF8((uint64_t)v33, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v44, &qword_269E08488);
  sub_25457D4E8((uint64_t)v46, &qword_269E08488);
  sub_254575BF8((uint64_t)v41, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v37, &qword_269E08488);
  if ((v54 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
  int v56 = v127;
  uint64_t v55 = v128;
  uint64_t v57 = v127[6];
  uint64_t v58 = (void *)(v128 + v57);
  uint64_t v59 = *(void *)(v128 + v57 + 8);
  uint64_t v60 = v129;
  char v61 = (void *)(v129 + v57);
  uint64_t v62 = v61[1];
  if (!v59)
  {
    if (v62) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
  if (!v62) {
    goto LABEL_8;
  }
  if (*v58 == *v61 && v59 == v62 || (char v52 = 0, (sub_254587070() & 1) != 0))
  {
LABEL_18:
    uint64_t v63 = v56[7];
    int v64 = (double *)(v55 + v63);
    char v65 = *(unsigned char *)(v55 + v63 + 8);
    uint64_t v66 = (double *)(v60 + v63);
    int v67 = *(unsigned __int8 *)(v60 + v63 + 8);
    if (v65)
    {
      uint64_t v68 = v125;
      uint64_t v69 = v126;
      if (!v67) {
        goto LABEL_8;
      }
    }
    else
    {
      if (*v64 != *v66) {
        LOBYTE(v67) = 1;
      }
      uint64_t v68 = v125;
      uint64_t v69 = v126;
      if (v67) {
        goto LABEL_8;
      }
    }
    sub_25457D420(v55 + v56[8], v69, &qword_269E08480);
    sub_25457D420(v60 + v56[8], v68, &qword_269E08480);
    uint64_t v70 = v122;
    uint64_t v71 = v122 + *(int *)(v123 + 48);
    sub_25457D420(v69, v122, &qword_269E08480);
    uint64_t v72 = v70;
    sub_25457D420(v68, v71, &qword_269E08480);
    char v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48);
    uint64_t v74 = v70;
    uint64_t v75 = v124;
    if (v73(v74, 1, v124) == 1)
    {
      sub_25457D4E8(v68, &qword_269E08480);
      uint64_t v72 = v122;
      sub_25457D4E8(v69, &qword_269E08480);
      if (v73(v71, 1, v124) != 1) {
        goto LABEL_37;
      }
      sub_25457D4E8(v72, &qword_269E08480);
      uint64_t v76 = (uint64_t)v116;
    }
    else
    {
      uint64_t v76 = v117;
      sub_25457D420(v72, v117, &qword_269E08480);
      if (v73(v71, 1, v75) == 1)
      {
        sub_25457D4E8(v125, &qword_269E08480);
        uint64_t v77 = v126;
        goto LABEL_35;
      }
      uint64_t v78 = v115;
      sub_25457ABF4(v71, v115, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      char v79 = sub_25457C12C(v76, v78, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_254575BF8(v78, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_25457D4E8(v125, &qword_269E08480);
      sub_25457D4E8(v126, &qword_269E08480);
      sub_254575BF8(v76, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      uint64_t v76 = (uint64_t)v116;
      sub_25457D4E8(v72, &qword_269E08480);
      if ((v79 & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v80 = v119;
    sub_25457D420(v55 + v56[9], v119, &qword_269E08480);
    uint64_t v81 = v129 + v56[9];
    uint64_t v82 = v118;
    sub_25457D420(v81, v118, &qword_269E08480);
    uint64_t v83 = v120;
    uint64_t v84 = v120 + *(int *)(v123 + 48);
    sub_25457D420(v80, v120, &qword_269E08480);
    uint64_t v72 = v83;
    sub_25457D420(v82, v84, &qword_269E08480);
    uint64_t v85 = v83;
    uint64_t v86 = v124;
    if (v73(v85, 1, v124) == 1)
    {
      sub_25457D4E8(v82, &qword_269E08480);
      uint64_t v72 = v120;
      sub_25457D4E8(v80, &qword_269E08480);
      if (v73(v84, 1, v124) == 1)
      {
        sub_25457D4E8(v72, &qword_269E08480);
        uint64_t v87 = (uint64_t)v114;
LABEL_39:
        int v92 = v127;
        sub_25457D420(v55 + v127[10], v87, &qword_269E08480);
        uint64_t v93 = v113;
        sub_25457D420(v129 + v92[10], v113, &qword_269E08480);
        uint64_t v94 = v112;
        uint64_t v95 = v112 + *(int *)(v123 + 48);
        sub_25457D420(v87, v112, &qword_269E08480);
        uint64_t v72 = v94;
        sub_25457D420(v93, v95, &qword_269E08480);
        uint64_t v96 = v124;
        if (v73(v94, 1, v124) == 1)
        {
          sub_25457D4E8(v93, &qword_269E08480);
          sub_25457D4E8(v87, &qword_269E08480);
          if (v73(v95, 1, v96) == 1)
          {
            sub_25457D4E8(v94, &qword_269E08480);
LABEL_45:
            uint64_t v102 = v109;
            uint64_t v101 = v110;
            uint64_t v103 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
            int v104 = v107;
            v103(v107, v55, v110);
            char v105 = v108;
            v103(v108, v129, v101);
            sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
            char v52 = sub_254586FD0();
            uint64_t v106 = *(void (**)(char *, uint64_t))(v102 + 8);
            v106(v105, v101);
            v106(v104, v101);
            return v52 & 1;
          }
          goto LABEL_37;
        }
        uint64_t v97 = v94;
        uint64_t v98 = v111;
        sub_25457D420(v97, v111, &qword_269E08480);
        if (v73(v95, 1, v96) != 1)
        {
          uint64_t v99 = v115;
          sub_25457ABF4(v95, v115, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
          char v100 = sub_25457C12C(v98, v99, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
          sub_254575BF8(v99, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
          sub_25457D4E8(v113, &qword_269E08480);
          sub_25457D4E8(v87, &qword_269E08480);
          sub_254575BF8(v98, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
          sub_25457D4E8(v72, &qword_269E08480);
          if (v100) {
            goto LABEL_45;
          }
          goto LABEL_8;
        }
        sub_25457D4E8(v113, &qword_269E08480);
        sub_25457D4E8(v87, &qword_269E08480);
        uint64_t v89 = v98;
        goto LABEL_36;
      }
LABEL_37:
      uint64_t v50 = &qword_269E08490;
      uint64_t v51 = v72;
      goto LABEL_7;
    }
    sub_25457D420(v72, v76, &qword_269E08480);
    unsigned int v88 = v73(v84, 1, v86);
    uint64_t v87 = (uint64_t)v114;
    if (v88 != 1)
    {
      uint64_t v90 = v115;
      sub_25457ABF4(v84, v115, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      char v91 = sub_25457C12C(v76, v90, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_254575BF8(v90, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_25457D4E8(v118, &qword_269E08480);
      sub_25457D4E8(v119, &qword_269E08480);
      sub_254575BF8(v76, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      sub_25457D4E8(v72, &qword_269E08480);
      if ((v91 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_39;
    }
    sub_25457D4E8(v118, &qword_269E08480);
    uint64_t v77 = v119;
LABEL_35:
    sub_25457D4E8(v77, &qword_269E08480);
    uint64_t v89 = v76;
LABEL_36:
    sub_254575BF8(v89, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
    goto LABEL_37;
  }
  return v52 & 1;
}

uint64_t sub_25457BB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_19;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_254587070() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = *(int *)(v11 + 24);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (v23)
      {
        if (*v20 != *v22 || v21 != v23)
        {
          char v18 = 0;
          if ((sub_254587070() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_20:
        uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v25(v10, a1, v4);
        v25(v8, a2, v4);
        sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
        char v18 = sub_254586FD0();
        uint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
        v26(v8, v4);
        v26(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v23)
    {
      goto LABEL_20;
    }
LABEL_19:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_25457BD5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = sub_254586DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(int *)(a3(0) + 20);
  uint64_t v16 = *(void *)(a1 + v15);
  uint64_t v17 = *(void *)(a2 + v15);
  if (v16 == v17
    || (swift_retain(), swift_retain(), char v18 = a4(v16, v17), swift_release(), swift_release(), (v18 & 1) != 0))
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v19(v14, a1, v8);
    v19(v12, a2, v8);
    sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
    char v20 = sub_254586FD0();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
    v21(v12, v8);
    v21(v14, v8);
  }
  else
  {
    char v20 = 0;
  }
  return v20 & 1;
}

uint64_t sub_25457BF58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent.ScheduleStatus(0)
               + 20);
  int v12 = *(unsigned __int8 *)(a1 + v11);
  int v13 = *(unsigned __int8 *)(a2 + v11);
  if (v12 == 2)
  {
    if (v13 != 2)
    {
LABEL_7:
      char v15 = 0;
      return v15 & 1;
    }
  }
  else if (v13 == 2 || ((((v13 & 1) == 0) ^ v12) & 1) == 0)
  {
    goto LABEL_7;
  }
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v10, a1, v4);
  v14(v8, a2, v4);
  sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
  char v15 = sub_254586FD0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, v4);
  v16(v10, v4);
  return v15 & 1;
}

uint64_t sub_25457C12C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v33 - v11;
  uint64_t v13 = a3(0);
  uint64_t v14 = v13;
  uint64_t v15 = *(int *)(v13 + 20);
  int v16 = *(unsigned __int8 *)(a1 + v15);
  int v17 = *(unsigned __int8 *)(a2 + v15);
  if (v16 == 2)
  {
    if (v17 != 2) {
      goto LABEL_17;
    }
  }
  else if (v17 == 2 || ((((v17 & 1) == 0) ^ v16) & 1) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v18 = *(int *)(v13 + 24);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = *(void *)(a1 + v18 + 8);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  if (!v20)
  {
    if (!v22) {
      goto LABEL_15;
    }
LABEL_17:
    char v24 = 0;
    return v24 & 1;
  }
  if (!v22) {
    goto LABEL_17;
  }
  BOOL v23 = *v19 == *v21 && v20 == v22;
  if (v23 || (char v24 = 0, (sub_254587070() & 1) != 0))
  {
LABEL_15:
    uint64_t v25 = *(int *)(v14 + 28);
    uint64_t v26 = (_DWORD *)(a1 + v25);
    char v27 = *(unsigned char *)(a1 + v25 + 4);
    uint64_t v28 = (_DWORD *)(a2 + v25);
    int v29 = *(unsigned __int8 *)(a2 + v25 + 4);
    if (v27)
    {
      if (!v29) {
        goto LABEL_17;
      }
    }
    else
    {
      if (*v26 != *v28) {
        LOBYTE(v29) = 1;
      }
      if (v29) {
        goto LABEL_17;
      }
    }
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v31(v12, a1, v6);
    v31(v10, a2, v6);
    sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
    char v24 = sub_254586FD0();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v7 + 8);
    v32(v10, v6);
    v32(v12, v6);
  }
  return v24 & 1;
}

uint64_t sub_25457C384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  uint64_t v63 = *(void *)(v4 - 8);
  uint64_t v64 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v62 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v61 = (char *)&v60 - v7;
  uint64_t v8 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v65 = (uint64_t)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25457523C(&qword_269E08498);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25457523C(&qword_269E08488);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v60 - v20;
  MEMORY[0x270FA5388](v19);
  BOOL v23 = (char *)&v60 - v22;
  uint64_t v24 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  uint64_t v25 = *(int *)(v24 + 20);
  uint64_t v66 = a1;
  uint64_t v26 = a1 + v25;
  char v27 = (int *)v24;
  sub_25457D420(v26, (uint64_t)v23, &qword_269E08488);
  uint64_t v28 = v27[5];
  uint64_t v67 = a2;
  sub_25457D420(a2 + v28, (uint64_t)v21, &qword_269E08488);
  uint64_t v29 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_25457D420((uint64_t)v23, (uint64_t)v14, &qword_269E08488);
  sub_25457D420((uint64_t)v21, v29, &qword_269E08488);
  uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v30((uint64_t)v14, 1, v8) == 1)
  {
    sub_25457D4E8((uint64_t)v21, &qword_269E08488);
    sub_25457D4E8((uint64_t)v23, &qword_269E08488);
    if (v30(v29, 1, v8) == 1)
    {
      sub_25457D4E8((uint64_t)v14, &qword_269E08488);
      goto LABEL_10;
    }
LABEL_6:
    sub_25457D4E8((uint64_t)v14, &qword_269E08498);
    goto LABEL_7;
  }
  sub_25457D420((uint64_t)v14, (uint64_t)v18, &qword_269E08488);
  if (v30(v29, 1, v8) == 1)
  {
    sub_25457D4E8((uint64_t)v21, &qword_269E08488);
    sub_25457D4E8((uint64_t)v23, &qword_269E08488);
    sub_254575BF8((uint64_t)v18, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    goto LABEL_6;
  }
  uint64_t v33 = v65;
  sub_25457ABF4(v29, v65, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  char v34 = sub_25457CBE0((uint64_t)v18, v33);
  sub_254575BF8(v33, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v21, &qword_269E08488);
  sub_25457D4E8((uint64_t)v23, &qword_269E08488);
  sub_254575BF8((uint64_t)v18, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
  sub_25457D4E8((uint64_t)v14, &qword_269E08488);
  if ((v34 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v35 = v27[6];
  uint64_t v36 = v66;
  uint64_t v37 = v67;
  uint64_t v38 = (void *)(v66 + v35);
  uint64_t v39 = *(void *)(v66 + v35 + 8);
  uint64_t v40 = (void *)(v67 + v35);
  uint64_t v41 = v40[1];
  if (v39)
  {
    if (!v41) {
      goto LABEL_7;
    }
    if (*v38 != *v40 || v39 != v41)
    {
      char v31 = 0;
      if ((sub_254587070() & 1) == 0) {
        return v31 & 1;
      }
    }
  }
  else if (v41)
  {
    goto LABEL_7;
  }
  uint64_t v42 = v27[7];
  uint64_t v43 = (double *)(v36 + v42);
  char v44 = *(unsigned char *)(v36 + v42 + 8);
  uint64_t v45 = (double *)(v37 + v42);
  int v46 = *(unsigned __int8 *)(v37 + v42 + 8);
  if (v44)
  {
    if (!v46) {
      goto LABEL_7;
    }
  }
  else
  {
    if (*v43 != *v45) {
      LOBYTE(v46) = 1;
    }
    if (v46) {
      goto LABEL_7;
    }
  }
  uint64_t v47 = v27[8];
  int v48 = *(unsigned __int8 *)(v36 + v47);
  int v49 = *(unsigned __int8 *)(v37 + v47);
  if (v48 == 4)
  {
    if (v49 == 4) {
      goto LABEL_28;
    }
LABEL_7:
    char v31 = 0;
    return v31 & 1;
  }
  char v31 = 0;
  if (v49 != 4 && v48 == v49)
  {
LABEL_28:
    uint64_t v50 = v27[9];
    int v51 = *(unsigned __int8 *)(v36 + v50);
    int v52 = *(unsigned __int8 *)(v37 + v50);
    if (v51 == 2)
    {
      if (v52 == 2)
      {
LABEL_33:
        uint64_t v53 = v63;
        char v54 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
        uint64_t v55 = v61;
        uint64_t v56 = v36;
        uint64_t v57 = v64;
        v54(v61, v56, v64);
        uint64_t v58 = v62;
        v54(v62, v37, v57);
        sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
        char v31 = sub_254586FD0();
        uint64_t v59 = *(void (**)(char *, uint64_t))(v53 + 8);
        v59(v58, v57);
        v59(v55, v57);
        return v31 & 1;
      }
    }
    else if (v52 != 2 && ((((v52 & 1) == 0) ^ v51) & 1) != 0)
    {
      goto LABEL_33;
    }
    goto LABEL_7;
  }
  return v31 & 1;
}

uint64_t sub_25457C968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_28;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_28;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_254587070() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[6];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (!v23) {
        goto LABEL_28;
      }
      if (*v20 != *v22 || v21 != v23)
      {
        char v18 = 0;
        if ((sub_254587070() & 1) == 0) {
          return v18 & 1;
        }
      }
    }
    else if (v23)
    {
      goto LABEL_28;
    }
    uint64_t v25 = v11[7];
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = *(void *)(a1 + v25 + 8);
    uint64_t v28 = (void *)(a2 + v25);
    uint64_t v29 = v28[1];
    if (v27)
    {
      if (v29)
      {
        if (*v26 != *v28 || v27 != v29)
        {
          char v18 = 0;
          if ((sub_254587070() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_30:
        uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v32(v10, a1, v4);
        v32(v8, a2, v4);
        sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
        char v18 = sub_254586FD0();
        uint64_t v33 = *(void (**)(char *, uint64_t))(v5 + 8);
        v33(v8, v4);
        v33(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v29)
    {
      goto LABEL_30;
    }
LABEL_28:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_25457CBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = a1;
  uint64_t v70 = a2;
  uint64_t v2 = sub_254586DB0();
  uint64_t v60 = *(void *)(v2 - 8);
  uint64_t v61 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v59 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v58 = (char *)&v57 - v5;
  uint64_t v6 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v57 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_25457523C(&qword_269E08450);
  MEMORY[0x270FA5388](v63);
  uint64_t v67 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25457523C(&qword_269E08278);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v62 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v68 = (uint64_t)&v57 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v64 = (uint64_t)&v57 - v14;
  uint64_t v15 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25457523C(&qword_269E08458);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25457523C(&qword_269E08270);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v57 - v28;
  MEMORY[0x270FA5388](v27);
  char v31 = (char *)&v57 - v30;
  uint64_t v32 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  sub_25457D420(v69 + *(int *)(v32 + 20), (uint64_t)v31, &qword_269E08270);
  sub_25457D420(v70 + *(int *)(v32 + 20), (uint64_t)v29, &qword_269E08270);
  uint64_t v33 = (uint64_t)&v22[*(int *)(v20 + 56)];
  sub_25457D420((uint64_t)v31, (uint64_t)v22, &qword_269E08270);
  sub_25457D420((uint64_t)v29, v33, &qword_269E08270);
  uint64_t v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v34((uint64_t)v22, 1, v15) != 1)
  {
    sub_25457D420((uint64_t)v22, (uint64_t)v26, &qword_269E08270);
    if (v34(v33, 1, v15) != 1)
    {
      sub_25457ABF4(v33, (uint64_t)v18, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      char v37 = sub_25457C968((uint64_t)v26, (uint64_t)v18);
      sub_254575BF8((uint64_t)v18, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      sub_25457D4E8((uint64_t)v29, &qword_269E08270);
      sub_25457D4E8((uint64_t)v31, &qword_269E08270);
      sub_254575BF8((uint64_t)v26, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      sub_25457D4E8((uint64_t)v22, &qword_269E08270);
      if ((v37 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_8;
    }
    sub_25457D4E8((uint64_t)v29, &qword_269E08270);
    sub_25457D4E8((uint64_t)v31, &qword_269E08270);
    sub_254575BF8((uint64_t)v26, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
LABEL_6:
    uint64_t v35 = &qword_269E08458;
    uint64_t v36 = (uint64_t)v22;
LABEL_14:
    sub_25457D4E8(v36, v35);
    goto LABEL_15;
  }
  sub_25457D4E8((uint64_t)v29, &qword_269E08270);
  sub_25457D4E8((uint64_t)v31, &qword_269E08270);
  if (v34(v33, 1, v15) != 1) {
    goto LABEL_6;
  }
  sub_25457D4E8((uint64_t)v22, &qword_269E08270);
LABEL_8:
  uint64_t v38 = v69;
  uint64_t v39 = v64;
  sub_25457D420(v69 + *(int *)(v32 + 24), v64, &qword_269E08278);
  uint64_t v40 = v70;
  uint64_t v41 = v68;
  sub_25457D420(v70 + *(int *)(v32 + 24), v68, &qword_269E08278);
  uint64_t v42 = v67;
  uint64_t v43 = v67 + *(int *)(v63 + 48);
  sub_25457D420(v39, v67, &qword_269E08278);
  sub_25457D420(v41, v43, &qword_269E08278);
  uint64_t v44 = v66;
  uint64_t v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
  if (v45(v42, 1, v66) == 1)
  {
    sub_25457D4E8(v41, &qword_269E08278);
    sub_25457D4E8(v39, &qword_269E08278);
    if (v45(v43, 1, v44) == 1)
    {
      sub_25457D4E8(v42, &qword_269E08278);
LABEL_18:
      uint64_t v52 = v60;
      uint64_t v51 = v61;
      uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
      char v54 = v58;
      v53(v58, v38, v61);
      uint64_t v55 = v59;
      v53(v59, v40, v51);
      sub_254579F7C(&qword_269E08460, MEMORY[0x263F50560]);
      char v47 = sub_254586FD0();
      uint64_t v56 = *(void (**)(char *, uint64_t))(v52 + 8);
      v56(v55, v51);
      v56(v54, v51);
      return v47 & 1;
    }
    goto LABEL_13;
  }
  uint64_t v46 = v62;
  sub_25457D420(v42, v62, &qword_269E08278);
  if (v45(v43, 1, v44) == 1)
  {
    sub_25457D4E8(v68, &qword_269E08278);
    sub_25457D4E8(v39, &qword_269E08278);
    sub_254575BF8(v46, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
LABEL_13:
    uint64_t v35 = &qword_269E08450;
    uint64_t v36 = v42;
    goto LABEL_14;
  }
  uint64_t v49 = v57;
  sub_25457ABF4(v43, v57, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  char v50 = sub_25457BB2C(v46, v49);
  sub_254575BF8(v49, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_25457D4E8(v68, &qword_269E08278);
  sub_25457D4E8(v39, &qword_269E08278);
  sub_254575BF8(v46, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
  sub_25457D4E8(v42, &qword_269E08278);
  if (v50) {
    goto LABEL_18;
  }
LABEL_15:
  char v47 = 0;
  return v47 & 1;
}

uint64_t sub_25457D420(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_25457523C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25457D484(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_25457523C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_25457D4E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25457523C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25457D544()
{
  unint64_t result = qword_269E084E8;
  if (!qword_269E084E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E084E8);
  }
  return result;
}

unint64_t sub_25457D598()
{
  unint64_t result = qword_269E084F8;
  if (!qword_269E084F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E084F8);
  }
  return result;
}

uint64_t *sub_25457D5EC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v99 = v8;
    uint64_t v100 = v7;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_25457523C(&qword_269E08488);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v96 = v13;
      v8(v10, v11, v7);
      uint64_t v16 = *(int *)(v12 + 20);
      __dst = &v10[v16];
      uint64_t v98 = v10;
      uint64_t v17 = &v11[v16];
      char v18 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      uint64_t v94 = *((void *)v18 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v94 + 48))(v17, 1, v18))
      {
        uint64_t v19 = sub_25457523C(&qword_269E08270);
        memcpy(__dst, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        v8(__dst, v17, v7);
        uint64_t v20 = v18[5];
        uint64_t v21 = &__dst[v20];
        uint64_t v22 = &v17[v20];
        uint64_t v23 = *((void *)v22 + 1);
        *(void *)uint64_t v21 = *(void *)v22;
        *((void *)v21 + 1) = v23;
        uint64_t v24 = v18[6];
        uint64_t v25 = &__dst[v24];
        uint64_t v26 = &v17[v24];
        uint64_t v27 = *((void *)v26 + 1);
        *(void *)uint64_t v25 = *(void *)v26;
        *((void *)v25 + 1) = v27;
        uint64_t v28 = v18[7];
        uint64_t v29 = &__dst[v28];
        uint64_t v30 = &v17[v28];
        uint64_t v31 = *((void *)v30 + 1);
        *(void *)uint64_t v29 = *(void *)v30;
        *((void *)v29 + 1) = v31;
        uint64_t v95 = *(void (**)(char *, void, uint64_t, int *))(v94 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v95(__dst, 0, 1, v18);
      }
      uint64_t v32 = *(int *)(v12 + 24);
      uint64_t v33 = &v98[v32];
      uint64_t v34 = &v11[v32];
      uint64_t v35 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
      {
        uint64_t v37 = sub_25457523C(&qword_269E08278);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        v99(v33, v34, v7);
        uint64_t v38 = *(int *)(v35 + 20);
        uint64_t v39 = &v33[v38];
        uint64_t v40 = &v34[v38];
        uint64_t v41 = *((void *)v40 + 1);
        *(void *)uint64_t v39 = *(void *)v40;
        *((void *)v39 + 1) = v41;
        uint64_t v42 = *(int *)(v35 + 24);
        uint64_t v43 = &v33[v42];
        uint64_t v44 = &v34[v42];
        uint64_t v45 = *((void *)v44 + 1);
        *(void *)uint64_t v43 = *(void *)v44;
        *((void *)v43 + 1) = v45;
        uint64_t v46 = *(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v46(v33, 0, 1, v35);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v96 + 56))(v98, 0, 1, v12);
    }
    uint64_t v47 = a3[6];
    uint64_t v48 = a3[7];
    uint64_t v49 = (uint64_t *)((char *)a1 + v47);
    char v50 = (uint64_t *)((char *)a2 + v47);
    uint64_t v51 = v50[1];
    *uint64_t v49 = *v50;
    v49[1] = v51;
    uint64_t v52 = (char *)a1 + v48;
    uint64_t v53 = (char *)a2 + v48;
    v52[8] = v53[8];
    *(void *)uint64_t v52 = *(void *)v53;
    uint64_t v54 = a3[8];
    uint64_t v55 = (char *)a1 + v54;
    uint64_t v56 = (char *)a2 + v54;
    uint64_t v57 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
    uint64_t v58 = *((void *)v57 - 1);
    uint64_t v59 = *(unsigned int (**)(char *, uint64_t, int *))(v58 + 48);
    swift_bridgeObjectRetain();
    if (v59(v56, 1, v57))
    {
      uint64_t v60 = sub_25457523C(&qword_269E08480);
      memcpy(v55, v56, *(void *)(*(void *)(v60 - 8) + 64));
    }
    else
    {
      v99(v55, v56, v100);
      v55[v57[5]] = v56[v57[5]];
      uint64_t v61 = v57[6];
      uint64_t v62 = &v55[v61];
      uint64_t v63 = &v56[v61];
      uint64_t v64 = *((void *)v63 + 1);
      *(void *)uint64_t v62 = *(void *)v63;
      *((void *)v62 + 1) = v64;
      uint64_t v65 = v57[7];
      uint64_t v66 = &v55[v65];
      uint64_t v67 = &v56[v65];
      v66[4] = v67[4];
      *(_DWORD *)uint64_t v66 = *(_DWORD *)v67;
      uint64_t v68 = *(void (**)(char *, void, uint64_t, int *))(v58 + 56);
      swift_bridgeObjectRetain();
      v68(v55, 0, 1, v57);
    }
    uint64_t v69 = a3[9];
    uint64_t v70 = (char *)a1 + v69;
    uint64_t v71 = (char *)a2 + v69;
    if (v59((char *)a2 + v69, 1, v57))
    {
      uint64_t v72 = sub_25457523C(&qword_269E08480);
      memcpy(v70, v71, *(void *)(*(void *)(v72 - 8) + 64));
    }
    else
    {
      v99(v70, v71, v100);
      v70[v57[5]] = v71[v57[5]];
      uint64_t v73 = v57[6];
      uint64_t v74 = &v70[v73];
      uint64_t v75 = &v71[v73];
      uint64_t v76 = *((void *)v75 + 1);
      *(void *)uint64_t v74 = *(void *)v75;
      *((void *)v74 + 1) = v76;
      uint64_t v77 = v57[7];
      uint64_t v78 = &v70[v77];
      char v79 = &v71[v77];
      v78[4] = v79[4];
      *(_DWORD *)uint64_t v78 = *(_DWORD *)v79;
      uint64_t v80 = *(void (**)(char *, void, uint64_t, int *))(v58 + 56);
      swift_bridgeObjectRetain();
      v80(v70, 0, 1, v57);
    }
    uint64_t v81 = a3[10];
    uint64_t v82 = (char *)a1 + v81;
    uint64_t v83 = (char *)a2 + v81;
    if (v59(v83, 1, v57))
    {
      uint64_t v84 = sub_25457523C(&qword_269E08480);
      memcpy(v82, v83, *(void *)(*(void *)(v84 - 8) + 64));
    }
    else
    {
      v99(v82, v83, v100);
      v82[v57[5]] = v83[v57[5]];
      uint64_t v85 = v57[6];
      uint64_t v86 = &v82[v85];
      uint64_t v87 = &v83[v85];
      uint64_t v88 = *((void *)v87 + 1);
      *(void *)uint64_t v86 = *(void *)v87;
      *((void *)v86 + 1) = v88;
      uint64_t v89 = v57[7];
      uint64_t v90 = &v82[v89];
      char v91 = &v83[v89];
      v90[4] = v91[4];
      *(_DWORD *)uint64_t v90 = *(_DWORD *)v91;
      int v92 = *(void (**)(char *, void, uint64_t, int *))(v58 + 56);
      swift_bridgeObjectRetain();
      v92(v82, 0, 1, v57);
    }
  }
  return a1;
}

uint64_t sub_25457DCFC(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_254586DB0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    uint64_t v8 = v6 + *(int *)(v7 + 20);
    uint64_t v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
    {
      v5(v8, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v10 = v6 + *(int *)(v7 + 24);
    uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
    {
      v5(v10, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = a1 + a2[8];
  uint64_t v13 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
  if (!v14(v12, 1, v13))
  {
    v5(v12, v4);
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = a1 + a2[9];
  if (!v14(v15, 1, v13))
  {
    v5(v15, v4);
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = a1 + a2[10];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v14)(v16, 1, v13);
  if (!result)
  {
    v5(v16, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25457E024(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v97 = (void (*)(char *, char *, uint64_t))v7;
  uint64_t v98 = v6;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08488);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v94 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = *(int *)(v11 + 20);
    __dst = &v9[v14];
    uint64_t v96 = v9;
    uint64_t v15 = &v10[v14];
    uint64_t v16 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v92 = *((void *)v16 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v92 + 48))(v15, 1, v16))
    {
      uint64_t v17 = sub_25457523C(&qword_269E08270);
      memcpy(__dst, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v15, v6);
      uint64_t v18 = v16[5];
      uint64_t v19 = &__dst[v18];
      uint64_t v20 = &v15[v18];
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v21;
      uint64_t v22 = v16[6];
      uint64_t v23 = &__dst[v22];
      uint64_t v24 = &v15[v22];
      uint64_t v25 = *((void *)v24 + 1);
      *(void *)uint64_t v23 = *(void *)v24;
      *((void *)v23 + 1) = v25;
      uint64_t v26 = v16[7];
      uint64_t v27 = &__dst[v26];
      uint64_t v28 = &v15[v26];
      uint64_t v29 = *((void *)v28 + 1);
      *(void *)uint64_t v27 = *(void *)v28;
      *((void *)v27 + 1) = v29;
      uint64_t v93 = *(void (**)(char *, void, uint64_t, int *))(v92 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v93(__dst, 0, 1, v16);
    }
    uint64_t v30 = *(int *)(v11 + 24);
    uint64_t v31 = &v96[v30];
    uint64_t v32 = &v10[v30];
    uint64_t v33 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v34 = *(void *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      uint64_t v35 = sub_25457523C(&qword_269E08278);
      memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      v97(v31, v32, v6);
      uint64_t v36 = *(int *)(v33 + 20);
      uint64_t v37 = &v31[v36];
      uint64_t v38 = &v32[v36];
      uint64_t v39 = *((void *)v38 + 1);
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = v39;
      uint64_t v40 = *(int *)(v33 + 24);
      uint64_t v41 = &v31[v40];
      uint64_t v42 = &v32[v40];
      uint64_t v43 = *((void *)v42 + 1);
      *(void *)uint64_t v41 = *(void *)v42;
      *((void *)v41 + 1) = v43;
      uint64_t v44 = *(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v44(v31, 0, 1, v33);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v94 + 56))(v96, 0, 1, v11);
  }
  uint64_t v45 = a3[6];
  uint64_t v46 = a3[7];
  uint64_t v47 = (void *)(a1 + v45);
  uint64_t v48 = (void *)(a2 + v45);
  uint64_t v49 = v48[1];
  void *v47 = *v48;
  v47[1] = v49;
  uint64_t v50 = a1 + v46;
  uint64_t v51 = a2 + v46;
  *(unsigned char *)(v50 + 8) = *(unsigned char *)(v51 + 8);
  *(void *)uint64_t v50 = *(void *)v51;
  uint64_t v52 = a3[8];
  uint64_t v53 = (char *)(a1 + v52);
  uint64_t v54 = (char *)(a2 + v52);
  uint64_t v55 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v56 = *((void *)v55 - 1);
  uint64_t v57 = *(unsigned int (**)(char *, uint64_t, int *))(v56 + 48);
  swift_bridgeObjectRetain();
  if (v57(v54, 1, v55))
  {
    uint64_t v58 = sub_25457523C(&qword_269E08480);
    memcpy(v53, v54, *(void *)(*(void *)(v58 - 8) + 64));
  }
  else
  {
    v97(v53, v54, v98);
    v53[v55[5]] = v54[v55[5]];
    uint64_t v59 = v55[6];
    uint64_t v60 = &v53[v59];
    uint64_t v61 = &v54[v59];
    uint64_t v62 = *((void *)v61 + 1);
    *(void *)uint64_t v60 = *(void *)v61;
    *((void *)v60 + 1) = v62;
    uint64_t v63 = v55[7];
    uint64_t v64 = &v53[v63];
    uint64_t v65 = &v54[v63];
    v64[4] = v65[4];
    *(_DWORD *)uint64_t v64 = *(_DWORD *)v65;
    uint64_t v66 = *(void (**)(char *, void, uint64_t, int *))(v56 + 56);
    swift_bridgeObjectRetain();
    v66(v53, 0, 1, v55);
  }
  uint64_t v67 = a3[9];
  uint64_t v68 = (char *)(a1 + v67);
  uint64_t v69 = (char *)(a2 + v67);
  if (v57((char *)(a2 + v67), 1, v55))
  {
    uint64_t v70 = sub_25457523C(&qword_269E08480);
    memcpy(v68, v69, *(void *)(*(void *)(v70 - 8) + 64));
  }
  else
  {
    v97(v68, v69, v98);
    v68[v55[5]] = v69[v55[5]];
    uint64_t v71 = v55[6];
    uint64_t v72 = &v68[v71];
    uint64_t v73 = &v69[v71];
    uint64_t v74 = *((void *)v73 + 1);
    *(void *)uint64_t v72 = *(void *)v73;
    *((void *)v72 + 1) = v74;
    uint64_t v75 = v55[7];
    uint64_t v76 = &v68[v75];
    uint64_t v77 = &v69[v75];
    v76[4] = v77[4];
    *(_DWORD *)uint64_t v76 = *(_DWORD *)v77;
    uint64_t v78 = *(void (**)(char *, void, uint64_t, int *))(v56 + 56);
    swift_bridgeObjectRetain();
    v78(v68, 0, 1, v55);
  }
  uint64_t v79 = a3[10];
  uint64_t v80 = (char *)(a1 + v79);
  uint64_t v81 = (char *)(a2 + v79);
  if (v57(v81, 1, v55))
  {
    uint64_t v82 = sub_25457523C(&qword_269E08480);
    memcpy(v80, v81, *(void *)(*(void *)(v82 - 8) + 64));
  }
  else
  {
    v97(v80, v81, v98);
    v80[v55[5]] = v81[v55[5]];
    uint64_t v83 = v55[6];
    uint64_t v84 = &v80[v83];
    uint64_t v85 = &v81[v83];
    uint64_t v86 = *((void *)v85 + 1);
    *(void *)uint64_t v84 = *(void *)v85;
    *((void *)v84 + 1) = v86;
    uint64_t v87 = v55[7];
    uint64_t v88 = &v80[v87];
    uint64_t v89 = &v81[v87];
    v88[4] = v89[4];
    *(_DWORD *)uint64_t v88 = *(_DWORD *)v89;
    uint64_t v90 = *(void (**)(char *, void, uint64_t, int *))(v56 + 56);
    swift_bridgeObjectRetain();
    v90(v80, 0, 1, v55);
  }
  return a1;
}

uint64_t sub_25457E6E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v176 = *(void *)(v6 - 8);
  uint64_t v175 = *(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 24);
  v175(a1, a2, v6);
  v178 = a3;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  uint64_t v177 = v6;
  if (v13)
  {
    if (!v14)
    {
      uint64_t v172 = a2;
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v176 + 16);
      v15(v8, v9, v6);
      uint64_t v16 = *(int *)(v10 + 20);
      __dst = &v8[v16];
      uint64_t v17 = v6;
      uint64_t v18 = &v9[v16];
      uint64_t v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      uint64_t v20 = *((void *)v19 - 1);
      uint64_t v169 = v15;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = sub_25457523C(&qword_269E08270);
        memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        v15(__dst, v18, v17);
        uint64_t v31 = v19[5];
        uint64_t v32 = &__dst[v31];
        uint64_t v33 = &v18[v31];
        *(void *)uint64_t v32 = *(void *)v33;
        *((void *)v32 + 1) = *((void *)v33 + 1);
        uint64_t v34 = v19[6];
        uint64_t v35 = &__dst[v34];
        uint64_t v36 = &v18[v34];
        *(void *)uint64_t v35 = *(void *)v36;
        *((void *)v35 + 1) = *((void *)v36 + 1);
        uint64_t v37 = v19[7];
        uint64_t v38 = &__dst[v37];
        uint64_t v39 = &v18[v37];
        *(void *)uint64_t v38 = *(void *)v39;
        *((void *)v38 + 1) = *((void *)v39 + 1);
        uint64_t v40 = *(void (**)(char *, void, uint64_t, int *))(v20 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v40(__dst, 0, 1, v19);
      }
      uint64_t v41 = *(int *)(v10 + 24);
      uint64_t v42 = &v8[v41];
      uint64_t v43 = &v9[v41];
      uint64_t v44 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      uint64_t v45 = *(void *)(v44 - 8);
      a2 = v172;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44))
      {
        uint64_t v46 = sub_25457523C(&qword_269E08278);
        memcpy(v42, v43, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        v169(v42, v43, v177);
        uint64_t v47 = *(int *)(v44 + 20);
        uint64_t v48 = &v42[v47];
        uint64_t v49 = &v43[v47];
        *(void *)uint64_t v48 = *(void *)v49;
        *((void *)v48 + 1) = *((void *)v49 + 1);
        uint64_t v50 = *(int *)(v44 + 24);
        uint64_t v51 = &v42[v50];
        uint64_t v52 = &v43[v50];
        *(void *)uint64_t v51 = *(void *)v52;
        *((void *)v51 + 1) = *((void *)v52 + 1);
        uint64_t v53 = *(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v53(v42, 0, 1, v44);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  if (v14)
  {
    sub_254575BF8((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
LABEL_7:
    uint64_t v22 = sub_25457523C(&qword_269E08488);
    memcpy(v8, v9, *(void *)(*(void *)(v22 - 8) + 64));
LABEL_16:
    uint64_t v54 = v178;
    goto LABEL_17;
  }
  v175((uint64_t)v8, (uint64_t)v9, v6);
  uint64_t v23 = *(int *)(v10 + 20);
  uint64_t v24 = &v8[v23];
  uint64_t v25 = &v9[v23];
  uint64_t v26 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  __dsta = (void *)*((void *)v26 - 1);
  uint64_t v173 = (uint64_t)v24;
  uint64_t v27 = (uint64_t (*)(char *, uint64_t, int *))__dsta[6];
  LODWORD(v24) = v27(v24, 1, v26);
  int v28 = v27(v25, 1, v26);
  if (v24)
  {
    if (v28)
    {
      size_t v29 = *(void *)(*(void *)(sub_25457523C(&qword_269E08270) - 8) + 64);
      uint64_t v30 = (void *)v173;
LABEL_41:
      memcpy(v30, v25, v29);
      goto LABEL_44;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v176 + 16))(v173, v25, v177);
    uint64_t v129 = v26[5];
    uint64_t v130 = (void *)(v173 + v129);
    char v131 = &v25[v129];
    void *v130 = *(void *)v131;
    v130[1] = *((void *)v131 + 1);
    uint64_t v132 = v26[6];
    uint64_t v133 = (void *)(v173 + v132);
    uint64_t v134 = &v25[v132];
    *uint64_t v133 = *(void *)v134;
    v133[1] = *((void *)v134 + 1);
    uint64_t v135 = v26[7];
    uint64_t v136 = (void *)(v173 + v135);
    uint64_t v137 = &v25[v135];
    void *v136 = *(void *)v137;
    v136[1] = *((void *)v137 + 1);
    __src = (void (*)(uint64_t, void, uint64_t, int *))__dsta[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __src(v173, 0, 1, v26);
  }
  else
  {
    if (v28)
    {
      sub_254575BF8(v173, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
      size_t v29 = *(void *)(*(void *)(sub_25457523C(&qword_269E08270) - 8) + 64);
      uint64_t v30 = (void *)v173;
      goto LABEL_41;
    }
    v175(v173, (uint64_t)v25, v177);
    uint64_t v138 = v26[5];
    uint64_t v139 = (void *)(v173 + v138);
    uint64_t v140 = &v25[v138];
    void *v139 = *(void *)v140;
    v139[1] = *((void *)v140 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v141 = v26[6];
    uint64_t v142 = (void *)(v173 + v141);
    uint64_t v143 = &v25[v141];
    void *v142 = *(void *)v143;
    v142[1] = *((void *)v143 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v144 = v26[7];
    uint64_t v145 = (void *)(v173 + v144);
    uint64_t v146 = &v25[v144];
    *uint64_t v145 = *(void *)v146;
    v145[1] = *((void *)v146 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
LABEL_44:
  uint64_t v147 = *(int *)(v10 + 24);
  uint64_t v148 = &v8[v147];
  int v149 = &v9[v147];
  uint64_t v150 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v151 = *(void *)(v150 - 8);
  uint64_t v152 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v151 + 48);
  int v153 = v152(v148, 1, v150);
  int v154 = v152(v149, 1, v150);
  if (v153)
  {
    uint64_t v54 = v178;
    if (!v154)
    {
      (*(void (**)(char *, char *, uint64_t))(v176 + 16))(v148, v149, v177);
      uint64_t v155 = *(int *)(v150 + 20);
      uint64_t v156 = &v148[v155];
      uint64_t v157 = &v149[v155];
      *(void *)uint64_t v156 = *(void *)v157;
      *((void *)v156 + 1) = *((void *)v157 + 1);
      uint64_t v158 = *(int *)(v150 + 24);
      uint64_t v159 = &v148[v158];
      uint64_t v160 = &v149[v158];
      *(void *)uint64_t v159 = *(void *)v160;
      *((void *)v159 + 1) = *((void *)v160 + 1);
      uint64_t v161 = *(void (**)(char *, void, uint64_t, uint64_t))(v151 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v161(v148, 0, 1, v150);
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  uint64_t v54 = v178;
  if (v154)
  {
    sub_254575BF8((uint64_t)v148, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
LABEL_49:
    uint64_t v162 = sub_25457523C(&qword_269E08278);
    memcpy(v148, v149, *(void *)(*(void *)(v162 - 8) + 64));
    goto LABEL_17;
  }
  v175((uint64_t)v148, (uint64_t)v149, v177);
  uint64_t v163 = *(int *)(v150 + 20);
  uint64_t v164 = &v148[v163];
  uint64_t v165 = &v149[v163];
  *(void *)uint64_t v164 = *(void *)v165;
  *((void *)v164 + 1) = *((void *)v165 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v166 = *(int *)(v150 + 24);
  uint64_t v167 = &v148[v166];
  uint64_t v168 = &v149[v166];
  *(void *)uint64_t v167 = *(void *)v168;
  *((void *)v167 + 1) = *((void *)v168 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_17:
  uint64_t v55 = v54[6];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = (void *)(a2 + v55);
  void *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = v54[7];
  uint64_t v59 = a1 + v58;
  uint64_t v60 = (uint64_t *)(a2 + v58);
  uint64_t v61 = *v60;
  *(unsigned char *)(v59 + 8) = *((unsigned char *)v60 + 8);
  *(void *)uint64_t v59 = v61;
  uint64_t v62 = v54[8];
  uint64_t v63 = (unsigned char *)(a1 + v62);
  uint64_t v64 = (unsigned char *)(a2 + v62);
  uint64_t v65 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v66 = *((void *)v65 - 1);
  uint64_t v67 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v66 + 48);
  int v68 = v67(v63, 1, v65);
  int v69 = v67(v64, 1, v65);
  if (v68)
  {
    if (!v69)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v176 + 16))(v63, v64, v177);
      v63[v65[5]] = v64[v65[5]];
      uint64_t v70 = v65[6];
      uint64_t v71 = &v63[v70];
      uint64_t v72 = &v64[v70];
      *uint64_t v71 = *v72;
      v71[1] = v72[1];
      uint64_t v73 = v65[7];
      uint64_t v74 = &v63[v73];
      uint64_t v75 = &v64[v73];
      char v76 = v75[4];
      *(_DWORD *)uint64_t v74 = *(_DWORD *)v75;
      v74[4] = v76;
      uint64_t v77 = *(void (**)(unsigned char *, void, uint64_t, int *))(v66 + 56);
      swift_bridgeObjectRetain();
      v77(v63, 0, 1, v65);
      uint64_t v54 = v178;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v69)
  {
    sub_254575BF8((uint64_t)v63, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_22:
    uint64_t v78 = sub_25457523C(&qword_269E08480);
    memcpy(v63, v64, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_23;
  }
  v175((uint64_t)v63, (uint64_t)v64, v177);
  v63[v65[5]] = v64[v65[5]];
  uint64_t v108 = v65[6];
  uint64_t v109 = &v63[v108];
  uint64_t v110 = &v64[v108];
  *uint64_t v109 = *v110;
  v109[1] = v110[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v111 = v65[7];
  uint64_t v112 = &v63[v111];
  uint64_t v113 = &v64[v111];
  int v114 = *(_DWORD *)v113;
  v112[4] = v113[4];
  *(_DWORD *)uint64_t v112 = v114;
LABEL_23:
  uint64_t v79 = v54[9];
  uint64_t v80 = (unsigned char *)(a1 + v79);
  uint64_t v81 = (unsigned char *)(a2 + v79);
  int v82 = v67((unsigned char *)(a1 + v79), 1, v65);
  int v83 = v67(v81, 1, v65);
  if (v82)
  {
    if (!v83)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v176 + 16))(v80, v81, v177);
      v80[v65[5]] = v81[v65[5]];
      uint64_t v84 = v65[6];
      uint64_t v85 = &v80[v84];
      uint64_t v86 = &v81[v84];
      void *v85 = *v86;
      v85[1] = v86[1];
      uint64_t v87 = v65[7];
      uint64_t v88 = &v80[v87];
      uint64_t v89 = &v81[v87];
      char v90 = v89[4];
      *(_DWORD *)uint64_t v88 = *(_DWORD *)v89;
      v88[4] = v90;
      char v91 = *(void (**)(unsigned char *, void, uint64_t, int *))(v66 + 56);
      swift_bridgeObjectRetain();
      v91(v80, 0, 1, v65);
      uint64_t v54 = v178;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v83)
  {
    sub_254575BF8((uint64_t)v80, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_28:
    uint64_t v92 = sub_25457523C(&qword_269E08480);
    memcpy(v80, v81, *(void *)(*(void *)(v92 - 8) + 64));
    goto LABEL_29;
  }
  v175((uint64_t)v80, (uint64_t)v81, v177);
  v80[v65[5]] = v81[v65[5]];
  uint64_t v115 = v65[6];
  uint64_t v116 = &v80[v115];
  uint64_t v117 = &v81[v115];
  void *v116 = *v117;
  v116[1] = v117[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v118 = v65[7];
  uint64_t v119 = &v80[v118];
  uint64_t v120 = &v81[v118];
  int v121 = *(_DWORD *)v120;
  v119[4] = v120[4];
  *(_DWORD *)uint64_t v119 = v121;
LABEL_29:
  uint64_t v93 = v54[10];
  uint64_t v94 = (unsigned char *)(a1 + v93);
  uint64_t v95 = (unsigned char *)(a2 + v93);
  int v96 = v67((unsigned char *)(a1 + v93), 1, v65);
  int v97 = v67(v95, 1, v65);
  if (!v96)
  {
    if (!v97)
    {
      v175((uint64_t)v94, (uint64_t)v95, v177);
      v94[v65[5]] = v95[v65[5]];
      uint64_t v122 = v65[6];
      uint64_t v123 = &v94[v122];
      uint64_t v124 = &v95[v122];
      *uint64_t v123 = *v124;
      v123[1] = v124[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v125 = v65[7];
      uint64_t v126 = &v94[v125];
      uint64_t v127 = &v95[v125];
      int v128 = *(_DWORD *)v127;
      v126[4] = v127[4];
      *(_DWORD *)uint64_t v126 = v128;
      return a1;
    }
    sub_254575BF8((uint64_t)v94, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
    goto LABEL_34;
  }
  if (v97)
  {
LABEL_34:
    uint64_t v106 = sub_25457523C(&qword_269E08480);
    memcpy(v94, v95, *(void *)(*(void *)(v106 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v176 + 16))(v94, v95, v177);
  v94[v65[5]] = v95[v65[5]];
  uint64_t v98 = v65[6];
  uint64_t v99 = &v94[v98];
  uint64_t v100 = &v95[v98];
  *uint64_t v99 = *v100;
  v99[1] = v100[1];
  uint64_t v101 = v65[7];
  uint64_t v102 = &v94[v101];
  uint64_t v103 = &v95[v101];
  char v104 = v103[4];
  *(_DWORD *)uint64_t v102 = *(_DWORD *)v103;
  v102[4] = v104;
  char v105 = *(void (**)(unsigned char *, void, uint64_t, int *))(v66 + 56);
  swift_bridgeObjectRetain();
  v105(v94, 0, 1, v65);
  return a1;
}

uint64_t sub_25457F50C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v58 = (void (*)(char *, char *, uint64_t))v7;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08488);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v55 = v12;
    uint64_t v57 = a3;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v56 = v9;
    __dst = &v9[v14];
    uint64_t v15 = &v10[v14];
    uint64_t v16 = v6;
    uint64_t v17 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v18 = *((void *)v17 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v15, 1, v17))
    {
      uint64_t v19 = sub_25457523C(&qword_269E08270);
      memcpy(__dst, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v15, v16);
      *(_OWORD *)&__dst[v17[5]] = *(_OWORD *)&v15[v17[5]];
      *(_OWORD *)&__dst[v17[6]] = *(_OWORD *)&v15[v17[6]];
      *(_OWORD *)&__dst[v17[7]] = *(_OWORD *)&v15[v17[7]];
      (*(void (**)(char *, void, uint64_t, int *))(v18 + 56))(__dst, 0, 1, v17);
    }
    uint64_t v20 = *(int *)(v11 + 24);
    uint64_t v21 = &v56[v20];
    uint64_t v22 = &v10[v20];
    uint64_t v23 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v24 = *(void *)(v23 - 8);
    a3 = v57;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = sub_25457523C(&qword_269E08278);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
      uint64_t v6 = v16;
    }
    else
    {
      uint64_t v6 = v16;
      v58(v21, v22, v16);
      *(_OWORD *)&v21[*(int *)(v23 + 20)] = *(_OWORD *)&v22[*(int *)(v23 + 20)];
      *(_OWORD *)&v21[*(int *)(v23 + 24)] = *(_OWORD *)&v22[*(int *)(v23 + 24)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v56, 0, 1, v11);
  }
  uint64_t v26 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[8];
  uint64_t v30 = (char *)(a1 + v29);
  uint64_t v31 = (char *)(a2 + v29);
  uint64_t v32 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v33 = *((void *)v32 - 1);
  uint64_t v34 = *(unsigned int (**)(char *, uint64_t, int *))(v33 + 48);
  if (v34(v31, 1, v32))
  {
    uint64_t v35 = sub_25457523C(&qword_269E08480);
    memcpy(v30, v31, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    v58(v30, v31, v6);
    v30[v32[5]] = v31[v32[5]];
    *(_OWORD *)&v30[v32[6]] = *(_OWORD *)&v31[v32[6]];
    uint64_t v36 = v32[7];
    uint64_t v37 = &v30[v36];
    uint64_t v38 = &v31[v36];
    v37[4] = v38[4];
    *(_DWORD *)uint64_t v37 = *(_DWORD *)v38;
    (*(void (**)(char *, void, uint64_t, int *))(v33 + 56))(v30, 0, 1, v32);
  }
  uint64_t v39 = a3[9];
  uint64_t v40 = (char *)(a1 + v39);
  uint64_t v41 = (char *)(a2 + v39);
  if (v34((char *)(a2 + v39), 1, v32))
  {
    uint64_t v42 = sub_25457523C(&qword_269E08480);
    memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    v58(v40, v41, v6);
    v40[v32[5]] = v41[v32[5]];
    *(_OWORD *)&v40[v32[6]] = *(_OWORD *)&v41[v32[6]];
    uint64_t v43 = v32[7];
    uint64_t v44 = &v40[v43];
    uint64_t v45 = &v41[v43];
    v44[4] = v45[4];
    *(_DWORD *)uint64_t v44 = *(_DWORD *)v45;
    (*(void (**)(char *, void, uint64_t, int *))(v33 + 56))(v40, 0, 1, v32);
  }
  uint64_t v46 = a3[10];
  uint64_t v47 = (char *)(a1 + v46);
  uint64_t v48 = (char *)(a2 + v46);
  if (v34(v48, 1, v32))
  {
    uint64_t v49 = sub_25457523C(&qword_269E08480);
    memcpy(v47, v48, *(void *)(*(void *)(v49 - 8) + 64));
  }
  else
  {
    v58(v47, v48, v6);
    v47[v32[5]] = v48[v32[5]];
    *(_OWORD *)&v47[v32[6]] = *(_OWORD *)&v48[v32[6]];
    uint64_t v50 = v32[7];
    uint64_t v51 = &v47[v50];
    uint64_t v52 = &v48[v50];
    v51[4] = v52[4];
    *(_DWORD *)uint64_t v51 = *(_DWORD *)v52;
    (*(void (**)(char *, void, uint64_t, int *))(v33 + 56))(v47, 0, 1, v32);
  }
  return a1;
}

uint64_t sub_25457FB5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v141 = *(void *)(v6 - 8);
  uint64_t v140 = *(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 40);
  v140(a1, a2, v6);
  uint64_t v142 = a3;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  uint64_t v143 = v6;
  if (!v13)
  {
    if (v14)
    {
      sub_254575BF8((uint64_t)v8, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    v140((uint64_t)v8, (uint64_t)v9, v6);
    uint64_t v24 = *(int *)(v10 + 20);
    uint64_t v25 = &v8[v24];
    uint64_t v26 = &v9[v24];
    uint64_t v27 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    __dsta = (void *)*((void *)v27 - 1);
    uint64_t v28 = (uint64_t (*)(char *, uint64_t, int *))__dsta[6];
    uint64_t v139 = (uint64_t)v25;
    LODWORD(v25) = v28(v25, 1, v27);
    int v29 = v28(v26, 1, v27);
    if (v25)
    {
      if (v29)
      {
        size_t v30 = *(void *)(*(void *)(sub_25457523C(&qword_269E08270) - 8) + 64);
        uint64_t v31 = (void *)v139;
LABEL_18:
        memcpy(v31, v26, v30);
        goto LABEL_21;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v141 + 32))(v139, v26, v143);
      *(_OWORD *)(v139 + v27[5]) = *(_OWORD *)&v26[v27[5]];
      *(_OWORD *)(v139 + v27[6]) = *(_OWORD *)&v26[v27[6]];
      *(_OWORD *)(v139 + v27[7]) = *(_OWORD *)&v26[v27[7]];
      ((void (*)(uint64_t, void, uint64_t, int *))__dsta[7])(v139, 0, 1, v27);
    }
    else
    {
      if (v29)
      {
        sub_254575BF8(v139, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
        size_t v30 = *(void *)(*(void *)(sub_25457523C(&qword_269E08270) - 8) + 64);
        uint64_t v31 = (void *)v139;
        goto LABEL_18;
      }
      v140(v139, (uint64_t)v26, v143);
      uint64_t v38 = v27[5];
      uint64_t v39 = (void *)(v139 + v38);
      uint64_t v40 = &v26[v38];
      uint64_t v42 = *(void *)v40;
      uint64_t v41 = *((void *)v40 + 1);
      void *v39 = v42;
      v39[1] = v41;
      swift_bridgeObjectRelease();
      uint64_t v43 = v27[6];
      uint64_t v44 = (void *)(v139 + v43);
      uint64_t v45 = &v26[v43];
      uint64_t v47 = *(void *)v45;
      uint64_t v46 = *((void *)v45 + 1);
      *uint64_t v44 = v47;
      v44[1] = v46;
      swift_bridgeObjectRelease();
      uint64_t v48 = v27[7];
      uint64_t v49 = (void *)(v139 + v48);
      uint64_t v50 = &v26[v48];
      uint64_t v52 = *(void *)v50;
      uint64_t v51 = *((void *)v50 + 1);
      *uint64_t v49 = v52;
      v49[1] = v51;
      swift_bridgeObjectRelease();
    }
LABEL_21:
    uint64_t v53 = *(int *)(v10 + 24);
    uint64_t v54 = &v8[v53];
    uint64_t v55 = &v9[v53];
    uint64_t v56 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v57 = *(void *)(v56 - 8);
    uint64_t v58 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48);
    int v59 = v58(v54, 1, v56);
    int v60 = v58(v55, 1, v56);
    if (v59)
    {
      uint64_t v23 = v142;
      if (!v60)
      {
        (*(void (**)(char *, char *, uint64_t))(v141 + 32))(v54, v55, v143);
        *(_OWORD *)&v54[*(int *)(v56 + 20)] = *(_OWORD *)&v55[*(int *)(v56 + 20)];
        *(_OWORD *)&v54[*(int *)(v56 + 24)] = *(_OWORD *)&v55[*(int *)(v56 + 24)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v54, 0, 1, v56);
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v23 = v142;
      if (!v60)
      {
        v140((uint64_t)v54, (uint64_t)v55, v143);
        uint64_t v125 = *(int *)(v56 + 20);
        uint64_t v126 = &v54[v125];
        uint64_t v127 = &v55[v125];
        uint64_t v129 = *(void *)v127;
        uint64_t v128 = *((void *)v127 + 1);
        *(void *)uint64_t v126 = v129;
        *((void *)v126 + 1) = v128;
        swift_bridgeObjectRelease();
        uint64_t v130 = *(int *)(v56 + 24);
        char v131 = &v54[v130];
        uint64_t v132 = &v55[v130];
        uint64_t v134 = *(void *)v132;
        uint64_t v133 = *((void *)v132 + 1);
        *(void *)char v131 = v134;
        *((void *)v131 + 1) = v133;
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      sub_254575BF8((uint64_t)v54, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
    }
    uint64_t v61 = sub_25457523C(&qword_269E08278);
    memcpy(v54, v55, *(void *)(*(void *)(v61 - 8) + 64));
    goto LABEL_27;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v22 = sub_25457523C(&qword_269E08488);
    memcpy(v8, v9, *(void *)(*(void *)(v22 - 8) + 64));
    uint64_t v23 = v142;
    goto LABEL_27;
  }
  uint64_t v138 = a1;
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v141 + 32);
  v15(v8, v9, v6);
  uint64_t v16 = *(int *)(v10 + 20);
  __dst = &v8[v16];
  uint64_t v17 = &v9[v16];
  uint64_t v18 = v6;
  uint64_t v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v20 = *((void *)v19 - 1);
  uint64_t v135 = v15;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v17, 1, v19))
  {
    uint64_t v21 = sub_25457523C(&qword_269E08270);
    memcpy(__dst, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v15(__dst, v17, v18);
    *(_OWORD *)&__dst[v19[5]] = *(_OWORD *)&v17[v19[5]];
    *(_OWORD *)&__dst[v19[6]] = *(_OWORD *)&v17[v19[6]];
    *(_OWORD *)&__dst[v19[7]] = *(_OWORD *)&v17[v19[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v20 + 56))(__dst, 0, 1, v19);
  }
  uint64_t v32 = *(int *)(v10 + 24);
  uint64_t v33 = &v8[v32];
  uint64_t v34 = &v9[v32];
  uint64_t v35 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v36 = *(void *)(v35 - 8);
  a1 = v138;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    uint64_t v37 = sub_25457523C(&qword_269E08278);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    v135(v33, v34, v143);
    *(_OWORD *)&v33[*(int *)(v35 + 20)] = *(_OWORD *)&v34[*(int *)(v35 + 20)];
    *(_OWORD *)&v33[*(int *)(v35 + 24)] = *(_OWORD *)&v34[*(int *)(v35 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  uint64_t v23 = v142;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_27:
  uint64_t v62 = v23[6];
  uint64_t v63 = (void *)(a1 + v62);
  uint64_t v64 = (uint64_t *)(a2 + v62);
  uint64_t v66 = *v64;
  uint64_t v65 = v64[1];
  *uint64_t v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  uint64_t v67 = v23[7];
  uint64_t v68 = v23[8];
  uint64_t v69 = a1 + v67;
  uint64_t v70 = a2 + v67;
  *(void *)uint64_t v69 = *(void *)v70;
  *(unsigned char *)(v69 + 8) = *(unsigned char *)(v70 + 8);
  uint64_t v71 = (unsigned char *)(a1 + v68);
  uint64_t v72 = (unsigned char *)(a2 + v68);
  uint64_t v73 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus(0);
  uint64_t v74 = *((void *)v73 - 1);
  uint64_t v75 = *(uint64_t (**)(unsigned char *, uint64_t, int *))(v74 + 48);
  int v76 = v75(v71, 1, v73);
  int v77 = v75(v72, 1, v73);
  if (v76)
  {
    if (!v77)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v141 + 32))(v71, v72, v143);
      v71[v73[5]] = v72[v73[5]];
      *(_OWORD *)&v71[v73[6]] = *(_OWORD *)&v72[v73[6]];
      uint64_t v78 = v73[7];
      uint64_t v79 = &v71[v78];
      uint64_t v80 = &v72[v78];
      v79[4] = v80[4];
      *(_DWORD *)uint64_t v79 = *(_DWORD *)v80;
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v74 + 56))(v71, 0, 1, v73);
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (v77)
  {
    sub_254575BF8((uint64_t)v71, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_32:
    uint64_t v81 = sub_25457523C(&qword_269E08480);
    memcpy(v71, v72, *(void *)(*(void *)(v81 - 8) + 64));
    goto LABEL_33;
  }
  v140((uint64_t)v71, (uint64_t)v72, v143);
  v71[v73[5]] = v72[v73[5]];
  uint64_t v101 = v73[6];
  uint64_t v102 = &v71[v101];
  uint64_t v103 = (uint64_t *)&v72[v101];
  uint64_t v105 = *v103;
  uint64_t v104 = v103[1];
  *uint64_t v102 = v105;
  v102[1] = v104;
  swift_bridgeObjectRelease();
  uint64_t v106 = v73[7];
  uint64_t v107 = &v71[v106];
  uint64_t v108 = &v72[v106];
  *(_DWORD *)uint64_t v107 = *(_DWORD *)v108;
  v107[4] = v108[4];
LABEL_33:
  uint64_t v82 = v23[9];
  int v83 = (unsigned char *)(a1 + v82);
  uint64_t v84 = (unsigned char *)(a2 + v82);
  int v85 = v75((unsigned char *)(a1 + v82), 1, v73);
  int v86 = v75(v84, 1, v73);
  if (v85)
  {
    if (!v86)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v141 + 32))(v83, v84, v143);
      v83[v73[5]] = v84[v73[5]];
      *(_OWORD *)&v83[v73[6]] = *(_OWORD *)&v84[v73[6]];
      uint64_t v87 = v73[7];
      uint64_t v88 = &v83[v87];
      uint64_t v89 = &v84[v87];
      v88[4] = v89[4];
      *(_DWORD *)uint64_t v88 = *(_DWORD *)v89;
      (*(void (**)(unsigned char *, void, uint64_t, int *))(v74 + 56))(v83, 0, 1, v73);
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v86)
  {
    sub_254575BF8((uint64_t)v83, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
LABEL_38:
    uint64_t v90 = sub_25457523C(&qword_269E08480);
    memcpy(v83, v84, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_39;
  }
  v140((uint64_t)v83, (uint64_t)v84, v143);
  v83[v73[5]] = v84[v73[5]];
  uint64_t v109 = v73[6];
  uint64_t v110 = &v83[v109];
  uint64_t v111 = (uint64_t *)&v84[v109];
  uint64_t v113 = *v111;
  uint64_t v112 = v111[1];
  *uint64_t v110 = v113;
  v110[1] = v112;
  swift_bridgeObjectRelease();
  uint64_t v114 = v73[7];
  uint64_t v115 = &v83[v114];
  uint64_t v116 = &v84[v114];
  *(_DWORD *)uint64_t v115 = *(_DWORD *)v116;
  v115[4] = v116[4];
LABEL_39:
  uint64_t v91 = v23[10];
  uint64_t v92 = (unsigned char *)(a1 + v91);
  uint64_t v93 = (unsigned char *)(a2 + v91);
  int v94 = v75((unsigned char *)(a1 + v91), 1, v73);
  int v95 = v75(v93, 1, v73);
  if (!v94)
  {
    if (!v95)
    {
      v140((uint64_t)v92, (uint64_t)v93, v143);
      v92[v73[5]] = v93[v73[5]];
      uint64_t v117 = v73[6];
      uint64_t v118 = &v92[v117];
      uint64_t v119 = (uint64_t *)&v93[v117];
      uint64_t v121 = *v119;
      uint64_t v120 = v119[1];
      void *v118 = v121;
      v118[1] = v120;
      swift_bridgeObjectRelease();
      uint64_t v122 = v73[7];
      uint64_t v123 = &v92[v122];
      uint64_t v124 = &v93[v122];
      *(_DWORD *)uint64_t v123 = *(_DWORD *)v124;
      v123[4] = v124[4];
      return a1;
    }
    sub_254575BF8((uint64_t)v92, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
    goto LABEL_44;
  }
  if (v95)
  {
LABEL_44:
    uint64_t v99 = sub_25457523C(&qword_269E08480);
    memcpy(v92, v93, *(void *)(*(void *)(v99 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v141 + 32))(v92, v93, v143);
  v92[v73[5]] = v93[v73[5]];
  *(_OWORD *)&v92[v73[6]] = *(_OWORD *)&v93[v73[6]];
  uint64_t v96 = v73[7];
  int v97 = &v92[v96];
  uint64_t v98 = &v93[v96];
  v97[4] = v98[4];
  *(_DWORD *)int v97 = *(_DWORD *)v98;
  (*(void (**)(unsigned char *, void, uint64_t, int *))(v74 + 56))(v92, 0, 1, v73);
  return a1;
}

uint64_t sub_2545807DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2545807F0);
}

uint64_t sub_2545807F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25457523C(&qword_269E08488);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    int v15 = v14 - 1;
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = sub_25457523C(&qword_269E08480);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[8];
    return v17(v19, a2, v18);
  }
}

uint64_t sub_254580988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25458099C);
}

uint64_t sub_25458099C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_254586DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_25457523C(&qword_269E08488);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[6] + 8) = a2;
  }
  else
  {
    uint64_t v15 = sub_25457523C(&qword_269E08480);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[8];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_254580B28()
{
  sub_254586DB0();
  if (v0 <= 0x3F)
  {
    sub_25456EDE4(319, &qword_269E08148, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    if (v1 <= 0x3F)
    {
      sub_25456EDE4(319, &qword_269E08510, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent.EventStatus);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void *sub_254580C7C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    int v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    v13[4] = v14[4];
    *(_DWORD *)int v13 = *(_DWORD *)v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_254580D78(uint64_t a1)
{
  uint64_t v2 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_254580DF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)(v12 + 4) = *(unsigned char *)(v13 + 4);
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_254580E9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (int *)(a2 + v10);
  int v13 = *v12;
  *(unsigned char *)(v11 + 4) = *((unsigned char *)v12 + 4);
  *(_DWORD *)uint64_t v11 = v13;
  return a1;
}

uint64_t sub_254580F60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(unsigned char *)(v9 + 4) = *(unsigned char *)(v10 + 4);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
  return a1;
}

uint64_t sub_254581000(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(unsigned char *)(v13 + 4) = *(unsigned char *)(v14 + 4);
  return a1;
}

uint64_t sub_2545810B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2545810C4);
}

uint64_t sub_2545810C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_254581198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2545811AC);
}

uint64_t sub_2545811B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_254586DB0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_254581270()
{
  uint64_t result = sub_254586DB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_254581318(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_254586DB0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    unint64_t v10 = &a1[v9];
    int v11 = &a2[v9];
    uint64_t v12 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_25457523C(&qword_269E08488);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v60 = v13;
      v8(v10, v11, v7);
      uint64_t v16 = *(int *)(v12 + 20);
      uint64_t v62 = v10;
      __dst = &v10[v16];
      uint64_t v17 = v8;
      uint64_t v18 = &v11[v16];
      uint64_t v19 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
      uint64_t v20 = *((void *)v19 - 1);
      int v59 = v17;
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = sub_25457523C(&qword_269E08270);
        memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        v17(__dst, v18, v7);
        uint64_t v22 = v19[5];
        uint64_t v23 = &__dst[v22];
        uint64_t v24 = &v18[v22];
        uint64_t v25 = *((void *)v24 + 1);
        *(void *)uint64_t v23 = *(void *)v24;
        *((void *)v23 + 1) = v25;
        uint64_t v26 = v19[6];
        uint64_t v27 = &__dst[v26];
        uint64_t v28 = &v18[v26];
        uint64_t v57 = *((void *)v28 + 1);
        *(void *)uint64_t v27 = *(void *)v28;
        *((void *)v27 + 1) = v57;
        uint64_t v29 = v19[7];
        size_t v30 = &__dst[v29];
        uint64_t v31 = &v18[v29];
        uint64_t v32 = *((void *)v31 + 1);
        *(void *)size_t v30 = *(void *)v31;
        *((void *)v30 + 1) = v32;
        uint64_t v58 = *(void (**)(char *, void, uint64_t, int *))(v20 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v58(__dst, 0, 1, v19);
      }
      uint64_t v33 = *(int *)(v12 + 24);
      uint64_t v34 = &v62[v33];
      uint64_t v35 = &v11[v33];
      uint64_t v36 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
      uint64_t v37 = *(void *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        uint64_t v38 = sub_25457523C(&qword_269E08278);
        memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        v59(v34, v35, v7);
        uint64_t v39 = *(int *)(v36 + 20);
        uint64_t v40 = &v34[v39];
        uint64_t v41 = &v35[v39];
        uint64_t v42 = *((void *)v41 + 1);
        *(void *)uint64_t v40 = *(void *)v41;
        *((void *)v40 + 1) = v42;
        uint64_t v43 = *(int *)(v36 + 24);
        uint64_t v44 = &v34[v43];
        uint64_t v45 = &v35[v43];
        uint64_t v46 = *((void *)v45 + 1);
        *(void *)uint64_t v44 = *(void *)v45;
        *((void *)v44 + 1) = v46;
        uint64_t v47 = *(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v47(v34, 0, 1, v36);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v62, 0, 1, v12);
    }
    uint64_t v48 = a3[6];
    uint64_t v49 = a3[7];
    uint64_t v50 = &a1[v48];
    uint64_t v51 = &a2[v48];
    uint64_t v52 = *((void *)v51 + 1);
    *(void *)uint64_t v50 = *(void *)v51;
    *((void *)v50 + 1) = v52;
    uint64_t v53 = &a1[v49];
    uint64_t v54 = &a2[v49];
    v53[8] = v54[8];
    *(void *)uint64_t v53 = *(void *)v54;
    uint64_t v55 = a3[9];
    a1[a3[8]] = a2[a3[8]];
    a1[v55] = a2[v55];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_254581780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_254586DB0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    uint64_t v8 = v6 + *(int *)(v7 + 20);
    uint64_t v9 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
    {
      v5(v8, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v10 = v6 + *(int *)(v7 + 24);
    uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
    {
      v5(v10, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_25458198C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08488);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v58 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v60 = v9;
    __dst = &v9[v14];
    uint64_t v15 = v7;
    uint64_t v16 = &v10[v14];
    uint64_t v17 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v18 = *((void *)v17 - 1);
    uint64_t v57 = (void (*)(char *, char *, uint64_t))v15;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_25457523C(&qword_269E08270);
      memcpy(__dst, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v15((uint64_t)__dst, (uint64_t)v16, v6);
      uint64_t v20 = v17[5];
      uint64_t v21 = &__dst[v20];
      uint64_t v22 = &v16[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = v17[6];
      uint64_t v25 = &__dst[v24];
      uint64_t v26 = &v16[v24];
      uint64_t v55 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v55;
      uint64_t v27 = v17[7];
      uint64_t v28 = &__dst[v27];
      uint64_t v29 = &v16[v27];
      uint64_t v30 = *((void *)v29 + 1);
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = v30;
      uint64_t v56 = *(void (**)(char *, void, uint64_t, int *))(v18 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v56(__dst, 0, 1, v17);
    }
    uint64_t v31 = *(int *)(v11 + 24);
    uint64_t v32 = &v60[v31];
    uint64_t v33 = &v10[v31];
    uint64_t v34 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      uint64_t v36 = sub_25457523C(&qword_269E08278);
      memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      v57(v32, v33, v6);
      uint64_t v37 = *(int *)(v34 + 20);
      uint64_t v38 = &v32[v37];
      uint64_t v39 = &v33[v37];
      uint64_t v40 = *((void *)v39 + 1);
      *(void *)uint64_t v38 = *(void *)v39;
      *((void *)v38 + 1) = v40;
      uint64_t v41 = *(int *)(v34 + 24);
      uint64_t v42 = &v32[v41];
      uint64_t v43 = &v33[v41];
      uint64_t v44 = *((void *)v43 + 1);
      *(void *)uint64_t v42 = *(void *)v43;
      *((void *)v42 + 1) = v44;
      uint64_t v45 = *(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45(v32, 0, 1, v34);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v60, 0, 1, v11);
  }
  uint64_t v46 = a3[6];
  uint64_t v47 = a3[7];
  uint64_t v48 = (void *)(a1 + v46);
  uint64_t v49 = (void *)(a2 + v46);
  uint64_t v50 = v49[1];
  *uint64_t v48 = *v49;
  v48[1] = v50;
  uint64_t v51 = a1 + v47;
  uint64_t v52 = a2 + v47;
  *(unsigned char *)(v51 + 8) = *(unsigned char *)(v52 + 8);
  *(void *)uint64_t v51 = *(void *)v52;
  uint64_t v53 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v53) = *(unsigned char *)(a2 + v53);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_254581DA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v119 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v119 + 24);
  uint64_t v118 = v6;
  v7(a1, a2);
  uint64_t v121 = a3;
  uint64_t v122 = a1;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v120 = a2;
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v117 = *(void *)(v11 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v117 + 48);
  uint64_t v13 = v9;
  LODWORD(v9) = v12(v9, 1, v11);
  int v14 = v12(v10, 1, v11);
  if (!v9)
  {
    if (v14)
    {
      sub_254575BF8((uint64_t)v13, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    ((void (*)(char *, char *, uint64_t))v7)(v13, v10, v118);
    uint64_t v116 = v11;
    uint64_t v28 = *(int *)(v11 + 20);
    uint64_t v29 = &v13[v28];
    uint64_t v114 = v10;
    uint64_t v30 = &v10[v28];
    uint64_t v31 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v32 = *((void *)v31 - 1);
    uint64_t v33 = *(uint64_t (**)(char *, uint64_t, int *))(v32 + 48);
    int v34 = v33(v29, 1, v31);
    int v35 = v33(v30, 1, v31);
    if (v34)
    {
      uint64_t v36 = v119;
      if (!v35)
      {
        (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v29, v30, v118);
        uint64_t v37 = v31[5];
        uint64_t v38 = &v29[v37];
        uint64_t v39 = &v30[v37];
        *(void *)uint64_t v38 = *(void *)v39;
        *((void *)v38 + 1) = *((void *)v39 + 1);
        uint64_t v40 = v31[6];
        uint64_t v41 = &v29[v40];
        uint64_t v42 = &v30[v40];
        *(void *)uint64_t v41 = *(void *)v42;
        *((void *)v41 + 1) = *((void *)v42 + 1);
        uint64_t v43 = v31[7];
        uint64_t v44 = &v29[v43];
        uint64_t v45 = &v30[v43];
        *(void *)uint64_t v44 = *(void *)v45;
        *((void *)v44 + 1) = *((void *)v45 + 1);
        uint64_t v46 = *(void (**)(char *, void, uint64_t, int *))(v32 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v46(v29, 0, 1, v31);
LABEL_19:
        uint64_t v71 = (void (*)(char *, char *, uint64_t))v7;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v36 = v119;
      if (!v35)
      {
        int v97 = v30;
        uint64_t v98 = v30;
        uint64_t v71 = (void (*)(char *, char *, uint64_t))v7;
        ((void (*)(char *, char *, uint64_t))v7)(v29, v97, v118);
        uint64_t v99 = v31[5];
        uint64_t v100 = &v29[v99];
        uint64_t v101 = &v98[v99];
        *(void *)uint64_t v100 = *(void *)v101;
        *((void *)v100 + 1) = *((void *)v101 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v102 = v31[6];
        uint64_t v103 = &v29[v102];
        uint64_t v104 = &v98[v102];
        *(void *)uint64_t v103 = *(void *)v104;
        *((void *)v103 + 1) = *((void *)v104 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v105 = v31[7];
        uint64_t v106 = &v29[v105];
        uint64_t v107 = &v98[v105];
        *(void *)uint64_t v106 = *(void *)v107;
        *((void *)v106 + 1) = *((void *)v107 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
LABEL_20:
        uint64_t v24 = v120;
        uint64_t v72 = *(int *)(v116 + 24);
        uint64_t v73 = &v13[v72];
        uint64_t v74 = &v114[v72];
        uint64_t v75 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
        uint64_t v76 = *(void *)(v75 - 8);
        int v77 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 48);
        int v78 = v77(v73, 1, v75);
        int v79 = v77(v74, 1, v75);
        if (v78)
        {
          uint64_t v80 = v76;
          uint64_t v27 = v122;
          if (!v79)
          {
            (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v73, v74, v118);
            uint64_t v81 = *(int *)(v75 + 20);
            uint64_t v82 = &v73[v81];
            int v83 = &v74[v81];
            *(void *)uint64_t v82 = *(void *)v83;
            *((void *)v82 + 1) = *((void *)v83 + 1);
            uint64_t v84 = *(int *)(v75 + 24);
            int v85 = &v73[v84];
            int v86 = &v74[v84];
            *(void *)int v85 = *(void *)v86;
            *((void *)v85 + 1) = *((void *)v86 + 1);
            uint64_t v87 = *(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v87(v73, 0, 1, v75);
LABEL_26:
            a3 = v121;
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t v27 = v122;
          if (!v79)
          {
            v71(v73, v74, v118);
            uint64_t v108 = *(int *)(v75 + 20);
            uint64_t v109 = &v73[v108];
            uint64_t v110 = &v74[v108];
            *(void *)uint64_t v109 = *(void *)v110;
            *((void *)v109 + 1) = *((void *)v110 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v111 = *(int *)(v75 + 24);
            uint64_t v112 = &v73[v111];
            uint64_t v113 = &v74[v111];
            *(void *)uint64_t v112 = *(void *)v113;
            *((void *)v112 + 1) = *((void *)v113 + 1);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            goto LABEL_26;
          }
          sub_254575BF8((uint64_t)v73, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
        }
        uint64_t v88 = sub_25457523C(&qword_269E08278);
        memcpy(v73, v74, *(void *)(*(void *)(v88 - 8) + 64));
        goto LABEL_26;
      }
      sub_254575BF8((uint64_t)v29, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    }
    uint64_t v70 = sub_25457523C(&qword_269E08270);
    memcpy(v29, v30, *(void *)(*(void *)(v70 - 8) + 64));
    goto LABEL_19;
  }
  if (!v14)
  {
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
    uint64_t v16 = v13;
    uint64_t v17 = v13;
    uint64_t v18 = v10;
    v15(v17, v10, v118);
    uint64_t v115 = v11;
    uint64_t v19 = *(int *)(v11 + 20);
    uint64_t v20 = &v16[v19];
    uint64_t v21 = &v10[v19];
    uint64_t v22 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v23 = *((void *)v22 - 1);
    uint64_t v24 = v120;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
    {
      uint64_t v25 = sub_25457523C(&qword_269E08270);
      memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v15(v20, v21, v118);
      uint64_t v47 = v22[5];
      uint64_t v48 = &v20[v47];
      uint64_t v49 = &v21[v47];
      *(void *)uint64_t v48 = *(void *)v49;
      *((void *)v48 + 1) = *((void *)v49 + 1);
      uint64_t v50 = v22[6];
      uint64_t v51 = &v20[v50];
      uint64_t v52 = &v21[v50];
      *(void *)uint64_t v51 = *(void *)v52;
      *((void *)v51 + 1) = *((void *)v52 + 1);
      uint64_t v53 = v22[7];
      uint64_t v54 = &v20[v53];
      uint64_t v55 = &v21[v53];
      *(void *)uint64_t v54 = *(void *)v55;
      *((void *)v54 + 1) = *((void *)v55 + 1);
      uint64_t v56 = *(void (**)(char *, void, uint64_t, int *))(v23 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v56(v20, 0, 1, v22);
    }
    uint64_t v57 = *(int *)(v11 + 24);
    uint64_t v58 = &v16[v57];
    int v59 = &v18[v57];
    uint64_t v60 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v61 = *(void *)(v60 - 8);
    uint64_t v27 = v122;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(v59, 1, v60))
    {
      uint64_t v62 = sub_25457523C(&qword_269E08278);
      memcpy(v58, v59, *(void *)(*(void *)(v62 - 8) + 64));
    }
    else
    {
      v15(v58, v59, v118);
      uint64_t v63 = *(int *)(v60 + 20);
      uint64_t v64 = &v58[v63];
      uint64_t v65 = &v59[v63];
      *(void *)uint64_t v64 = *(void *)v65;
      *((void *)v64 + 1) = *((void *)v65 + 1);
      uint64_t v66 = *(int *)(v60 + 24);
      uint64_t v67 = &v58[v66];
      uint64_t v68 = &v59[v66];
      *(void *)uint64_t v67 = *(void *)v68;
      *((void *)v67 + 1) = *((void *)v68 + 1);
      uint64_t v69 = *(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v69(v58, 0, 1, v60);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v117 + 56))(v16, 0, 1, v115);
    goto LABEL_26;
  }
LABEL_7:
  uint64_t v26 = sub_25457523C(&qword_269E08488);
  memcpy(v13, v10, *(void *)(*(void *)(v26 - 8) + 64));
  uint64_t v24 = v120;
  uint64_t v27 = v122;
LABEL_27:
  uint64_t v89 = a3[6];
  uint64_t v90 = (void *)(v27 + v89);
  uint64_t v91 = (void *)(v24 + v89);
  *uint64_t v90 = *v91;
  v90[1] = v91[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v92 = a3[7];
  uint64_t v93 = v27 + v92;
  int v94 = (uint64_t *)(v24 + v92);
  uint64_t v95 = *v94;
  *(unsigned char *)(v93 + 8) = *((unsigned char *)v94 + 8);
  *(void *)uint64_t v93 = v95;
  *(unsigned char *)(v27 + a3[8]) = *(unsigned char *)(v24 + a3[8]);
  *(unsigned char *)(v27 + a3[9]) = *(unsigned char *)(v24 + a3[9]);
  return v27;
}

uint64_t sub_2545826F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_25457523C(&qword_269E08488);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v33 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = *(int *)(v11 + 20);
    int v34 = v9;
    __dst = &v9[v14];
    uint64_t v15 = v7;
    uint64_t v16 = &v10[v14];
    uint64_t v17 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v18 = *((void *)v17 - 1);
    uint64_t v31 = (void (*)(char *, char *, uint64_t))v15;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_25457523C(&qword_269E08270);
      memcpy(__dst, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v15((uint64_t)__dst, (uint64_t)v16, v6);
      *(_OWORD *)&__dst[v17[5]] = *(_OWORD *)&v16[v17[5]];
      *(_OWORD *)&__dst[v17[6]] = *(_OWORD *)&v16[v17[6]];
      *(_OWORD *)&__dst[v17[7]] = *(_OWORD *)&v16[v17[7]];
      (*(void (**)(char *, void, uint64_t, int *))(v18 + 56))(__dst, 0, 1, v17);
    }
    uint64_t v20 = *(int *)(v11 + 24);
    uint64_t v21 = &v34[v20];
    uint64_t v22 = &v10[v20];
    uint64_t v23 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = sub_25457523C(&qword_269E08278);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v31(v21, v22, v6);
      *(_OWORD *)&v21[*(int *)(v23 + 20)] = *(_OWORD *)&v22[*(int *)(v23 + 20)];
      *(_OWORD *)&v21[*(int *)(v23 + 24)] = *(_OWORD *)&v22[*(int *)(v23 + 24)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v34, 0, 1, v11);
  }
  uint64_t v26 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v29) = *(unsigned char *)(a2 + v29);
  return a1;
}

uint64_t sub_254582AAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v92 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v92 + 40);
  uint64_t v93 = v6;
  v7(a1, a2);
  uint64_t v94 = a2;
  uint64_t v95 = a3;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers(0);
  uint64_t v90 = *(void *)(v11 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v90 + 48);
  uint64_t v13 = v9;
  LODWORD(v9) = v12(v9, 1, v11);
  uint64_t v14 = v10;
  int v15 = v12(v10, 1, v11);
  if (!v9)
  {
    uint64_t v91 = (void (*)(char *, char *, uint64_t))v7;
    if (v15)
    {
      sub_254575BF8((uint64_t)v13, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
      goto LABEL_7;
    }
    uint64_t v27 = v13;
    uint64_t v28 = v10;
    uint64_t v29 = v27;
    ((void (*)(void))v7)();
    uint64_t v30 = *(int *)(v11 + 20);
    uint64_t v31 = &v29[v30];
    uint64_t v32 = &v14[v30];
    uint64_t v33 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
    uint64_t v88 = *((void *)v33 - 1);
    int v34 = *(uint64_t (**)(char *, uint64_t, int *))(v88 + 48);
    int v35 = v34(v31, 1, v33);
    int v36 = v34(v32, 1, v33);
    if (v35)
    {
      if (!v36)
      {
        (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v31, v32, v93);
        *(_OWORD *)&v31[v33[5]] = *(_OWORD *)&v32[v33[5]];
        *(_OWORD *)&v31[v33[6]] = *(_OWORD *)&v32[v33[6]];
        *(_OWORD *)&v31[v33[7]] = *(_OWORD *)&v32[v33[7]];
        (*(void (**)(char *, void, uint64_t, int *))(v88 + 56))(v31, 0, 1, v33);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v36)
      {
        v91(v31, v32, v93);
        uint64_t v63 = v33[5];
        uint64_t v64 = &v31[v63];
        uint64_t v65 = &v32[v63];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        *(void *)uint64_t v64 = v67;
        *((void *)v64 + 1) = v66;
        swift_bridgeObjectRelease();
        uint64_t v68 = v33[6];
        uint64_t v69 = &v31[v68];
        uint64_t v70 = &v32[v68];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        *(void *)uint64_t v69 = v72;
        *((void *)v69 + 1) = v71;
        swift_bridgeObjectRelease();
        uint64_t v73 = v33[7];
        uint64_t v74 = &v31[v73];
        uint64_t v75 = &v32[v73];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        *(void *)uint64_t v74 = v77;
        *((void *)v74 + 1) = v76;
        swift_bridgeObjectRelease();
LABEL_19:
        uint64_t v24 = v94;
        uint64_t v44 = *(int *)(v11 + 24);
        uint64_t v45 = &v29[v44];
        uint64_t v46 = &v28[v44];
        uint64_t v47 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
        uint64_t v48 = *(void *)(v47 - 8);
        uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
        int v50 = v49(v45, 1, v47);
        int v51 = v49(v46, 1, v47);
        if (v50)
        {
          a3 = v95;
          if (!v51)
          {
            (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v45, v46, v93);
            *(_OWORD *)&v45[*(int *)(v47 + 20)] = *(_OWORD *)&v46[*(int *)(v47 + 20)];
            *(_OWORD *)&v45[*(int *)(v47 + 24)] = *(_OWORD *)&v46[*(int *)(v47 + 24)];
            (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
            goto LABEL_25;
          }
        }
        else
        {
          a3 = v95;
          if (!v51)
          {
            v91(v45, v46, v93);
            uint64_t v78 = *(int *)(v47 + 20);
            int v79 = &v45[v78];
            uint64_t v80 = &v46[v78];
            uint64_t v82 = *(void *)v80;
            uint64_t v81 = *((void *)v80 + 1);
            *(void *)int v79 = v82;
            *((void *)v79 + 1) = v81;
            swift_bridgeObjectRelease();
            uint64_t v83 = *(int *)(v47 + 24);
            uint64_t v84 = &v45[v83];
            int v85 = &v46[v83];
            uint64_t v87 = *(void *)v85;
            uint64_t v86 = *((void *)v85 + 1);
            *(void *)uint64_t v84 = v87;
            *((void *)v84 + 1) = v86;
            swift_bridgeObjectRelease();
            goto LABEL_25;
          }
          sub_254575BF8((uint64_t)v45, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers);
        }
        uint64_t v52 = sub_25457523C(&qword_269E08278);
        memcpy(v45, v46, *(void *)(*(void *)(v52 - 8) + 64));
        goto LABEL_25;
      }
      sub_254575BF8((uint64_t)v31, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers);
    }
    uint64_t v43 = sub_25457523C(&qword_269E08270);
    memcpy(v31, v32, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_19;
  }
  if (v15)
  {
LABEL_7:
    uint64_t v26 = sub_25457523C(&qword_269E08488);
    memcpy(v13, v10, *(void *)(*(void *)(v26 - 8) + 64));
    uint64_t v24 = v94;
    goto LABEL_25;
  }
  uint64_t v16 = v13;
  uint64_t v17 = v13;
  uint64_t v18 = v10;
  uint64_t v89 = *(void (**)(void *, char *, uint64_t))(v92 + 32);
  v89(v17, v10, v93);
  uint64_t v19 = *(int *)(v11 + 20);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v10[v19];
  uint64_t v22 = (int *)type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.ExperimentIdentifiers(0);
  uint64_t v23 = *((void *)v22 - 1);
  uint64_t v24 = v94;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v25 = sub_25457523C(&qword_269E08270);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    v89(v20, v21, v93);
    *(_OWORD *)&v20[v22[5]] = *(_OWORD *)&v21[v22[5]];
    *(_OWORD *)&v20[v22[6]] = *(_OWORD *)&v21[v22[6]];
    *(_OWORD *)&v20[v22[7]] = *(_OWORD *)&v21[v22[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v23 + 56))(v20, 0, 1, v22);
  }
  uint64_t v37 = *(int *)(v11 + 24);
  uint64_t v38 = &v16[v37];
  uint64_t v39 = &v18[v37];
  uint64_t v40 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers.BMLTIdentifiers(0);
  uint64_t v41 = *(void *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    uint64_t v42 = sub_25457523C(&qword_269E08278);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    v89(v38, v39, v93);
    *(_OWORD *)&v38[*(int *)(v40 + 20)] = *(_OWORD *)&v39[*(int *)(v40 + 20)];
    *(_OWORD *)&v38[*(int *)(v40 + 24)] = *(_OWORD *)&v39[*(int *)(v40 + 24)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  a3 = v95;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v90 + 56))(v16, 0, 1, v11);
LABEL_25:
  uint64_t v53 = a3[6];
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (uint64_t *)(v24 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  *uint64_t v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[7];
  uint64_t v59 = a3[8];
  uint64_t v60 = a1 + v58;
  uint64_t v61 = v24 + v58;
  *(void *)uint64_t v60 = *(void *)v61;
  *(unsigned char *)(v60 + 8) = *(unsigned char *)(v61 + 8);
  *(unsigned char *)(a1 + v59) = *(unsigned char *)(v24 + v59);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(v24 + a3[9]);
  return a1;
}

uint64_t sub_254583290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2545832A4);
}

uint64_t sub_2545832A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_254586DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25457523C(&qword_269E08488);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_2545833CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2545833E0);
}

uint64_t sub_2545833E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_254586DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_25457523C(&qword_269E08488);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2545834F8()
{
  sub_254586DB0();
  if (v0 <= 0x3F)
  {
    sub_25456EDE4(319, &qword_269E08148, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialIdentifiers);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x254583760);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_254583788(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_254583790(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType()
{
  return &type metadata for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent.EventType;
}

unint64_t sub_2545837AC()
{
  unint64_t result = qword_269E08538;
  if (!qword_269E08538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E08538);
  }
  return result;
}

unint64_t sub_254583804()
{
  unint64_t result = qword_269E08540;
  if (!qword_269E08540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E08540);
  }
  return result;
}

unint64_t sub_25458385C()
{
  unint64_t result = qword_269E08548;
  if (!qword_269E08548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E08548);
  }
  return result;
}

id sub_2545838FC(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void))
{
  id v5 = a3;
  a4();
  uint64_t v7 = v6;

  if (v7)
  {
    int v8 = (void *)sub_254586FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

id LBFProtoToJson_swift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id LBFProtoToJson_swift.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LBFProtoToJson_swift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LBFProtoToJson_swift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_254583A8C()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_254587020();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254587010();
  uint64_t v4 = sub_254586FF0();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v7 = 0;
  if (v6 >> 60 != 15)
  {
    int v8 = self;
    uint64_t v9 = (void *)sub_254586D70();
    id v26 = 0;
    id v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v26);

    id v11 = v26;
    if (v10)
    {
      sub_254587050();
      swift_unknownObjectRelease();
      sub_254584CE8(&v27, v29);
      uint64_t v12 = sub_254587060();
      id v26 = 0;
      id v13 = objc_msgSend(v8, sel_dataWithJSONObject_options_error_, v12, 1, &v26);
      swift_unknownObjectRelease();
      id v14 = v26;
      if (v13)
      {
        uint64_t v15 = sub_254586D80();
        unint64_t v17 = v16;

        sub_254587010();
        uint64_t v7 = sub_254587000();
        sub_254584C7C(v4, v6);
        sub_254584C90(v15, v17);
        sub_254584D2C((uint64_t)&v27);
        return v7;
      }
      uint64_t v20 = v14;
      uint64_t v19 = (void *)sub_254586D60();

      swift_willThrow();
      sub_254584C7C(v4, v6);
      sub_254584D2C((uint64_t)&v27);
    }
    else
    {
      uint64_t v18 = v11;
      uint64_t v19 = (void *)sub_254586D60();

      swift_willThrow();
      sub_254584C7C(v4, v6);
    }
    sub_25457523C(&qword_269E08558);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_254589A10;
    uint64_t v27 = 0x203A726F727245;
    unint64_t v28 = 0xE700000000000000;
    swift_getErrorValue();
    sub_254587080();
    sub_254587030();
    swift_bridgeObjectRelease();
    uint64_t v22 = v27;
    unint64_t v23 = v28;
    *(void *)(v21 + 56) = MEMORY[0x263F8D310];
    *(void *)(v21 + 32) = v22;
    *(void *)(v21 + 40) = v23;
    sub_254587090();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v7;
}

uint64_t _s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeb5StateeF09protoDataSSSgSo6NSDataC_tFZ_0()
{
  uint64_t v0 = sub_254586DE0();
  v14[0] = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_254586E00();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25457523C((uint64_t *)&unk_269E08570);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_BitacoraState(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254586D80();
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  sub_254586DF0();
  sub_254584D7C(&qword_269E082E0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  sub_254586EE0();
  uint64_t v11 = v14[0];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_254584DC4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  sub_254586DD0();
  sub_254586DC0();
  sub_254586EC0();
  uint64_t v13 = sub_254583A8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  sub_254584E2C((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_BitacoraState);
  return v13;
}

uint64_t _s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializebb15MlruntimedEventeF09protoDataSSSgSo6NSDataC_tFZ_0()
{
  uint64_t v0 = sub_254586DE0();
  v14[0] = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_254586E00();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25457523C(&qword_269E08568);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254586D80();
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  sub_254586DF0();
  sub_254584D7C(&qword_269E08360, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  sub_254586EE0();
  uint64_t v11 = v14[0];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_254584DC4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  sub_254586DD0();
  sub_254586DC0();
  sub_254586EC0();
  uint64_t v13 = sub_254583A8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  sub_254584E2C((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerMlruntimedEvent);
  return v13;
}

uint64_t _s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeba11PluginEventeF09protoDataSSSgSo6NSDataC_tFZ_0()
{
  uint64_t v0 = sub_254586DE0();
  v14[0] = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_254586E00();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25457523C(&qword_269E08560);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254586D80();
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  sub_254586DF0();
  sub_254584D7C(&qword_269E083A0, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  sub_254586EE0();
  uint64_t v11 = v14[0];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_254584DC4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  sub_254586DD0();
  sub_254586DC0();
  sub_254586EC0();
  uint64_t v13 = sub_254583A8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  sub_254584E2C((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerLighthousePluginEvent);
  return v13;
}

uint64_t _s27LighthouseBitacoraFramework20LBFProtoToJson_swiftC09serializeb11TrialdEventeF09protoDataSSSgSo6NSDataC_tFZ_0()
{
  uint64_t v0 = sub_254586DE0();
  v14[0] = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_254586E00();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_25457523C(&qword_269E08550);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254586D80();
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  sub_254586DF0();
  sub_254584D7C(&qword_269E08300, (void (*)(uint64_t))type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  sub_254586EE0();
  uint64_t v11 = v14[0];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  sub_254584DC4((uint64_t)v6, (uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  sub_254586DD0();
  sub_254586DC0();
  sub_254586EC0();
  uint64_t v13 = sub_254583A8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  sub_254584E2C((uint64_t)v10, type metadata accessor for LighthouseBitacoraProto_LighthouseLedgerTrialdEvent);
  return v13;
}

uint64_t type metadata accessor for LBFProtoToJson_swift()
{
  return self;
}

uint64_t sub_254584C7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_254584C90(a1, a2);
  }
  return a1;
}

uint64_t sub_254584C90(uint64_t a1, unint64_t a2)
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

void *sub_254584CE8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_254584D2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_254584D7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_254584DC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_254584E2C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_254584E8C()
{
}

void sub_254584EB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_254584EF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_254584F28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_254584F60(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "flattenedEventsForDeployment is empty", v4);
}

void sub_254584F8C(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "could not get BMLighthouseLedgerTrialIdentifiers.", v4);
}

void sub_254584FB8(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "State Info initialization failed.", v4);
}

void sub_254584FE4(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "No identifiers found - prior to event filtering.", v4);
}

void sub_254585010()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "Biome event could not be generated.", v2, v3, v4, v5, v6);
}

void sub_254585044()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "Biome event could not be generated for dprivacyd event.", v2, v3, v4, v5, v6);
}

void sub_254585078(void *a1, void *a2)
{
  id v3 = a1;
  objc_msgSend_aggregateFunction(a2, v4, v5, v6, v7);
  sub_2545534BC(&dword_254547000, v8, v9, "Aggregate function %d not found.", v10, v11, v12, v13, 0);
}

void sub_254585104(void *a1, void *a2)
{
  id v3 = a1;
  objc_msgSend_eventPhase(a2, v4, v5, v6, v7);
  sub_2545534BC(&dword_254547000, v8, v9, "Event phase, %d, not found.", v10, v11, v12, v13, 0);
}

void sub_254585190(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "older BMLighthouseLedgerMlruntimedEvent than this bucket.", v4);
}

void sub_2545851BC(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "older BMLighthouseLedgerLighthousePluginEvent than this bucket.", v4);
}

void sub_2545851E8(uint64_t a1, void *a2)
{
  id v5 = sub_25455A718(a1, a2);
  uint64_t v10 = objc_msgSend_event(v3, v6, v7, v8, v9);
  int v15 = objc_msgSend_phase(v10, v11, v12, v13, v14);
  _DWORD *v4 = 67109120;
  *int v2 = v15;
  sub_25455A6F8(&dword_254547000, v16, v17, "Event Iteration Error: unknown BMLighthouseLedgerDediscoPrivacyEvent event type %d");
}

void sub_254585254(uint64_t a1, void *a2)
{
  id v5 = sub_25455A718(a1, a2);
  int v10 = objc_msgSend_eventType(v3, v6, v7, v8, v9);
  _DWORD *v4 = 67109120;
  *int v2 = v10;
  sub_25455A6F8(&dword_254547000, v11, v12, "Event Iteration Error: unknown BMLighthouseLedgerTrialdEvent event type %d");
}

void sub_2545852B0(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "unknown BMLighthouseLedgerLighthousePluginEvent event type", v4);
}

void sub_2545852DC(unsigned char *a1, unsigned char *a2)
{
  sub_254551E38(a1, a2);
  sub_254551E48(&dword_254547000, v2, v3, "unknown BMLighthouseLedgerMlruntimedEvent event type", v4);
}

void sub_254585308(uint64_t a1, void *a2)
{
  id v5 = sub_25455A718(a1, a2);
  int v10 = objc_msgSend_state(v3, v6, v7, v8, v9);
  _DWORD *v4 = 67109120;
  *int v2 = v10;
  sub_25455A6F8(&dword_254547000, v11, v12, "Transition Iteration Error: unknown LBFBitacoraStateTransition state %d");
}

void sub_254585364(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_254547000, a2, OS_LOG_TYPE_ERROR, "unknown lastState value %d", (uint8_t *)v3, 8u);
}

void sub_2545853E0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_event(a1, a2, a3, a4, a5);
  objc_msgSend_phase(v5, v6, v7, v8, v9);
  sub_25455A750(&dword_254547000, v10, v11, "unknown BMLighthouseLedgerDediscoPrivacyEvent event phase %d", v12, v13, v14, v15, 0);
}

void sub_25458546C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_eventType(a1, a2, a3, a4, a5);
  sub_25455A750(&dword_254547000, v5, v6, "unknown BMLighthouseLedgerTrialdEvent event type %d", v7, v8, v9, v10, 0);
}

void sub_2545854E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_254547000, log, OS_LOG_TYPE_ERROR, "No experiment identifiers in state info.", v1, 2u);
}

void sub_25458552C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_254547000, log, OS_LOG_TYPE_DEBUG, "Uploaded to Fedstats.", v1, 2u);
}

void sub_254585570(void *a1, void *a2)
{
  id v3 = a1;
  objc_msgSend_code(a2, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_domain(a2, v8, v9, v10, v11);
  sub_25455A6C0();
  sub_25455A6D8(&dword_254547000, v13, v14, "Error During FedStats Stack Time data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);
}

void sub_25458561C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2545856A0(void *a1, void *a2)
{
  id v3 = a1;
  objc_msgSend_code(a2, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_domain(a2, v8, v9, v10, v11);
  sub_25455A6C0();
  sub_25455A6D8(&dword_254547000, v13, v14, "Error During FedStats Stack Success data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);
}

void sub_25458574C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2545857D0(void *a1, void *a2)
{
  id v3 = a1;
  objc_msgSend_code(a2, v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_domain(a2, v8, v9, v10, v11);
  sub_25455A6C0();
  sub_25455A6D8(&dword_254547000, v13, v14, "Error During FedStats DPrivacyD data upload. Code: %ld, Domain: %@", v15, v16, v17, v18, v19);
}

void sub_25458587C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_254585900(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_254547000, log, OS_LOG_TYPE_DEBUG, "Error linking FedStats library.", v1, 2u);
}

void sub_254585944(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_254547000, log, OS_LOG_TYPE_ERROR, "_biomeSource already exists.", v1, 2u);
}

void sub_254585988()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "Proto could not be converted. %@", v2, v3, v4, v5, v6);
}

void sub_2545859F0()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "bmltIdentifiersId is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585A58()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "experimentIdentifiersId is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585AC0()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "eventDict does not have succeeded key. %@", v2, v3, v4, v5, v6);
}

void sub_254585B28()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "errorCodeId is not NSNumber class. %@", v2, v3, v4, v5, v6);
}

void sub_254585B90()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "errorDomainId is not NSString class. %@", v2, v3, v4, v5, v6);
}

void sub_254585BF8()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "eventDict does not have scheduled key. %@", v2, v3, v4, v5, v6);
}

void sub_254585C60()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "trialIdentifiers could not be converted. %@", v2, v3, v4, v5, v6);
}

void sub_254585CC8()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "taskCompletedID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585D30()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "taskFetchedID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585D98()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "taskScheduledID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585E00()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "activityScheduledID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585E68()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "trialIdentifiers is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254585ED0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_254585F40()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "errorCodeID is not NSNumber class. %@", v2, v3, v4, v5, v6);
}

void sub_254585FA8()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "errorDomainID is not NSString class. %@", v2, v3, v4, v5, v6);
}

void sub_254586010()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "stopID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254586078()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "performTrialTaskStatusId is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_2545860E0()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "performTaskStatusID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_254586148()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "trialIdentifiersID is not NSDictionary. %@", v2, v3, v4, v5, v6);
}

void sub_2545861B0()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "eventSucceeded is not NSNumber (used to wrap BOOL). %@", v2, v3, v4, v5, v6);
}

void sub_254586218()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "eventType is null. %@", v2, v3, v4, v5, v6);
}

void sub_254586280()
{
  sub_25455F7D4();
  sub_25455F7B8(&dword_254547000, v0, v1, "eventType is not NSString. %@", v2, v3, v4, v5, v6);
}

void sub_2545862E8()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 595, "nil != self->_telemetryID");
}

void sub_254586314()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 600, "self->_trialIdentifiers != nil");
}

void sub_254586340()
{
  __assert_rtn("-[LIGHTHOUSE_BITACORA_PROTOBitacoraState writeTo:]", "LIGHTHOUSE_BITACORA_PROTOBitacoraState.m", 605, "nil != self->_contextID");
}

void sub_25458636C()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "_biomeManagerLighthouse already exists.", v2, v3, v4, v5, v6);
}

void sub_2545863A0()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "_biomeManagerTrial already exists.", v2, v3, v4, v5, v6);
}

void sub_2545863D4()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "_biomeManagerMLRuntimed already exists.", v2, v3, v4, v5, v6);
}

void sub_254586408()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "_biomeManagerDprivacyd already exists.", v2, v3, v4, v5, v6);
}

void sub_25458643C()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "Allocation event cannot have identifiers.", v2, v3, v4, v5, v6);
}

void sub_254586470()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "Activation event must have identifiers.", v2, v3, v4, v5, v6);
}

void sub_2545864A4()
{
  sub_2545534B0();
  sub_25454C5CC(&dword_254547000, v0, v1, "Deactivation event must have identifiers.", v2, v3, v4, v5, v6);
}

void sub_2545864D8()
{
  sub_2545534B0();
  sub_2545664A4(&dword_254547000, v0, v1, "identifiers needs to be provided", v2, v3, v4, v5, v6);
}

void sub_25458650C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_254547000, log, OS_LOG_TYPE_ERROR, "LBFTrialEvent isEqual class is not mached", v1, 2u);
}

void sub_254586550(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  objc_msgSend_eventType(a2, v6, v7, v8, v9);
  objc_msgSend_eventType(a3, v10, v11, v12, v13);
  sub_2545667A0(&dword_254547000, v14, v15, "LBFTrialEvent isEqual eventType is not mached %ld %ld", v16, v17, v18, v19, 0);
}

void sub_254586600(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v10 = objc_msgSend_succeeded(a2, v6, v7, v8, v9);
  uint64_t v21 = objc_msgSend_succeeded(a3, v11, v12, v13, v14);
  sub_2545667A0(&dword_254547000, v15, v16, "LBFTrialEvent isEqual succeeded is not mached %@ %@", v17, v18, v19, v20, 2u);
}

void sub_2545866C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_254547000, log, OS_LOG_TYPE_ERROR, "LBFLighthouseEvent isEqual class is not mached", v1, 2u);
}

void sub_254586708()
{
  sub_254567138();
  id v2 = v1;
  uint64_t v3 = (void *)sub_254567144();
  objc_msgSend_eventType(v3, v4, v5, v6, v7);
  uint64_t v8 = (void *)sub_25456712C();
  objc_msgSend_eventType(v8, v9, v10, v11, v12);
  sub_2545667A0(&dword_254547000, v13, v14, "LBFLighthouseEvent isEqual eventType is not mached %ld %ld", v15, v16, v17, v18, 0);
}

void sub_2545867AC()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_errorDomain(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_errorDomain(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFLighthouseEvent isEqual errorDomain is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_254586854()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_errorCode(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_errorCode(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFLighthouseEvent isEqual succeeded is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_2545868FC()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_succeeded(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_succeeded(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFLighthouseEvent isEqual succeeded is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_2545869A4(uint8_t *a1, void *a2, void *a3, _DWORD *a4)
{
  uint64_t v7 = a2;
  int v12 = objc_msgSend_eventType(a3, v8, v9, v10, v11);
  *(_DWORD *)a1 = 67109120;
  *a4 = v12;
  _os_log_error_impl(&dword_254547000, v7, OS_LOG_TYPE_ERROR, "unknown BMLighthouseLedgerTrialdEvent event type %d", a1, 8u);
}

void sub_254586A1C()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_scheduled(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_scheduled(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFMLRuntimedEvent isEqual scheduled is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_254586AC4()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_errorDomain(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_errorDomain(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFMLRuntimedEvent isEqual errorDomain is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_254586B6C()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_errorCode(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_errorCode(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFMLRuntimedEvent isEqual errorCode is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_254586C14()
{
  sub_254567138();
  id v3 = v2;
  uint64_t v4 = (void *)sub_254567144();
  objc_msgSend_succeeded(v4, v5, v6, v7, v8);
  objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)sub_25456712C();
  uint64_t v14 = objc_msgSend_succeeded(v9, v10, v11, v12, v13);
  sub_254567114();
  sub_2545667A0(&dword_254547000, v15, v16, "LBFMLRuntimedEvent isEqual succeeded is not mached %@ %@", v17, v18, v19, v20, v21);
}

void sub_254586CBC()
{
  sub_254567138();
  id v2 = v1;
  id v3 = (void *)sub_254567144();
  objc_msgSend_eventType(v3, v4, v5, v6, v7);
  uint64_t v8 = (void *)sub_25456712C();
  objc_msgSend_eventType(v8, v9, v10, v11, v12);
  sub_2545667A0(&dword_254547000, v13, v14, "LBFMLRuntimedEvent isEqual eventType is not mached %ld %ld", v15, v16, v17, v18, 0);
}

uint64_t sub_254586D60()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_254586D70()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_254586D80()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_254586D90()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_254586DA0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_254586DB0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_254586DC0()
{
  return MEMORY[0x270F44A88]();
}

uint64_t sub_254586DD0()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_254586DE0()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_254586DF0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_254586E00()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_254586E10()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_254586E40()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_254586E50()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_254586E60()
{
  return MEMORY[0x270F44B48]();
}

uint64_t sub_254586E70()
{
  return MEMORY[0x270F44B98]();
}

uint64_t sub_254586E80()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_254586E90()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_254586EA0()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_254586EB0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_254586EC0()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_254586ED0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_254586EE0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_254586F00()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_254586F10()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_254586F20()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_254586F30()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_254586F40()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_254586F50()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_254586F60()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_254586F70()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_254586F80()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_254586F90()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_254586FA0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_254586FB0()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_254586FC0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_254586FD0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_254586FE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_254586FF0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_254587000()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_254587010()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_254587020()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_254587030()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254587040()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_254587050()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_254587060()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_254587070()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_254587080()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_254587090()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2545870A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2545870B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x270EDB450](*(void *)&a1);
}

void srand48(uint64_t a1)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}