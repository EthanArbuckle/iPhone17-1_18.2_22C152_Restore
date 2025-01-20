@interface CKDPackageManifest
+ (BOOL)readContentsOfFile:(id)a3 intoPackage:(id)a4 error:(id *)a5;
+ (BOOL)writePackage:(id)a3 toFile:(id)a4 error:(id *)a5;
+ (id)packageInClientWithBasePath:(id)a3 contentsOfFile:(id)a4 error:(id *)a5;
@end

@implementation CKDPackageManifest

+ (BOOL)readContentsOfFile:(id)a3 intoPackage:(id)a4 error:(id *)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v9, v10);
  if (objc_msgSend_isReadableFileAtPath_(v11, v12, (uint64_t)v7))
  {
    v14 = objc_msgSend_inputStreamWithFileAtPath_(MEMORY[0x1E4F1CA10], v13, (uint64_t)v7);
    id v15 = objc_alloc(MEMORY[0x1E4F940A0]);
    v17 = objc_msgSend_initWithStream_(v15, v16, (uint64_t)v14);
    objc_msgSend_open(v14, v18, v19);
    uint64_t v20 = objc_opt_class();
    objc_msgSend_setClassOfNextMessage_(v17, v21, v20);
    v61 = v17;
    Message = objc_msgSend_nextMessage(v17, v22, v23);
    if (!Message)
    {
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v24, *MEMORY[0x1E4F19C40], 1000, v7, @"Failed reading package object from manifest");
        BOOL v32 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v32 = 0;
      }
      goto LABEL_34;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v104 = 0x2020000000;
    uint64_t v105 = 0;
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x2020000000;
    int v96 = 0;
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2020000000;
    uint64_t v87 = 0;
    uint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x2020000000;
    char v83 = 0;
    v25 = objc_opt_new();
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x2020000000;
    uint64_t v79 = 0;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = sub_1C4F442E8;
    v63[3] = &unk_1E64F6938;
    id v26 = v8;
    id v64 = v26;
    id v65 = Message;
    id v66 = v17;
    v69 = &v76;
    id v27 = v7;
    id v67 = v27;
    id v60 = v25;
    id v68 = v60;
    p_long long buf = &buf;
    v71 = &v80;
    v72 = &v93;
    v73 = v88;
    v74 = &v89;
    v75 = &v84;
    v29 = objc_msgSend_performTransactionBlock_(v26, v28, (uint64_t)v63);
    v30 = v29;
    if (v29)
    {
      if (a5)
      {
        id v31 = v29;
        goto LABEL_6;
      }
LABEL_31:
      BOOL v32 = 0;
      goto LABEL_33;
    }
    id v34 = v27;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v35 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v58 = v77[3];
      uint64_t v59 = v85[3];
      *(_DWORD *)v97 = 134218498;
      uint64_t v98 = v58;
      __int16 v99 = 2048;
      uint64_t v100 = v59;
      __int16 v101 = 2112;
      id v102 = v26;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Read %ld items (%llu bytes) from manifest for package %@", v97, 0x20u);
    }
    if (*((unsigned char *)v81 + 24))
    {
      v90[3] = 0;
      int v38 = *((_DWORD *)v94 + 6) + 1;
      *((_DWORD *)v94 + 6) = v38;
    }
    else
    {
      int v38 = *((_DWORD *)v94 + 6);
      if (v90[3])
      {
        v45 = objc_msgSend_objectAtIndexedSubscript_(v60, v36, v38);
        v48 = v45;
        if (a5)
        {
          v49 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v50 = *((int *)v94 + 6);
          uint64_t v51 = objc_msgSend_size(v45, v46, v47);
          objc_msgSend_errorWithDomain_code_path_format_(v49, v52, *MEMORY[0x1E4F19C40], 1000, v34, @"Package manifest is corrupt - section %lu contains %llu bytes, expected %llu bytes", v50, v51, v90[3]);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_31;
      }
    }
    if (objc_msgSend_count(v60, v36, v37) == v38)
    {
      objc_msgSend_setSize_(v26, v39, *(void *)(*((void *)&buf + 1) + 24));
      BOOL v32 = 1;
      goto LABEL_33;
    }
    if (!a5)
    {
      BOOL v32 = 0;
      goto LABEL_33;
    }
    v41 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v42 = *((int *)v94 + 6);
    uint64_t v43 = objc_msgSend_count(v60, v39, v40);
    objc_msgSend_errorWithDomain_code_path_format_(v41, v44, *MEMORY[0x1E4F19C40], 1000, v34, @"Package manifest is corrupt - Expected %lu sections, found %lu", v42, v43);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    BOOL v32 = 0;
    *a5 = v31;
LABEL_33:

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&buf, 8);
LABEL_34:

    goto LABEL_35;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19C40], 1000, v7, @"File not readable");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v33 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    v53 = v33;
    v56 = objc_msgSend_CKSanitizedPath(v7, v54, v55);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v56;
    _os_log_error_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_ERROR, "Couldn't read the package manifest at %{public}@", (uint8_t *)&buf, 0xCu);
  }
  BOOL v32 = 0;
LABEL_35:

  return v32;
}

+ (id)packageInClientWithBasePath:(id)a3 contentsOfFile:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F1A250];
  id v9 = a4;
  v11 = objc_msgSend_packageInClientWithBasePath_error_(v8, v10, (uint64_t)a3, a5);
  LODWORD(a5) = objc_msgSend_readContentsOfFile_intoPackage_error_(a1, v12, (uint64_t)v9, v11, a5);

  if (a5) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (BOOL)writePackage:(id)a3 toFile:(id)a4 error:(id *)a5
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v9, v10);
  if ((objc_msgSend_fileExistsAtPath_(v11, v12, (uint64_t)v8) & 1) != 0
    || (objc_msgSend_data(MEMORY[0x1E4F1C9B8], v13, v14),
        id v15 = objc_claimAutoreleasedReturnValue(),
        int v17 = objc_msgSend_writeToFile_options_error_(v15, v16, (uint64_t)v8, 0, a5),
        v15,
        v17))
  {
    if (objc_msgSend_isWritableFileAtPath_(v11, v13, (uint64_t)v8))
    {
      uint64_t v19 = objc_msgSend_outputStreamToFileAtPath_append_(MEMORY[0x1E4F1CAA8], v18, (uint64_t)v8, 0);
      id v20 = objc_alloc(MEMORY[0x1E4F940A8]);
      v22 = objc_msgSend_initWithOutputStream_(v20, v21, (uint64_t)v19);
      objc_msgSend_open(v19, v23, v24);
      v25 = objc_alloc_init(CKDPPackageManifestHeader);
      v28 = objc_msgSend_signature(v7, v26, v27);
      objc_msgSend_setSignature_(v25, v29, (uint64_t)v28);

      BOOL v32 = objc_msgSend_verificationKey(v7, v30, v31);
      objc_msgSend_setVerificationKey_(v25, v33, (uint64_t)v32);

      objc_msgSend_setVersion_(v25, v34, 1);
      if (objc_msgSend_writeMessage_(v22, v35, (uint64_t)v25))
      {
        v117 = a5;
        v118 = v25;
        v123 = v22;
        v119 = v11;
        id v120 = v8;
        uint64_t v39 = objc_msgSend_sectionCount(v7, v36, v37);
        v121 = v19;
        if (v39 < 1)
        {
LABEL_21:
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          id v67 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 134218242;
            uint64_t v129 = v39;
            __int16 v130 = 2112;
            id v131 = v7;
            _os_log_debug_impl(&dword_1C4CFF000, v67, OS_LOG_TYPE_DEBUG, "Wrote %ld sections to manifest for package %@", buf, 0x16u);
          }
          uint64_t v70 = objc_msgSend_itemCount(v7, v68, v69);
          objc_msgSend_itemEnumerator(v7, v71, v72);
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v124, v134, 16);
          uint64_t v112 = v70;
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v76 = 0;
            uint64_t v77 = 0;
            uint64_t v78 = *(void *)v125;
            uint64_t v79 = v70 - 1;
            v22 = v123;
            id v115 = v7;
            uint64_t v113 = v70 - 1;
LABEL_27:
            uint64_t v80 = 0;
            uint64_t v81 = v79 - v77;
            uint64_t v114 = v75 + v77;
            while (1)
            {
              if (*(void *)v125 != v78) {
                objc_enumerationMutation(obj);
              }
              uint64_t v82 = *(void **)(*((void *)&v124 + 1) + 8 * v80);
              char v83 = (void *)MEMORY[0x1C8789E70]();
              uint64_t v84 = objc_alloc_init(CKDPPackageManifestItem);
              uint64_t v87 = objc_msgSend_signature(v82, v85, v86);
              objc_msgSend_setSignature_(v84, v88, (uint64_t)v87);

              uint64_t v91 = objc_msgSend_size(v82, v89, v90);
              objc_msgSend_setSize_(v84, v92, v91);
              if (v81 == v80) {
                objc_msgSend_setLastItem_(v84, v93, 1);
              }
              if (!objc_msgSend_writeMessage_(v22, v93, (uint64_t)v84, v112)) {
                break;
              }
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              uint64_t v95 = (void *)*MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                log = v95;
                uint64_t v101 = objc_msgSend_size(v82, v99, v100);
                uint64_t v104 = objc_msgSend_signature(v82, v102, v103);
                *(_DWORD *)long long buf = 134218242;
                uint64_t v129 = v101;
                __int16 v130 = 2112;
                id v131 = v104;
                _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Wrote package item with size:%lld, signature:%@", buf, 0x16u);

                v22 = v123;
              }
              v76 += objc_msgSend_size(v82, v96, v97);

              if (v75 == ++v80)
              {
                uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v98, (uint64_t)&v124, v134, 16);
                uint64_t v77 = v114;
                id v7 = v115;
                uint64_t v79 = v113;
                if (v75) {
                  goto LABEL_27;
                }
                goto LABEL_49;
              }
            }
            id v8 = v120;
            uint64_t v105 = objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v94, *MEMORY[0x1E4F19C40], 1000, v120, @"Failed writing item object to manifest");

            id v7 = v115;
            if (!v105) {
              goto LABEL_50;
            }
            uint64_t v19 = v121;
            v25 = v118;
            if (v117) {
              id *v117 = v105;
            }
            objc_msgSend_close(v121, v106, v107);

            LOBYTE(v17) = 0;
          }
          else
          {
            uint64_t v76 = 0;
            v22 = v123;
LABEL_49:

            id v8 = v120;
LABEL_50:
            uint64_t v19 = v121;
            v25 = v118;
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v108 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 134218498;
              uint64_t v129 = v112;
              __int16 v130 = 2048;
              id v131 = v76;
              __int16 v132 = 2112;
              id v133 = v7;
              _os_log_debug_impl(&dword_1C4CFF000, v108, OS_LOG_TYPE_DEBUG, "Wrote %ld items (%llu bytes) to manifest for package %@", buf, 0x20u);
            }
            objc_msgSend_close(v121, v109, v110, v112);
            LOBYTE(v17) = 1;
          }
          v11 = v119;
        }
        else
        {
          uint64_t v40 = 0;
          while (1)
          {
            v41 = objc_msgSend_sectionAtIndex_(v7, v38, v40);
            uint64_t v42 = objc_alloc_init(CKDPPackageManifestSection);
            v45 = objc_msgSend_signature(v41, v43, v44);
            objc_msgSend_setSignature_(v42, v46, (uint64_t)v45);

            v49 = objc_msgSend_verificationKey(v41, v47, v48);
            objc_msgSend_setVerificationKey_(v42, v50, (uint64_t)v49);

            uint64_t v53 = objc_msgSend_size(v41, v51, v52);
            objc_msgSend_setSize_(v42, v54, v53);
            if (v39 - 1 == v40) {
              objc_msgSend_setLastSection_(v42, v55, 1);
            }
            if ((objc_msgSend_writeMessage_(v123, v55, (uint64_t)v42) & 1) == 0) {
              break;
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v58 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              uint64_t v59 = v58;
              uint64_t v62 = objc_msgSend_size(v41, v60, v61);
              objc_msgSend_signature(v41, v63, v64);
              v66 = id v65 = v7;
              *(_DWORD *)long long buf = 134218242;
              uint64_t v129 = v62;
              __int16 v130 = 2112;
              id v131 = v66;
              _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "Wrote package section with size:%lld, signature:%@", buf, 0x16u);

              id v7 = v65;
              uint64_t v19 = v121;
            }
            if (v39 == ++v40) {
              goto LABEL_21;
            }
          }
          if (v117)
          {
            objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v56, *MEMORY[0x1E4F19C40], 1000, v8, @"Failed writing section object to manifest");
            id *v117 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_close(v19, v56, v57);

          LOBYTE(v17) = 0;
          v25 = v118;
          v22 = v123;
        }
      }
      else if (a5)
      {
        objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19C40], 1000, v8, @"Failed writing package object to manifest");
        LOBYTE(v17) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else if (a5)
    {
      objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E4F1A280], v18, *MEMORY[0x1E4F19C40], 1000, v8, @"File not writable");
      LOBYTE(v17) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

@end