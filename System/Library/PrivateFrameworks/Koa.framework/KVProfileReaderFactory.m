@interface KVProfileReaderFactory
- (id)profileReaderForData:(id)a3 error:(id *)a4;
@end

@implementation KVProfileReaderFactory

- (id)profileReaderForData:(id)a3 error:(id *)a4
{
  v122[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_length(v5, v6, v7, v8, v9, v10))
  {
    id v11 = v5;
    int v17 = *(_DWORD *)(objc_msgSend_bytes(v11, v12, v13, v14, v15, v16) + 4);
    id v18 = v11;
    v24 = v18;
    if (v17 == 844517451) {
      v25 = (unsigned int *)objc_msgSend_bytes(v18, v19, v20, v21, v22, v23);
    }
    else {
      v25 = (unsigned int *)(objc_msgSend_bytes(v18, v19, v20, v21, v22, v23) + 4);
    }
    uint64_t v36 = *v25;
    id v37 = v24;
    uint64_t v116 = objc_msgSend_bytes(v37, v38, v39, v40, v41, v42);
    unint64_t v117 = objc_msgSend_length(v37, v43, v44, v45, v46, v47);
    long long v118 = xmmword_1BC3E47C0;
    uint64_t v119 = 0;
    char v120 = 1;
    if (v117 >= 0x7FFFFFFF) {
      __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
    }
    v48 = (int *)((char *)v25 + v36);
    if (sub_1BC3B88C8(&v116, (int *)((char *)v25 + v36)) && sub_1BC3B8980((int *)((char *)v25 + v36), &v116, 4u))
    {
      uint64_t v49 = *v48;
      v50 = (char *)v48 - v49;
      unsigned int v51 = *(unsigned __int16 *)((char *)v48 - v49);
      if (v51 < 5 || !*((_WORD *)v50 + 2)) {
        goto LABEL_75;
      }
      v52 = (unsigned int *)((char *)v48
                           + *((unsigned __int16 *)v50 + 2)
                           + *(unsigned int *)((char *)v48 + *((unsigned __int16 *)v50 + 2)));
      unint64_t v53 = (unint64_t)v52 - v116;
      if (((((unint64_t)v52 - v116) & 3) == 0 || v120 == 0) && v117 >= 5 && v117 - 4 >= v53)
      {
        uint64_t v55 = *v52;
        if (v55 <= 0x7FFFFFFE)
        {
          unint64_t v56 = v55 + 4;
          BOOL v58 = v117 >= v56;
          unint64_t v57 = v117 - v56;
          BOOL v58 = v57 != 0 && v58 && v57 >= v53;
          if (v58)
          {
LABEL_75:
            if (sub_1BC3B8980((int *)((char *)v25 + v36), &v116, 6u))
            {
              if (v51 < 7) {
                goto LABEL_63;
              }
              if (!*((_WORD *)v50 + 3))
              {
                uint64_t v61 = -v49;
                goto LABEL_35;
              }
              if (sub_1BC3B8A54((uint64_t)&v116, (unsigned int *)((char *)v48+ *((unsigned __int16 *)v50 + 3)+ *(unsigned int *)((char *)v48 + *((unsigned __int16 *)v50 + 3))), 4uLL, 0))
              {
                uint64_t v49 = *v48;
                if (*(unsigned __int16 *)((char *)v48 - v49) >= 7u)
                {
                  uint64_t v61 = -v49;
LABEL_35:
                  uint64_t v62 = *(unsigned __int16 *)((char *)v48 + v61 + 6);
                  if (v62)
                  {
                    uint64_t v63 = *(unsigned int *)((char *)v48 + v62);
                    v64 = (int *)((char *)v48 + v62 + v63);
                    if (*v64)
                    {
                      unint64_t v65 = 0;
                      v111 = (unsigned int *)((char *)v48 + v62 + v63);
                      v112 = v64 + 1;
                      uint64_t v115 = (uint64_t)v25 + v36 + v63 + v62 + 8;
                      while (1)
                      {
                        v66 = &v112[v65];
                        uint64_t v67 = *v66;
                        v68 = (int *)((char *)v66 + v67);
                        if (!sub_1BC3B88C8(&v116, (int *)((char *)v66 + v67))) {
                          goto LABEL_59;
                        }
                        if (!sub_1BC3B8980(v68, &v116, 4u)) {
                          goto LABEL_59;
                        }
                        v69 = (unsigned __int16 *)((char *)v68 - *v68);
                        if (*v69 >= 5u)
                        {
                          uint64_t v70 = v69[2];
                          if (v70)
                          {
                            if (!sub_1BC3B8A54((uint64_t)&v116, (unsigned int *)((char *)v68 + v70 + *(unsigned int *)((char *)v68 + v70)), 1uLL, 0))goto LABEL_59; {
                          }
                            }
                        }
                        if (!sub_1BC3B8980(v68, &v116, 6u)) {
                          goto LABEL_59;
                        }
                        uint64_t v71 = *v68;
                        if (*(unsigned __int16 *)((char *)v68 - v71) >= 7u)
                        {
                          if (!*(_WORD *)((char *)v68 - v71 + 6)) {
                            goto LABEL_76;
                          }
                          if (!sub_1BC3B8A54((uint64_t)&v116, (unsigned int *)((char *)v68+ *(unsigned __int16 *)((char *)v68 - v71 + 6)+ *(unsigned int *)((char *)v68+ *(unsigned __int16 *)((char *)v68 - v71 + 6))), 4uLL, 0))goto LABEL_59; {
                          uint64_t v71 = *v68;
                          }
                          if (*(unsigned __int16 *)((char *)v68 - v71) >= 7u)
                          {
LABEL_76:
                            uint64_t v72 = *(unsigned __int16 *)((char *)v68 - v71 + 6);
                            if (v72)
                            {
                              v113 = (char *)v68 + v72;
                              uint64_t v114 = *(unsigned int *)((char *)v68 + v72);
                              if (*(int *)((char *)v68 + v72 + v114))
                              {
                                unint64_t v73 = 0;
                                v74 = (unsigned int *)(v115 + v67 + v114 + v72);
                                do
                                {
                                  uint64_t v75 = *v74;
                                  if (!sub_1BC3B88C8(&v116, (int *)((char *)v74 + v75))) {
                                    goto LABEL_59;
                                  }
                                  if (!sub_1BC3B8980((int *)((char *)v74 + v75), &v116, 4u)) {
                                    goto LABEL_59;
                                  }
                                  uint64_t v76 = v75 - *(int *)((char *)v74 + v75);
                                  if (*(unsigned __int16 *)((char *)v74 + v76) >= 5u)
                                  {
                                    uint64_t v77 = *(unsigned __int16 *)((char *)v74 + v76 + 4);
                                    if (v77)
                                    {
                                      if (!sub_1BC3B8A54((uint64_t)&v116, (unsigned int *)((char *)v74+ v75+ v77+ *(unsigned int *)((char *)v74 + v75 + v77)), 1uLL, 0))goto LABEL_59; {
                                    }
                                      }
                                  }
                                  LODWORD(v118) = v118 - 1;
                                  ++v73;
                                  ++v74;
                                }
                                while (v73 < *(unsigned int *)&v113[v114]);
                              }
                            }
                          }
                        }
                        LODWORD(v118) = v118 - 1;
                        ++v65;
                        v115 += 4;
                        if (v65 >= *v111)
                        {
                          LODWORD(v49) = *v48;
                          break;
                        }
                      }
                    }
                  }
                }
LABEL_63:
                LODWORD(v118) = v118 - 1;
                v83 = (unsigned int *)((char *)v48 + *(unsigned __int16 *)((char *)v48 - (int)v49 + 4));
                v84 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v59, (uint64_t)v83 + *v83 + 4, *(unsigned int *)((char *)v83 + *v83), 0, v60);
                v85 = [KVProfileInfo alloc];
                v89 = objc_msgSend_initWithBuffer_error_(v85, v86, (uint64_t)v84, (uint64_t)a4, v87, v88);
                v95 = v89;
                if (v89)
                {
                  if (objc_msgSend_datasetCount(v89, v90, v91, v92, v93, v94)
                    && ((v96 = (unsigned __int16 *)((char *)v48 - *v48), *v96 < 7u) || !v96[3]))
                  {
                    id v101 = v37;
                    int v107 = *(_DWORD *)objc_msgSend_bytes(v101, v102, v103, v104, v105, v106);
                    v108 = [KVStreamProfileReader alloc];
                    uint64_t v100 = objc_msgSend_initWithData_profileInfo_offset_(v108, v109, (uint64_t)v101, (uint64_t)v95, (v107 + 4), v110);
                  }
                  else
                  {
                    v97 = [KVEmbeddedProfileReader alloc];
                    uint64_t v100 = objc_msgSend_initWithData_profile_profileInfo_(v97, v98, (uint64_t)v37, (uint64_t)v48, (uint64_t)v95, v99);
                  }
                  v35 = (void *)v100;
                }
                else
                {
                  v35 = 0;
                }

                goto LABEL_60;
              }
            }
          }
        }
      }
    }
LABEL_59:
    v78 = [KVJSONProfileReader alloc];
    v35 = objc_msgSend_initWithData_error_(v78, v79, (uint64_t)v37, (uint64_t)a4, v80, v81);
    goto LABEL_60;
  }
  v26 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v121 = *MEMORY[0x1E4F28568];
  v27 = objc_msgSend_stringWithFormat_(NSString, v6, @"Unexpected profile data: %@", v8, v9, v10, v5);
  v122[0] = v27;
  v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v122, (uint64_t)&v121, 1, v29);
  v33 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v31, @"com.apple.koa.profile", 2, (uint64_t)v30, v32);
  v34 = v33;
  if (a4 && v33) {
    *a4 = v33;
  }

  v35 = 0;
LABEL_60:

  return v35;
}

@end