void sub_100002EA4(uint64_t a1)
{
  void block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100002F2C;
  block[3] = &unk_10000C388;
  block[4] = a1;
  if (qword_100010C28 != -1) {
    dispatch_once(&qword_100010C28, block);
  }
}

uint64_t sub_100002F2C(uint64_t a1)
{
  os_log_t v1 = os_log_create("com.apple.IPConfiguration", *(const char **)(a1 + 32));

  return sub_1000098AC((uint64_t)v1);
}

void sub_10000397C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = sub_1000098B8();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      os_log_type_enabled(v10, v11);
      int v48 = 138412290;
      uint64_t v49 = (uint64_t)v9;
      LODWORD(v46) = 12;
      v45 = &v48;
      v12 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v12 != &v52) {
        free(v12);
      }
    }

    v13 = [v9 domain];
    if ([v13 isEqualToString:kCFErrorDomainCFNetwork])
    {
      id v14 = [v9 code];

      if (v14 == (id)-1009)
      {
        v15 = sub_1000098B8();
        os_log_type_t v16 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          os_log_type_enabled(v15, v16);
          LOWORD(v48) = 0;
          LODWORD(v46) = 2;
          v45 = &v48;
          v17 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v17 != &v52) {
            free(v17);
          }
        }

        goto LABEL_26;
      }
LABEL_25:
      objc_msgSend(*(id *)(a1 + 32), "setValidFetch:", 0, v45, v46);
LABEL_26:
      id v18 = 0;
LABEL_27:
      id v21 = 0;
      id v22 = 0;
      v20 = 0;
      goto LABEL_28;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (!v8)
  {
    v13 = sub_1000098B8();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      os_log_type_enabled(v13, v26);
      LOWORD(v48) = 0;
      LODWORD(v46) = 2;
      v45 = &v48;
      v27 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v27 != &v52) {
        free(v27);
      }
    }
    goto LABEL_24;
  }
  id v18 = v8;
  v19 = (char *)[v18 statusCode];
  if ((unint64_t)(v19 - 200) >= 0xC8)
  {
    uint64_t v30 = (uint64_t)v19;
    v31 = sub_1000098B8();
    os_log_type_t v32 = _SC_syslog_os_log_mapping();
    int v33 = __SC_log_enabled();
    if (v30 >= 400)
    {
      if (!v33) {
        goto LABEL_43;
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      os_log_type_enabled(v31, v32);
      v34 = v31;
      v35 = +[NSHTTPURLResponse localizedStringForStatusCode:v30];
      int v48 = 134218242;
      uint64_t v49 = v30;
      __int16 v50 = 2112;
      v51 = v35;
      LODWORD(v46) = 22;
      v45 = &v48;
      v36 = (long long *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v36 == &v52) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    if (!v33)
    {
LABEL_43:

      [*(id *)(a1 + 32) setValidFetch:0];
      goto LABEL_27;
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    os_log_type_enabled(v31, v32);
    int v48 = 134217984;
    uint64_t v49 = v30;
    LODWORD(v46) = 12;
    v45 = &v48;
LABEL_41:
    v36 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v36 != &v52)
    {
LABEL_42:
      free(v36);
      goto LABEL_43;
    }
    goto LABEL_43;
  }
  if (!v7)
  {
    v31 = sub_1000098B8();
    os_log_type_t v37 = _SC_syslog_os_log_mapping();
    if (!__SC_log_enabled()) {
      goto LABEL_43;
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    os_log_type_enabled(v31, v37);
    uint64_t v38 = *(void *)(a1 + 40);
    int v48 = 138412290;
    uint64_t v49 = v38;
    LODWORD(v46) = 12;
    v45 = &v48;
    goto LABEL_41;
  }
  id v47 = 0;
  v20 = +[NSJSONSerialization JSONObjectWithData:v7 options:16 error:&v47];
  id v21 = v47;
  if (v21 || !v20)
  {
    v39 = sub_1000098B8();
    os_log_type_t v40 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      os_log_type_enabled(v39, v40);
      int v48 = 138412290;
      uint64_t v49 = (uint64_t)v21;
      LODWORD(v46) = 12;
      v45 = &v48;
      v41 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v41 != &v52) {
        free(v41);
      }
    }

    [*(id *)(a1 + 32) setValidFetch:0];
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = sub_1000098B8();
    os_log_type_t v43 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      os_log_type_enabled(v42, v43);
      LOWORD(v48) = 0;
      LODWORD(v46) = 2;
      v45 = &v48;
      v44 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v44 != &v52) {
        free(v44);
      }
    }

    [*(id *)(a1 + 32) setValidFetch:0];
    id v21 = 0;
LABEL_52:
    id v22 = 0;
    goto LABEL_28;
  }
  id v22 = v20;
  v23 = sub_1000098B8();
  os_log_type_t v24 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    os_log_type_enabled(v23, v24);
    int v48 = 138412290;
    uint64_t v49 = (uint64_t)v22;
    LODWORD(v46) = 12;
    v45 = &v48;
    v25 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v25 != &v52) {
      free(v25);
    }
  }

  id v21 = 0;
  v20 = v22;
LABEL_28:
  unsigned int v28 = objc_msgSend(*(id *)(a1 + 32), "validFetch", v45, v46);
  v29 = *(void **)(a1 + 32);
  if (v28 && v22) {
    [v29 scheduleParsingEventCompleteWithParsedJSON:v22 pvdID:*(void *)(a1 + 48) ipv6Prefixes:*(void *)(a1 + 56)];
  }
  else {
    [v29 scheduleParsingEventAbort];
  }
}

void sub_1000044E4(uint64_t a1)
{
  v20 = 0;
  v2 = [*(id *)(a1 + 32) urlSession];

  if (v2)
  {
    v3 = sub_1000098B8();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      os_log_type_enabled(v3, v4);
      __int16 v19 = 0;
      LODWORD(v17) = 2;
      v15 = &v19;
      v5 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v5 != &v21) {
        free(v5);
      }
    }

    Mutable = CFDictionaryCreateMutable(0, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v7 = [*(id *)(a1 + 32) createValidPvDAdditionalInfoDict:*(void *)(a1 + 40) withID:*(void *)(a1 + 48) andPrefixes:*(void *)(a1 + 56)];
    v20 = v7;
    if (!v7) {
      [*(id *)(a1 + 32) setValidFetch:0];
    }
    unsigned int v8 = objc_msgSend(*(id *)(a1 + 32), "validFetch", v15, v17);
    id v9 = (const void **)&kCFBooleanTrue;
    if (!v8) {
      id v9 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"valid_fetch", *v9);
    if ([*(id *)(a1 + 32) validFetch] && v7)
    {
      v10 = sub_1000098B8();
      os_log_type_t v11 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        os_log_type_enabled(v10, v11);
        __int16 v19 = 0;
        LODWORD(v18) = 2;
        os_log_type_t v16 = &v19;
        v12 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v12 != &v21) {
          free(v12);
        }
      }

      CFDictionarySetValue(Mutable, @"additional_information", v7);
    }
    v13 = objc_msgSend(*(id *)(a1 + 32), "urlSession", v16, v18);
    [v13 finishTasksAndInvalidate];

    [*(id *)(a1 + 32) setUrlSession:0];
    id v14 = [*(id *)(a1 + 32) xpcClientCompletionHandler];
    ((void (**)(void, __CFDictionary *))v14)[2](v14, Mutable);
  }
  sub_100008C28(&v20);
}

void sub_1000048A8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) urlSession];

  if (v2)
  {
    v3 = sub_1000098B8();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v11, 0, sizeof(v11));
      os_log_type_enabled(v3, v4);
      v5 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v5 != v11) {
        free(v5);
      }
    }

    v6 = [*(id *)(a1 + 32) urlSession];
    [v6 invalidateAndCancel];

    [*(id *)(a1 + 32) setUrlSession:0];
    Mutable = CFDictionaryCreateMutable(0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v8 = [*(id *)(a1 + 32) validFetch];
    id v9 = (const void **)&kCFBooleanTrue;
    if (!v8) {
      id v9 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"valid_fetch", *v9);
    v10 = [*(id *)(a1 + 32) xpcClientCompletionHandler];
    ((void (**)(void, __CFDictionary *))v10)[2](v10, Mutable);
  }
}

void sub_100006560(__CFDictionary *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v147 = a3;
  id v142 = a4;
  CFStringRef StringWithDate = 0;
  CFStringRef v162 = 0;
  CFMutableArrayRef v160 = 0;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v149 = [&off_10000C748 countByEnumeratingWithState:&v156 objects:v173 count:16];
  if (!v149)
  {
    id v9 = 0;
    CFStringRef value = 0;
    CFStringRef v8 = 0;
    goto LABEL_133;
  }
  CFStringRef value = 0;
  CFStringRef v8 = 0;
  id v9 = 0;
  CFMutableArrayRef v140 = 0;
  uint64_t v150 = *(void *)v157;
  id v139 = v7;
  CFMutableDictionaryRef theDict = a1;
  do
  {
    CFMutableArrayRef v138 = v9;
    v10 = 0;
    do
    {
      if (*(void *)v157 != v150) {
        objc_enumerationMutation(&off_10000C748);
      }
      os_log_type_t v11 = *(void **)(*((void *)&v156 + 1) + 8 * (void)v10);
      v13 = [v7 valueForKey:v11];
      if (!v13)
      {
        v121 = sub_1000098B8();
        os_log_type_t v107 = _SC_syslog_os_log_mapping();
        if (!__SC_log_enabled()) {
          goto LABEL_168;
        }
        long long v196 = 0u;
        long long v195 = 0u;
        long long v194 = 0u;
        long long v193 = 0u;
        long long v192 = 0u;
        long long v191 = 0u;
        long long v190 = 0u;
        long long v189 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        os_log_type_enabled(v121, v107);
        *(_DWORD *)v178 = 138412290;
        *(void *)&v178[4] = v11;
        v108 = (long long *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v108 == &v181) {
          goto LABEL_168;
        }
        v109 = v108;
        goto LABEL_167;
      }
      if ([v11 isEqualToString:@"identifier"]) {
        BOOL v14 = v8 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14)
      {
        v151 = v10;
        id v19 = v7;
        id capacitya = v11;
        v20 = v13;
        long long v21 = v13;
        id v153 = v147;
        long long v22 = sub_1000098B8();
        os_log_type_t v23 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v22, v23);
          long long v24 = v22;
          long long v25 = objc_opt_class();
          *(_DWORD *)v178 = 138412802;
          *(void *)&v178[4] = capacitya;
          *(_WORD *)&v178[12] = 2112;
          *(void *)&v178[14] = v21;
          __int16 v179 = 2112;
          v180 = v25;
          id v26 = v25;
          LODWORD(v126) = 32;
          v125 = (long long *)v178;
          long long v27 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v27 != &v181) {
            free(v27);
          }
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v110 = sub_1000098B8();
          os_log_type_t v111 = _SC_syslog_os_log_mapping();
          id v7 = v19;
          v13 = v20;
          if (__SC_log_enabled())
          {
            long long v196 = 0u;
            long long v195 = 0u;
            long long v194 = 0u;
            long long v193 = 0u;
            long long v192 = 0u;
            long long v191 = 0u;
            long long v190 = 0u;
            long long v189 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            os_log_type_enabled(v110, v111);
            *(_WORD *)v178 = 0;
            v112 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            v113 = capacitya;
            if (v112 == &v181)
            {
LABEL_150:

              v121 = sub_1000098B8();
              os_log_type_t v116 = _SC_syslog_os_log_mapping();
              if (__SC_log_enabled()) {
                goto LABEL_164;
              }
LABEL_168:

              goto LABEL_169;
            }
LABEL_148:
            free(v112);
            goto LABEL_150;
          }
LABEL_149:
          v113 = capacitya;
          goto LABEL_150;
        }
        long long v28 = [(__CFString *)v21 lowercaseString];
        long long v29 = [v153 lowercaseString];
        unsigned __int8 v30 = [v28 isEqualToString:v29];

        id v7 = v19;
        v13 = v20;
        if ((v30 & 1) == 0)
        {
          v110 = sub_1000098B8();
          os_log_type_t v114 = _SC_syslog_os_log_mapping();
          v113 = capacitya;
          if (!__SC_log_enabled()) {
            goto LABEL_150;
          }
          goto LABEL_146;
        }
        CFDataRef v31 = sub_1000095F0(v21);
        if (!v31)
        {
          v110 = sub_1000098B8();
          os_log_type_t v115 = _SC_syslog_os_log_mapping();
          if (!__SC_log_enabled()) {
            goto LABEL_149;
          }
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v110, v115);
          *(_DWORD *)v178 = 138412290;
          v113 = capacitya;
          *(void *)&v178[4] = capacitya;
          goto LABEL_147;
        }
        CFRelease(v31);
        CFStringRef Copy = CFStringCreateCopy(0, v21);
        CFStringRef v162 = Copy;
        if (!Copy)
        {
          v110 = sub_1000098B8();
          os_log_type_t v114 = _SC_syslog_os_log_mapping();
          v113 = capacitya;
          if (!__SC_log_enabled()) {
            goto LABEL_150;
          }
LABEL_146:
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v110, v114);
          *(_WORD *)v178 = 0;
LABEL_147:
          v112 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v112 == &v181) {
            goto LABEL_150;
          }
          goto LABEL_148;
        }
        CFStringRef v8 = Copy;

LABEL_42:
        v10 = v151;
        goto LABEL_43;
      }
      if ([v11 isEqualToString:@"expires"]) {
        BOOL v15 = value == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        v151 = v10;
        id v154 = v11;
        long long v21 = v13;
        v177[0] = 0;
        *(void *)&long long v167 = 0;
        *(void *)&long long v163 = 0;
        *(void *)v174 = 0;
        long long v33 = sub_1000098B8();
        os_log_type_t v34 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          CFStringRef v35 = v8;
          long long v36 = v13;
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v33, v34);
          os_log_type_t v37 = v33;
          uint64_t v38 = objc_opt_class();
          *(_DWORD *)v178 = 138412802;
          *(void *)&v178[4] = v154;
          *(_WORD *)&v178[12] = 2112;
          *(void *)&v178[14] = v21;
          __int16 v179 = 2112;
          v180 = v38;
          id v39 = v38;
          LODWORD(v126) = 32;
          v125 = (long long *)v178;
          os_log_type_t v40 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v40 != &v181) {
            free(v40);
          }
          v13 = v36;
          CFStringRef v8 = v35;
          id v7 = v139;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v117 = sub_1000098B8();
          os_log_type_t v118 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v196 = 0u;
            long long v195 = 0u;
            long long v194 = 0u;
            long long v193 = 0u;
            long long v192 = 0u;
            long long v191 = 0u;
            long long v190 = 0u;
            long long v189 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            os_log_type_enabled(v117, v118);
            *(_WORD *)v178 = 0;
            v119 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v119 != &v181) {
LABEL_159:
            }
              free(v119);
          }
LABEL_162:

LABEL_163:
          sub_100008C28((const void **)&v167);
          sub_100008C28(v177);
          sub_100008C28((const void **)&v163);
          sub_100008C28((const void **)v174);

          v113 = v154;
          v121 = sub_1000098B8();
          os_log_type_t v116 = _SC_syslog_os_log_mapping();
          if (!__SC_log_enabled()) {
            goto LABEL_168;
          }
LABEL_164:
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v121, v116);
          *(_DWORD *)v178 = 138412546;
          *(void *)&v178[4] = v113;
          *(_WORD *)&v178[12] = 2112;
          *(void *)&v178[14] = v21;
LABEL_165:
          v124 = (long long *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v124 == &v181) {
            goto LABEL_168;
          }
          v109 = v124;
LABEL_167:
          free(v109);
          goto LABEL_168;
        }
        CFLocaleRef v41 = CFLocaleCreate(0, @"en_US_POSIX");
        *(void *)&long long v167 = v41;
        if (!v41) {
          goto LABEL_163;
        }
        CFDateFormatterRef v42 = CFDateFormatterCreate(0, v41, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
        v177[0] = v42;
        if (!v42) {
          goto LABEL_163;
        }
        os_log_type_t v43 = v42;
        CFDateFormatterSetFormat(v42, @"yyyy-MM-dd'T'HH:mm:ss'Z'");
        CFDateRef DateFromString = CFDateFormatterCreateDateFromString(0, v43, v21, 0);
        *(void *)&long long v163 = DateFromString;
        if (!DateFromString) {
          goto LABEL_163;
        }
        CFDateRef v45 = DateFromString;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFDateRef v47 = CFDateCreate(0, Current);
        *(void *)v174 = v47;
        if (!v47) {
          goto LABEL_163;
        }
        if (CFDateCompare(v45, v47, 0) != kCFCompareGreaterThan)
        {
          v117 = sub_1000098B8();
          os_log_type_t v120 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
LABEL_158:
            long long v196 = 0u;
            long long v195 = 0u;
            long long v194 = 0u;
            long long v193 = 0u;
            long long v192 = 0u;
            long long v191 = 0u;
            long long v190 = 0u;
            long long v189 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            os_log_type_enabled(v117, v120);
            *(_WORD *)v178 = 0;
            v119 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v119 != &v181) {
              goto LABEL_159;
            }
          }
          goto LABEL_162;
        }
        CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0, v43, v45);
        CFStringRef value = StringWithDate;
        if (!StringWithDate)
        {
          v117 = sub_1000098B8();
          os_log_type_t v120 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled()) {
            goto LABEL_158;
          }
          goto LABEL_162;
        }
        sub_100008C28((const void **)&v167);
        sub_100008C28(v177);
        sub_100008C28((const void **)&v163);
        sub_100008C28((const void **)v174);
        goto LABEL_42;
      }
      if ([v11 isEqualToString:@"prefixes"]) {
        BOOL v16 = v140 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        id v17 = v11;
        id v18 = v13;
        id v137 = v142;
        CFMutableArrayRef v172 = 0;
        CFStringRef v133 = v8;
        if ((unint64_t)[v18 count] > 9) {
          CFIndex capacity = 10;
        }
        else {
          CFIndex capacity = (CFIndex)[v18 count];
        }
        CFArrayRef theArray = 0;
        int v48 = sub_1000098B8();
        os_log_type_t v49 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          long long v196 = 0u;
          long long v195 = 0u;
          long long v194 = 0u;
          long long v193 = 0u;
          long long v192 = 0u;
          long long v191 = 0u;
          long long v190 = 0u;
          long long v189 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          os_log_type_enabled(v48, v49);
          __int16 v50 = v48;
          v51 = objc_opt_class();
          *(_DWORD *)v178 = 138412802;
          id v134 = v17;
          *(void *)&v178[4] = v17;
          *(_WORD *)&v178[12] = 2112;
          *(void *)&v178[14] = v18;
          __int16 v179 = 2112;
          v180 = v51;
          id v52 = v51;
          LODWORD(v126) = 32;
          v125 = (long long *)v178;
          long long v53 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v53 != &v181) {
            free(v53);
          }
          id v17 = v134;
          id v7 = v139;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v88 = sub_1000098B8();
          os_log_type_t v89 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v196 = 0u;
            long long v195 = 0u;
            long long v194 = 0u;
            long long v193 = 0u;
            long long v192 = 0u;
            long long v191 = 0u;
            long long v190 = 0u;
            long long v189 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            os_log_type_enabled(v88, v89);
            *(_WORD *)v178 = 0;
            LODWORD(v126) = 2;
            v125 = (long long *)v178;
            v90 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v90 != &v181) {
              free(v90);
            }
          }

          goto LABEL_124;
        }
        uint64_t v54 = +[NSMutableArray array];
        Mutable = CFArrayCreateMutable(0, capacity, &kCFTypeArrayCallBacks);
        char v56 = 0;
        CFMutableArrayRef v172 = Mutable;
        v155 = (void *)v54;
        if (v54 && Mutable)
        {
          v152 = v10;
          if (capacity)
          {
            uint64_t v57 = 0;
            id v135 = v17;
            while (1)
            {
              *(void *)&v178[8] = 0;
              *(void *)v178 = 0;
              LODWORD(v167) = 0;
              v177[0] = 0;
              long long v59 = [v18 objectAtIndex:v57];
              if (([(__CFString *)v59 isMemberOfClass:objc_opt_class()] & 1) == 0)
              {
                v94 = sub_1000098B8();
                os_log_type_t v95 = _SC_syslog_os_log_mapping();
                if (!__SC_log_enabled()) {
                  goto LABEL_119;
                }
LABEL_106:
                id v97 = v18;
                long long v196 = 0u;
                long long v195 = 0u;
                long long v194 = 0u;
                long long v193 = 0u;
                long long v192 = 0u;
                long long v191 = 0u;
                long long v190 = 0u;
                long long v189 = 0u;
                long long v187 = 0u;
                long long v188 = 0u;
                long long v185 = 0u;
                long long v186 = 0u;
                long long v183 = 0u;
                long long v184 = 0u;
                long long v181 = 0u;
                long long v182 = 0u;
                os_log_type_enabled(v94, v95);
                LOWORD(v163) = 0;
                LODWORD(v126) = 2;
                v125 = &v163;
                v98 = (long long *)_os_log_send_and_compose_impl();
                __SC_log_send2();
                if (v98 != &v181) {
                  free(v98);
                }
                id v18 = v97;
                goto LABEL_119;
              }
              CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v59, @"/");
              CFArrayRef theArray = ArrayBySeparatingStrings;
              if (!ArrayBySeparatingStrings || CFArrayGetCount(ArrayBySeparatingStrings) != 2)
              {
                v94 = sub_1000098B8();
                os_log_type_t v95 = _SC_syslog_os_log_mapping();
                if (!__SC_log_enabled()) {
                  goto LABEL_119;
                }
                goto LABEL_106;
              }
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
              CFTypeID TypeID = CFStringGetTypeID();
              if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID)
              {
                v94 = sub_1000098B8();
                os_log_type_t v95 = _SC_syslog_os_log_mapping();
                id v17 = v135;
                if (!__SC_log_enabled()) {
                  goto LABEL_119;
                }
                goto LABEL_106;
              }
              if ((sub_100008CE8(ValueAtIndex, v178) & 1) == 0) {
                break;
              }
              long long v63 = v59;
              long long v64 = v58;
              id v65 = v7;
              id v66 = v18;
              CFStringRef v67 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 1);
              CFTypeID v68 = CFStringGetTypeID();
              if (!v67 || CFGetTypeID(v67) != v68)
              {
                v94 = sub_1000098B8();
                os_log_type_t v96 = _SC_syslog_os_log_mapping();
                if (__SC_log_enabled()) {
                  goto LABEL_114;
                }
LABEL_116:
                id v17 = v135;
LABEL_117:
                id v18 = v66;
                id v7 = v65;
LABEL_118:
                long long v58 = v64;
                long long v59 = v63;
                goto LABEL_119;
              }
              if (!sub_100008DA0(v67, &v167) || v167 >= 0x81)
              {
                v94 = sub_1000098B8();
                os_log_type_t v96 = _SC_syslog_os_log_mapping();
                if (!__SC_log_enabled()) {
                  goto LABEL_116;
                }
LABEL_114:
                long long v196 = 0u;
                long long v195 = 0u;
                long long v194 = 0u;
                long long v193 = 0u;
                long long v192 = 0u;
                long long v191 = 0u;
                long long v190 = 0u;
                long long v189 = 0u;
                long long v187 = 0u;
                long long v188 = 0u;
                long long v185 = 0u;
                long long v186 = 0u;
                long long v183 = 0u;
                long long v184 = 0u;
                long long v181 = 0u;
                long long v182 = 0u;
                os_log_type_enabled(v94, v96);
                LOWORD(v163) = 0;
                LODWORD(v126) = 2;
                v125 = &v163;
                v102 = (long long *)_os_log_send_and_compose_impl();
                __SC_log_send2();
                id v17 = v135;
                if (v102 != &v181) {
                  free(v102);
                }
                goto LABEL_117;
              }
              CFStringRef v69 = CFStringCreateWithFormat(0, 0, @"%@/%@", ValueAtIndex, v67);
              v177[0] = v69;
              id v17 = v135;
              id v7 = v65;
              long long v58 = v64;
              long long v59 = v63;
              if (!v69) {
                goto LABEL_120;
              }
              CFArrayAppendValue(v172, v69);
              [v155 addObject:v63];
              sub_100008C28((const void **)&theArray);
              sub_100008C28(v177);

              if (capacity == ++v57) {
                goto LABEL_67;
              }
            }
            v94 = sub_1000098B8();
            os_log_type_t v99 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled())
            {
              long long v63 = v59;
              long long v64 = v58;
              id v100 = v18;
              long long v196 = 0u;
              long long v195 = 0u;
              long long v194 = 0u;
              long long v193 = 0u;
              long long v192 = 0u;
              long long v191 = 0u;
              long long v190 = 0u;
              long long v189 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              long long v185 = 0u;
              long long v186 = 0u;
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              os_log_type_enabled(v94, v99);
              LOWORD(v163) = 0;
              LODWORD(v126) = 2;
              v125 = &v163;
              v101 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              id v17 = v135;
              if (v101 != &v181) {
                free(v101);
              }
              id v18 = v100;
              goto LABEL_118;
            }
            id v17 = v135;
LABEL_119:

LABEL_120:
            sub_100008C28((const void **)&theArray);
            v103 = sub_1000098B8();
            os_log_type_t v104 = _SC_syslog_os_log_mapping();
            v10 = v152;
            if (__SC_log_enabled())
            {
              long long v196 = 0u;
              long long v195 = 0u;
              long long v194 = 0u;
              long long v193 = 0u;
              long long v192 = 0u;
              long long v191 = 0u;
              long long v190 = 0u;
              long long v189 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              long long v185 = 0u;
              long long v186 = 0u;
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              os_log_type_enabled(v103, v104);
              *(_WORD *)v178 = 0;
              LODWORD(v126) = 2;
              v125 = (long long *)v178;
              v105 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              if (v105 != &v181) {
                free(v105);
              }
            }

            sub_100008C28((const void **)&v172);
LABEL_124:
            char v56 = 0;
            id v72 = 0;
LABEL_125:
            if (!v138) {
              sub_100008C28((const void **)&v172);
            }

            CFMutableArrayRef v140 = v138;
            CFStringRef v8 = v133;
            if ((v56 & 1) == 0)
            {
              v121 = sub_1000098B8();
              os_log_type_t v122 = _SC_syslog_os_log_mapping();
              if (!__SC_log_enabled()) {
                goto LABEL_168;
              }
              long long v196 = 0u;
              long long v195 = 0u;
              long long v194 = 0u;
              long long v193 = 0u;
              long long v192 = 0u;
              long long v191 = 0u;
              long long v190 = 0u;
              long long v189 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              long long v185 = 0u;
              long long v186 = 0u;
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              os_log_type_enabled(v121, v122);
              *(_DWORD *)v178 = 138412546;
              *(void *)&v178[4] = v17;
              *(_WORD *)&v178[12] = 2112;
              *(void *)&v178[14] = v18;
              goto LABEL_165;
            }
            goto LABEL_43;
          }
LABEL_67:
          sub_100008C28((const void **)&theArray);
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          id obj = v137;
          id v131 = [obj countByEnumeratingWithState:&v167 objects:v178 count:16];
          if (v131)
          {
            uint64_t v130 = *(void *)v168;
            v143 = v12;
            id v127 = v18;
            v128 = v13;
            id v136 = v17;
            while (2)
            {
              uint64_t v70 = 0;
              while (2)
              {
                if (*(void *)v168 != v130) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v141 = v70;
                capacityb = objc_msgSend(*(id *)(*((void *)&v167 + 1) + 8 * v70), "componentsSeparatedByString:", @"::", v125, v126);
                v71 = [capacityb firstObject];
                long long v163 = 0u;
                long long v164 = 0u;
                long long v165 = 0u;
                long long v166 = 0u;
                id v72 = v155;
                id v73 = [v72 countByEnumeratingWithState:&v163 objects:v177 count:16];
                if (!v73)
                {
LABEL_95:

                  v91 = sub_1000098B8();
                  os_log_type_t v92 = _SC_syslog_os_log_mapping();
                  id v7 = v139;
                  v12 = v143;
                  v13 = v128;
                  id v17 = v136;
                  if (__SC_log_enabled())
                  {
                    long long v196 = 0u;
                    long long v195 = 0u;
                    long long v194 = 0u;
                    long long v193 = 0u;
                    long long v192 = 0u;
                    long long v191 = 0u;
                    long long v190 = 0u;
                    long long v189 = 0u;
                    long long v187 = 0u;
                    long long v188 = 0u;
                    long long v185 = 0u;
                    long long v186 = 0u;
                    long long v183 = 0u;
                    long long v184 = 0u;
                    long long v181 = 0u;
                    long long v182 = 0u;
                    os_log_type_enabled(v91, v92);
                    *(_DWORD *)v174 = 138412546;
                    *(void *)&v174[4] = v71;
                    __int16 v175 = 2112;
                    id v176 = v72;
                    LODWORD(v126) = 22;
                    v125 = (long long *)v174;
                    v93 = (long long *)_os_log_send_and_compose_impl();
                    __SC_log_send2();
                    if (v93 != &v181) {
                      free(v93);
                    }
                  }

                  char v56 = 0;
                  v10 = v152;
                  id v18 = v127;
                  goto LABEL_125;
                }
                id v74 = v73;
                uint64_t v75 = *(void *)v164;
LABEL_74:
                uint64_t v76 = 0;
                while (1)
                {
                  if (*(void *)v164 != v75) {
                    objc_enumerationMutation(v72);
                  }
                  v77 = [*(id *)(*((void *)&v163 + 1) + 8 * v76) componentsSeparatedByString:@"::"];
                  v78 = [v77 firstObject];
                  v79 = [v71 lowercaseString];
                  v80 = [v78 lowercaseString];
                  unsigned int v81 = [v79 containsString:v80];

                  if (v81) {
                    break;
                  }

                  if (v74 == (id)++v76)
                  {
                    id v74 = [v72 countByEnumeratingWithState:&v163 objects:v177 count:16];
                    if (v74) {
                      goto LABEL_74;
                    }
                    goto LABEL_95;
                  }
                }
                v82 = sub_1000098B8();
                os_log_type_t v83 = _SC_syslog_os_log_mapping();
                id v7 = v139;
                v12 = v143;
                if (__SC_log_enabled())
                {
                  long long v196 = 0u;
                  long long v195 = 0u;
                  long long v194 = 0u;
                  long long v193 = 0u;
                  long long v192 = 0u;
                  long long v191 = 0u;
                  long long v190 = 0u;
                  long long v189 = 0u;
                  long long v187 = 0u;
                  long long v188 = 0u;
                  long long v185 = 0u;
                  long long v186 = 0u;
                  long long v183 = 0u;
                  long long v184 = 0u;
                  long long v181 = 0u;
                  long long v182 = 0u;
                  os_log_type_enabled(v82, v83);
                  *(_DWORD *)v174 = 138412546;
                  *(void *)&v174[4] = v71;
                  __int16 v175 = 2112;
                  id v176 = v78;
                  LODWORD(v126) = 22;
                  v125 = (long long *)v174;
                  v84 = (long long *)_os_log_send_and_compose_impl();
                  __SC_log_send2();
                  if (v84 != &v181) {
                    free(v84);
                  }
                }

                uint64_t v70 = v141 + 1;
                if ((id)(v141 + 1) != v131) {
                  continue;
                }
                break;
              }
              id v18 = v127;
              v13 = v128;
              id v17 = v136;
              id v131 = [obj countByEnumeratingWithState:&v167 objects:v178 count:16];
              if (v131) {
                continue;
              }
              break;
            }
          }

          CFMutableArrayRef v138 = v172;
          CFMutableArrayRef v160 = v172;
          v85 = sub_1000098B8();
          os_log_type_t v86 = _SC_syslog_os_log_mapping();
          v10 = v152;
          if (__SC_log_enabled())
          {
            long long v196 = 0u;
            long long v195 = 0u;
            long long v194 = 0u;
            long long v193 = 0u;
            long long v192 = 0u;
            long long v191 = 0u;
            long long v190 = 0u;
            long long v189 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            os_log_type_enabled(v85, v86);
            *(_DWORD *)v174 = 138412290;
            *(void *)&v174[4] = v138;
            LODWORD(v126) = 12;
            v125 = (long long *)v174;
            v87 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v87 != &v181) {
              free(v87);
            }
          }

          char v56 = 1;
        }
        id v72 = v155;
        goto LABEL_125;
      }
LABEL_43:

      v10 = (char *)v10 + 1;
    }
    while (v10 != v149);
    id v106 = [&off_10000C748 countByEnumeratingWithState:&v156 objects:v173 count:16];
    a1 = theDict;
    id v9 = v138;
    id v149 = v106;
  }
  while (v106);
LABEL_133:
  CFDictionarySetValue(a1, @"identifier", v8);
  CFDictionarySetValue(a1, @"expires", value);
  CFDictionarySetValue(a1, @"prefixes", v9);
  if (CFDictionaryGetCount(a1) != 3) {
    sub_1000098C4();
  }
LABEL_169:
  sub_100008C28((const void **)&v162);
  sub_100008C28((const void **)&StringWithDate);
  sub_100008C28((const void **)&v160);
}

int main(int argc, const char **argv, const char **envp)
{
  if (geteuid() || !seteuid(0xFFFFFFFE))
  {
    v3 = objc_opt_new();
    os_log_type_t v4 = +[NSXPCListener serviceListener];
    [v4 setDelegate:v3];
    [v4 activate];
  }
  else
  {
    v3 = sub_1000098B8();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v8, 0, sizeof(v8));
      os_log_type_enabled(v3, v6);
      id v7 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v7 != v8) {
        free(v7);
      }
    }
  }

  return 0;
}

void sub_100008C28(const void **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_100008C60(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0;
  v11.length = CFStringGetLength(a1);
  v11.location = 0;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_100008CE8(const __CFString *a1, void *a2)
{
  *a2 = 0;
  a2[1] = 0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if (result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_100008DA0(const __CFString *a1, _DWORD *a2)
{
  sub_100008C60(a1, (UInt8 *)__str, 64, 0);
  unint64_t v3 = strtoul(__str, 0, 0);
  if (v3 == -1) {
    return 0;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

UInt8 *sub_100008E40(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (!maxBufLen) {
    return 0;
  }
  id v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x10A3B885uLL);
  v10.CFIndex location = location;
  v10.CFIndex length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

UInt8 *sub_100008EF8(const __CFString *a1, CFStringEncoding a2)
{
  v4.CFIndex length = CFStringGetLength(a1);
  v4.CFIndex location = 0;

  return sub_100008E40(a1, v4, a2);
}

void *sub_100008F40(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  v5 = a4;
  os_log_type_t v6 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v7 = a1;
  int v8 = *a4;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  if (!a3)
  {
    *(void *)&long long v68 = 0;
    long long v67 = 0uLL;
    long long v65 = 0uLL;
    long long v66 = 0uLL;
    long long v63 = 0uLL;
    long long v64 = 0uLL;
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    int v8 = 128;
    id v9 = &v59;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    int v10 = 0;
    goto LABEL_85;
  }
  long long v67 = 0uLL;
  *(void *)&long long v68 = 0;
  long long v65 = 0uLL;
  long long v66 = 0uLL;
  long long v63 = 0uLL;
  long long v64 = 0uLL;
  long long v61 = 0uLL;
  long long v62 = 0uLL;
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  id v9 = (long long *)a3;
  LOBYTE(v67) = 1;
LABEL_7:
  *((void *)&v67 + 1) = v9;
  DWORD1(v68) = v8;
  *((void *)&v68 + 1) = 0;
  *(void *)&long long v69 = 0;
  BYTE8(v69) = a5;
  if (a2 < 1)
  {
    int v10 = 0;
LABEL_67:
    if (!v6)
    {
      os_log_type_t v6 = malloc_type_malloc(v10, 0x64155627uLL);
      memcpy(v6, *((const void **)&v67 + 1), v10);
    }
    goto LABEL_84;
  }
  uint64_t v11 = 0;
  uint64_t v52 = a2;
  while (1)
  {
    uint64_t v54 = v11;
    v12 = *(const char **)(v7 + 8 * v11);
    int v55 = v68;
    int v13 = strlen(v12);
    BOOL v14 = (char *)malloc_type_malloc(v13 + 26, 0xA1EABF7AuLL);
    BOOL v15 = malloc_type_malloc(0x30uLL, 0x101004044458BAAuLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((void *)v15 + 4) = v15;
    }
    BOOL v16 = v14 + 24;
    *(void *)BOOL v14 = v15;
    *((void *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    int v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!BYTE8(v69))
    {
      if ((sub_100009770((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_64;
    }
    uint64_t v57 = v69;
    if ((int)v69 < 1)
    {
      unsigned int v24 = 0;
LABEL_41:
      if ((sub_100009770((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_75:
        if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v55);
          uint64_t v7 = a1;
        }
        else
        {
          LODWORD(v68) = v55;
          uint64_t v7 = a1;
        }
        sub_10000985C((void **)v14);
        free(v14);
        goto LABEL_80;
      }
      uint64_t v23 = 0;
      unsigned int v38 = 0;
      char v37 = 1;
      goto LABEL_43;
    }
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    unsigned int v24 = 0;
    uint64_t v56 = *((void *)&v68 + 1);
    uint64_t v25 = *((void *)&v67 + 1);
    do
    {
      uint64_t v26 = *(void *)(v56 + 8 * v22);
      if (!v26) {
        break;
      }
      unsigned int v27 = 0;
      uint64_t v28 = *(unsigned int *)(v26 + 40);
      long long v29 = *(void **)v14;
      uint64_t v30 = *(unsigned int *)(*(void *)v14 + 40);
      do
      {
        unsigned int v31 = v27;
        if ((int)v28 < 1) {
          break;
        }
        if ((int)v30 < 1) {
          break;
        }
        long long v32 = (unsigned __int8 *)(v25 + *(unsigned int *)(*(void *)(v26 + 32) + 4 * v28 - 4));
        size_t v33 = *v32;
        os_log_type_t v34 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v29[4] + 4 * v30 - 4));
        if (v33 != *v34) {
          break;
        }
        int v35 = memcmp(v32 + 1, v34 + 1, v33);
        unsigned int v27 = v31 + 1;
        --v28;
        --v30;
      }
      while (!v35);
      BOOL v36 = v31 > v24;
      if ((int)v31 > (int)v24) {
        unsigned int v24 = v31;
      }
      if (v36) {
        uint64_t v23 = v26;
      }
      ++v22;
    }
    while (v22 != v57);
    if (!v23) {
      goto LABEL_41;
    }
    char v37 = 0;
    unsigned int v38 = *(_DWORD *)(v23 + 40) - v24;
LABEL_43:
    id v39 = *(void **)v14;
    uint64_t v40 = *(unsigned int *)(*(void *)v14 + 40);
    if ((int)v40 >= 1)
    {
      uint64_t v41 = 0;
      uint64_t v42 = v40 - v24;
      do
      {
        if (v41 >= (int)v42)
        {
          int v45 = *(_DWORD *)(*(void *)(v23 + 32) + 4 * (int)v38);
          if (v42 == v41)
          {
            __int16 __src = bswap32(v45 | 0xC000) >> 16;
            if (!sub_100009770((uint64_t)&v59, &__src, 2)) {
              goto LABEL_75;
            }
          }
          ++v38;
          os_log_type_t v43 = *(void **)v14;
        }
        else
        {
          os_log_type_t v43 = *(void **)v14;
          uint64_t v44 = *(unsigned int *)(*(void *)(*(void *)v14 + 32) + 4 * v41);
          if ((v37 & 1) == 0)
          {
            if (!sub_100009770((uint64_t)&v59, (void *)(*((void *)v14 + 1) + v44), *(unsigned __int8 *)(*((void *)v14 + 1) + v44) + 1))goto LABEL_75; {
            os_log_type_t v43 = *(void **)v14;
            }
          }
          int v45 = v44 + v55;
        }
        if (v41 > *((int *)v43 + 10)) {
          fprintf(__stderrp, "attempt to set offset 0x%x at index %d\n", v45, v41);
        }
        *(_DWORD *)(v43[4] + 4 * v41++) = v45;
      }
      while (v40 != v41);
      id v39 = *(void **)v14;
    }
    uint64_t v46 = SDWORD1(v69);
    if (DWORD1(v69) == v69)
    {
      if (DWORD1(v69))
      {
        DWORD1(v69) *= 2;
        CFDateRef v47 = reallocf(*((void **)&v68 + 1), 16 * v46);
      }
      else
      {
        DWORD1(v69) = 8;
        CFDateRef v47 = malloc_type_malloc(0x40uLL, 0x2004093837F09uLL);
      }
      *((void *)&v68 + 1) = v47;
    }
    else
    {
      CFDateRef v47 = (void *)*((void *)&v68 + 1);
    }
    uint64_t v48 = (int)v69;
    LODWORD(v69) = v69 + 1;
    v47[v48] = v39;
    *(void *)BOOL v14 = 0;
LABEL_64:
    sub_10000985C((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v54 + 1;
    if (v54 + 1 == v52)
    {
      int v10 = v68;
      os_log_type_t v6 = a3;
      v5 = a4;
      goto LABEL_67;
    }
  }
  uint64_t v17 = 0;
  size_t v18 = 0;
  int v19 = 0;
  int v20 = 0;
  while (1)
  {
    if (v17 != v13)
    {
      int v21 = v12[v17];
      if (v21 != 46)
      {
        ++v17;
        *(unsigned char *)(*((void *)v14 + 1) + v17) = v21;
        ++v20;
        goto LABEL_19;
      }
    }
    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_71;
    }
    if (v20 >= 64) {
      break;
    }
    sub_1000096D8(*(int **)v14, v18);
    *(unsigned char *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v13 + 1)
    {
      BOOL v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }
  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_71:
  sub_10000985C((void **)v14);
  free(v14);
  if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68)) {
    fprintf(__stderrp, "trying to set used to %d\n", v55);
  }
  else {
    LODWORD(v68) = v55;
  }
LABEL_80:
  v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v54));
  if (a3) {
    int v10 = v68;
  }
  else {
    int v10 = 0;
  }
  os_log_type_t v6 = 0;
LABEL_84:
  sub_100009578((uint64_t)&v59);
LABEL_85:
  _DWORD *v5 = v10;
  return v6;
}

void sub_100009578(uint64_t a1)
{
  sub_100009680((_OWORD *)a1);
  unint64_t v3 = (void **)(a1 + 152);
  v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      do
      {
        sub_10000985C((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8;
      }
      while (v5 < *(int *)(a1 + 160));
      v2 = *v3;
    }
    free(v2);
  }
  NSObject *v3 = 0;
  *(void *)(a1 + 160) = 0;
}

CFDataRef sub_1000095F0(const __CFString *a1)
{
  LODWORD(length) = 0;
  os_log_t v1 = sub_100008EF8(a1, 0x8000100u);
  os_log_type_t v6 = v1;
  if (!v1) {
    return 0;
  }
  v2 = v1;
  unint64_t v3 = (UInt8 *)sub_100008F40((uint64_t)&v6, 1, 0, &length, 0);
  free(v2);
  if (!v3) {
    return 0;
  }
  CFDataRef v4 = CFDataCreate(0, v3, (int)length);
  free(v3);
  return v4;
}

double sub_100009680(_OWORD *a1)
{
  if (!*((unsigned char *)a1 + 128))
  {
    v2 = (_OWORD *)*((void *)a1 + 17);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }
  *((void *)a1 + 18) = 0;
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_1000096D8(int *result, size_t size)
{
  int v2 = size;
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[11];
  if (v4 == result[10])
  {
    result[11] = 2 * v4;
    uint64_t v5 = (void *)*((void *)result + 4);
    if (v5 == (void *)v3)
    {
      os_log_type_t v6 = malloc_type_malloc(8 * v4, 0x100004052888210uLL);
      *(void *)(v3 + 32) = v6;
      double result = (int *)memmove(v6, (const void *)v3, 4 * *(int *)(v3 + 40));
    }
    else
    {
      double result = (int *)reallocf(v5, 8 * v4);
      *(void *)(v3 + 32) = result;
    }
  }
  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 40) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_100009770(uint64_t a1, void *__src, int a3)
{
  int v6 = *(_DWORD *)(a1 + 148);
  int v7 = v6 - *(_DWORD *)(a1 + 144);
  if (v7 < a3)
  {
    if (*(unsigned char *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v7);
      return 0;
    }
    if (a3 <= 128) {
      int v9 = 128;
    }
    else {
      int v9 = a3;
    }
    int v10 = v6 + v9;
    *(_DWORD *)(a1 + 148) = v10;
    uint64_t v11 = *(void **)(a1 + 136);
    if (v11 == (void *)a1)
    {
      v12 = malloc_type_malloc(v10, 0x6DA55C14uLL);
      *(void *)(a1 + 136) = v12;
      memcpy(v12, (const void *)a1, *(int *)(a1 + 144));
    }
    else
    {
      *(void *)(a1 + 136) = reallocf(v11, v10);
    }
  }
  memcpy((void *)(*(void *)(a1 + 136) + *(int *)(a1 + 144)), __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1;
}

void sub_10000985C(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[4];
      if (v3) {
        BOOL v4 = v3 == v2;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        free(v3);
      }
      free(v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_1000098AC(uint64_t result)
{
  qword_100010C30 = result;
  return result;
}

uint64_t sub_1000098B8()
{
  return qword_100010C30;
}

void sub_1000098C4()
{
  __assert_rtn("set_valid_necessary_fields", "IPHPvDInfoRequestServer.m", 615, "CFDictionaryGetCount(additionalInfoDict) == NECESSARY_FIELDS_COUNT");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return _CFDateCompare(theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return _CFDateFormatterCreate(allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return _CFDateFormatterCreateDateFromString(allocator, formatter, string, rangep);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return _CFDateFormatterCreateStringWithDate(allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return __SC_syslog_os_log_mapping();
}

uint64_t __SC_log_enabled()
{
  return ___SC_log_enabled();
}

uint64_t __SC_log_send2()
{
  return ___SC_log_send2();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduleParsingEventAbort(void *a1, const char *a2, ...)
{
  return [a1 scheduleParsingEventAbort];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return [a1 urlSession];
}

id objc_msgSend_validFetch(void *a1, const char *a2, ...)
{
  return [a1 validFetch];
}

id objc_msgSend_xpcClientCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 xpcClientCompletionHandler];
}