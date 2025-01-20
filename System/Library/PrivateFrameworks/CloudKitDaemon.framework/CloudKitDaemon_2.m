void sub_1C4FBAB54(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  long long v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  char v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  long long v30;
  id v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  unsigned char v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v2 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_INFO, "Removing all tokens from PDS", buf, 2u);
  }
  v5 = objc_msgSend_inlock_registrar(*(void **)(a1 + 32), v3, v4);
  v36 = 0;
  v7 = objc_msgSend_activeUsersWithError_(v5, v6, (uint64_t)&v36);
  v8 = v36;

  if (!v7)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v9 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = (uint64_t)v8;
      _os_log_error_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_ERROR, "Unable to iterate active users: %@", buf, 0xCu);
    }
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v7;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, v41, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(void *)v33;
    *(void *)&v15 = 138412546;
    v30 = v15;
    do
    {
      v18 = 0;
      do
      {
        v19 = v8;
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v10);
        }
        v20 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
        v21 = objc_msgSend_inlock_registrar(*(void **)(a1 + 32), v13, v14, v30);
        v31 = v8;
        v23 = objc_msgSend_removeAllRegistrationsFromUser_error_(v21, v22, v20, &v31);
        v8 = v31;

        if ((v23 & 1) == 0)
        {
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v24 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            v38 = v20;
            v39 = 2112;
            v40 = v8;
            _os_log_error_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_ERROR, "Unable to remove all registrations for user %@: %@", buf, 0x16u);
          }
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v32, v41, 16);
    }
    while (v16);
  }

  v27 = objc_msgSend_registrationsByDSID(*(void **)(a1 + 32), v25, v26);
  objc_msgSend_removeAllObjects(v27, v28, v29);
}

uint64_t sub_1C4FBB9B4(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t sub_1C4FBE43C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_zoneID(a2, (const char *)a2, a3);
}

void sub_1C4FBF364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_1C4FBF444()
{
  uint64_t result = _CKUseSystemInstalledBinaries();
  *MEMORY[0x1E4F1A4E8] = result;
  return result;
}

void sub_1C4FBF7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FBF7CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C4FBF7DC(uint64_t a1)
{
}

void sub_1C4FBF7E4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_metadataCache(*(void **)(a1 + 32), a2, a3);
  v7 = objc_msgSend_knownAppContainerAccountTuples(v4, v5, v6);

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = v7;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v92, v104, 16);
  if (!v9) {
    goto LABEL_42;
  }
  uint64_t v13 = v9;
  uint64_t v14 = *(void *)v93;
  int v15 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  *(void *)&long long v12 = 138412802;
  long long v87 = v12;
  while (2)
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v93 != v14) {
        objc_enumerationMutation(obj);
      }
      char v17 = *(void **)(*((void *)&v92 + 1) + 8 * v16);
      unsigned int v18 = objc_msgSend_appContainerTuple(v17, v10, v11, v87);
      unint64_t v21 = objc_msgSend_containerID(v18, v19, v20);
      v24 = objc_msgSend_containerIdentifier(v21, v22, v23);
      char isEqual = objc_msgSend_isEqual_(v24, v25, *(void *)(a1 + 40));

      v27 = (void *)*MEMORY[0x1E4F1A548];
      if (isEqual)
      {
        if (*v15 != -1) {
          dispatch_once(v15, v27);
        }
        v28 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v76 = *(void *)(a1 + 48);
          uint64_t v75 = *(void *)(a1 + 56);
          uint64_t v77 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138413058;
          uint64_t v97 = v76;
          __int16 v98 = 2112;
          uint64_t v99 = v75;
          __int16 v100 = 2112;
          uint64_t v101 = v77;
          __int16 v102 = 2112;
          id v103 = v17;
          _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@], %@", buf, 0x2Au);
        }
        v31 = objc_msgSend_appContainerTuple(v17, v29, v30);
        v34 = objc_msgSend_personaID(v31, v32, v33);
        BOOL v35 = CKAdoptPersonaID(v34);

        if (v35)
        {
          uint64_t v36 = *(void *)(a1 + 32);
          v37 = objc_msgSend_sharedInternalUseContainers(CKDContainer, v10, v11);
          v39 = objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v38, (uint64_t)v17, v36, v37);

          id v91 = 0;
          char v41 = objc_msgSend_setupAssetTransfers_(v39, v40, (uint64_t)&v91);
          id v44 = v91;
          if (v41)
          {
            v45 = objc_msgSend_MMCS(v39, v42, v43);

            if (v45)
            {
              v48 = objc_msgSend_MMCS(v39, v46, v47);
              uint64_t v50 = objc_msgSend_retrieveChunkWithSignature_(v48, v49, *(void *)(a1 + 56));
              uint64_t v51 = *(void *)(*(void *)(a1 + 64) + 8);
              v52 = *(void **)(v51 + 40);
              *(void *)(v51 + 40) = v50;

              if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
              {
                if (*v15 != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                v82 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v84 = *(void *)(a1 + 40);
                  uint64_t v83 = *(void *)(a1 + 48);
                  uint64_t v85 = *(void *)(a1 + 56);
                  v86 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                  *(_DWORD *)buf = 138413058;
                  uint64_t v97 = v83;
                  __int16 v98 = 2112;
                  uint64_t v99 = v85;
                  __int16 v100 = 2112;
                  uint64_t v101 = v84;
                  __int16 v102 = 2112;
                  id v103 = v86;
                  _os_log_debug_impl(&dword_1C4CFF000, v82, OS_LOG_TYPE_DEBUG, "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@] found %@", buf, 0x2Au);
                }

                goto LABEL_42;
              }
              if (*v15 != -1) {
                dispatch_once(v15, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              v53 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
              {
                uint64_t v55 = *(void *)(a1 + 48);
                uint64_t v54 = *(void *)(a1 + 56);
                uint64_t v56 = *(void *)(a1 + 40);
                *(_DWORD *)buf = v87;
                uint64_t v97 = v55;
                __int16 v98 = 2112;
                uint64_t v99 = v54;
                __int16 v100 = 2112;
                uint64_t v101 = v56;
                _os_log_debug_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_DEBUG, "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@] not found", buf, 0x20u);
              }
              goto LABEL_30;
            }
            if (*v15 != -1) {
              dispatch_once(v15, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v74 = *MEMORY[0x1E4F1A500];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
LABEL_30:

              goto LABEL_31;
            }
            uint64_t v79 = *(void *)(a1 + 48);
            uint64_t v78 = *(void *)(a1 + 56);
            uint64_t v80 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v87;
            uint64_t v97 = v79;
            __int16 v98 = 2112;
            uint64_t v99 = v78;
            __int16 v100 = 2112;
            uint64_t v101 = v80;
            v71 = v74;
            v72 = "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@] container.MMCS nil";
            uint32_t v73 = 32;
          }
          else
          {
            if (*v15 != -1) {
              dispatch_once(v15, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v67 = *MEMORY[0x1E4F1A500];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR)) {
              goto LABEL_30;
            }
            uint64_t v69 = *(void *)(a1 + 48);
            uint64_t v68 = *(void *)(a1 + 56);
            uint64_t v70 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138413058;
            uint64_t v97 = v69;
            __int16 v98 = 2112;
            uint64_t v99 = v68;
            __int16 v100 = 2112;
            uint64_t v101 = v70;
            __int16 v102 = 2112;
            id v103 = v44;
            v71 = v67;
            v72 = "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@] MMCS setup failed: %@";
            uint32_t v73 = 42;
          }
          _os_log_error_impl(&dword_1C4CFF000, v71, OS_LOG_TYPE_ERROR, v72, buf, v73);
          goto LABEL_30;
        }
      }
      else
      {
        if (*v15 != -1) {
          dispatch_once(v15, v27);
        }
        v57 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v58 = *(void *)(a1 + 48);
          uint64_t v88 = *(void *)(a1 + 56);
          uint64_t v89 = *(void *)(a1 + 40);
          v59 = v57;
          v39 = objc_msgSend_appContainerTuple(v17, v60, v61);
          objc_msgSend_containerID(v39, v62, v63);
          id v44 = (id)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_containerIdentifier(v44, v64, v65);
          *(_DWORD *)buf = 138413058;
          uint64_t v97 = v58;
          __int16 v98 = 2112;
          uint64_t v99 = v88;
          __int16 v100 = 2112;
          uint64_t v101 = v89;
          __int16 v102 = 2112;
          id v103 = v66;
          _os_log_debug_impl(&dword_1C4CFF000, v59, OS_LOG_TYPE_DEBUG, "[%@ chunkDataFromSignature:%@ forContainerIdentifier:%@] wrong containerIdentifier %@", buf, 0x2Au);

          goto LABEL_30;
        }
      }
LABEL_31:
      ++v16;
    }
    while (v13 != v16);
    uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v92, v104, 16);
    uint64_t v13 = v81;
    if (v81) {
      continue;
    }
    break;
  }
LABEL_42:
}

uint64_t CKDPRecordTypeReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t sub_1C4FC0398(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t sub_1C4FC0D34(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        a1[52] |= 2u;
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
            goto LABEL_49;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_51:
        uint64_t v39 = 32;
        goto LABEL_60;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 40;
        goto LABEL_30;
      case 3u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
LABEL_30:
        v26 = *(void **)&a1[v25];
        *(void *)&a1[v25] = v24;

        goto LABEL_61;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v19 = 0;
        a1[52] |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v19 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_55:
        uint64_t v39 = 8;
        goto LABEL_60;
      case 5u:
        v32 = objc_alloc_init(CKCDPErrorUserInfoEntry);
        objc_msgSend_addAuxiliaryUserInfo_(a1, v33, (uint64_t)v32);
        if (PBReaderPlaceMark() && sub_1C4F4553C((uint64_t)v32, a2))
        {
          PBReaderRecallMark();

LABEL_61:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 6u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v19 = 0;
        a1[52] |= 4u;
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
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v19 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_59:
        uint64_t v39 = 48;
LABEL_60:
        *(_DWORD *)&a1[v39] = v19;
        goto LABEL_61;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_61;
    }
  }
}

uint64_t sub_1C4FC1D24(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unsigned int v18 = PBReaderReadString();
        if (v18) {
          objc_msgSend_addConflictLoserEtags_(a1, v17, (uint64_t)v18);
        }
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

_DWORD *sub_1C4FC2358(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  v2 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], a2, a1, 200, 0, 0);
  size_t v5 = objc_msgSend_length(v2, v3, v4);
  uint64_t v6 = malloc_type_calloc(1uLL, v5 + 200, 0xEB83A71BuLL);
  *uint64_t v6 = 1;
  v6[1] = v5;
  id v7 = v2;
  unint64_t v10 = (const void *)objc_msgSend_bytes(v7, v8, v9);
  memcpy(v6 + 50, v10, v5);

  return v6;
}

uint64_t compareVersionStrings(void *a1, void *a2)
{
  id v3 = a2;
  size_t v5 = objc_msgSend_componentsSeparatedByString_(a1, v4, @".");
  id v7 = objc_msgSend_componentsSeparatedByString_(v3, v6, @".");
  unint64_t v10 = objc_msgSend_count(v5, v8, v9);
  unint64_t v13 = objc_msgSend_count(v7, v11, v12);
  if (v10 >= v13) {
    unint64_t v10 = v13;
  }
  if (!v10)
  {
LABEL_11:
    if (v10 >= objc_msgSend_count(v5, v14, v15))
    {
LABEL_17:
      if (v10 >= objc_msgSend_count(v7, v26, v27))
      {
LABEL_22:
        uint64_t v25 = 0;
        goto LABEL_26;
      }
      while (1)
      {
        uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v7, v36, v10);
        if (objc_msgSend_length(v29, v37, v38))
        {
          uint64_t v40 = objc_msgSend_compare_options_(v29, v39, @"0", 64);
          if (v40 == -1)
          {
            uint64_t v25 = 1;
            goto LABEL_25;
          }
          if (v40 == 1) {
            break;
          }
        }

        if (++v10 >= objc_msgSend_count(v7, v41, v42)) {
          goto LABEL_22;
        }
      }
      uint64_t v25 = -1;
    }
    else
    {
      uint64_t v28 = v10;
      while (1)
      {
        uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v5, v26, v28);
        if (objc_msgSend_length(v29, v30, v31))
        {
          uint64_t v33 = objc_msgSend_compare_options_(v29, v32, @"0", 64);
          uint64_t v25 = v33;
          if (v33 == -1 || v33 == 1) {
            break;
          }
        }

        if (++v28 >= (unint64_t)objc_msgSend_count(v5, v34, v35)) {
          goto LABEL_17;
        }
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v16 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v14, v16);
    char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v7, v18, v16);
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_length(v17, v20, v21))
    {

      char v17 = @"0";
    }
    if (!objc_msgSend_length(v19, v22, v23))
    {

      uint64_t v19 = @"0";
    }
    uint64_t v25 = objc_msgSend_compare_options_(v17, v24, (uint64_t)v19, 64);

    if (v25) {
      break;
    }
    if (v10 == ++v16) {
      goto LABEL_11;
    }
  }
LABEL_26:

  return v25;
}

id sub_1C4FC2628(void *a1, const char *a2, uint64_t a3)
{
  if (qword_1EBBD0050 != -1) {
    dispatch_once(&qword_1EBBD0050, &unk_1F2044790);
  }
  if (objc_msgSend_count(a1, a2, a3))
  {
    uint64_t v4 = objc_opt_new();
    id v7 = objc_msgSend_allKeys(a1, v5, v6);
    if (objc_msgSend_count(v7, v8, v9))
    {
      unint64_t v11 = 0;
      do
      {
        if (v11) {
          objc_msgSend_appendString_(v4, v10, @"&");
        }
        uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v7, v10, v11);
        BOOL v14 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v12, v13, qword_1EBBD0048);

        uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v15, v11);
        unsigned int v18 = objc_msgSend_objectForKeyedSubscript_(a1, v17, (uint64_t)v16);
        uint64_t v20 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v18, v19, qword_1EBBD0048);

        objc_msgSend_appendFormat_(v4, v21, @"%@=%@", v14, v20);
        ++v11;
      }
      while (v11 < objc_msgSend_count(v7, v22, v23));
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_1C4FC27A4(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], a2, a3);
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);
  id v7 = (void *)qword_1EBBD0048;
  qword_1EBBD0048 = v6;

  uint64_t v8 = qword_1EBBD0048;
  return MEMORY[0x1F4181798](v8, sel_removeCharactersInString_, @"&#+");
}

uint64_t sub_1C4FC2808(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v7 = objc_msgSend_entitlements(v4, v5, v6);
  unint64_t v10 = objc_msgSend_cloudServices(v7, v8, v9);
  if ((objc_msgSend_containsObject_(v10, v11, *MEMORY[0x1E4F1A590]) & 1) == 0)
  {

LABEL_7:
    uint64_t v20 = 0;
    goto LABEL_8;
  }
  BOOL v14 = objc_msgSend_entitlements(v4, v12, v13);
  char isBackgroundAssetsExtension = objc_msgSend_isBackgroundAssetsExtension(v14, v15, v16);

  if (isBackgroundAssetsExtension & 1) != 0 || (sub_1C4D0D89C(v3, v4)) {
    goto LABEL_7;
  }
  if ((objc_msgSend_hasTCCAuthorization(v4, v18, v19) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v22 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      id v24 = v3;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_INFO, "TCC rejected a token for bundleID:%@, container:%@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v20 = 1;
LABEL_8:

  return v20;
}

uint64_t _isOperationAllowedIndependentlyInSyncBubble(void *a1, void *a2)
{
  id v3 = a1;
  id v5 = a2;
  if (qword_1EBBD0060 != -1) {
    dispatch_once(&qword_1EBBD0060, &unk_1F20447B0);
  }
  if (objc_msgSend_containsObject_((void *)qword_1EBBD0058, v4, (uint64_t)v3))
  {
    uint64_t isAppleInternal = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"CKQueryOperation"))
  {
    uint64_t isAppleInternal = objc_msgSend_isAppleInternal(v5, v8, v9);
  }
  else
  {
    uint64_t isAppleInternal = 0;
  }

  return isAppleInternal;
}

uint64_t sub_1C4FC2A4C(uint64_t a1, const char *a2)
{
  qword_1EBBD0058 = objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"CKModifyRecordsOperation", 0);
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FC2AA4()
{
  MEMORY[0x1C87885B0]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend_stringByAppendingPathComponent_(v3, v0, @"Library/Caches/CloudKit");
  v2 = (void *)qword_1EBBD0068;
  qword_1EBBD0068 = v1;
}

id CKGetDataSeparatedVolumeCacheDirectory()
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&stru_1EA3CCEF8);
  if (!qword_1EA3D1060)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v1 = (void *)qword_1EA3D1060;
    qword_1EA3D1060 = (uint64_t)v0;
  }
  id v4 = CKCurrentPersonaID();
  if (!v4)
  {
    id v4 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v2, v3);
  }
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3D1060, v2, (uint64_t)v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    pthread_mutex_unlock(&stru_1EA3CCEF8);
    goto LABEL_40;
  }
  container_query_create();
  container_query_set_class();
  xpc_object_t v7 = xpc_string_create("com.apple.cloudd");
  container_query_set_identifiers();

  container_query_operation_set_flags();
  unint64_t v10 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v8, v9);

  if (v4 != v10)
  {
    id v11 = v4;
    objc_msgSend_UTF8String(v11, v12, v13);
  }
  container_query_set_persona_unique_string();
  if (container_query_get_single_result() && (uint64_t path = container_get_path()) != 0)
  {
    uint64_t v15 = (const char *)path;
    uint64_t v16 = (uint64_t *)MEMORY[0x1E4F1A550];
    char v17 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unsigned int v18 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v47 = (void *)v15;
      __int16 v48 = 2112;
      v49 = v4;
      _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Got data separated volume container path %s from containermanager for persona %@", buf, 0x16u);
    }
    char v22 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v20, v21);
    size_t v23 = strlen(v15);
    __int16 v25 = objc_msgSend_stringWithFileSystemRepresentation_length_(v22, v24, (uint64_t)v15, v23);

    uint64_t v6 = objc_msgSend_stringByAppendingPathComponent_(v25, v26, @"Library/Caches/CloudKit");

    uint64_t v27 = container_copy_sandbox_token();
    dispatch_block_t v28 = *v17;
    uint64_t v29 = *v16;
    if (v27)
    {
      unint64_t v30 = (void *)v27;
      if (v29 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v28);
      }
      uint64_t v31 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v47 = (void *)v15;
        __int16 v48 = 2112;
        v49 = v4;
        _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Consuming sandbox token for data separated container path %s for persona %@", buf, 0x16u);
      }
      if (sandbox_extension_consume() < 0)
      {
        if (*v16 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], *v17);
        }
        os_log_t v32 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = v32;
          char v34 = __error();
          uint64_t v35 = strerror(*v34);
          *(_DWORD *)buf = 136315138;
          uint64_t v47 = v35;
          _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension: %s", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v29 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v28);
      }
      unint64_t v37 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v47 = (void *)v15;
        __int16 v48 = 2112;
        v49 = v4;
        _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Didn't get a sandbox token for data separated container path %s for persona %@", buf, 0x16u);
      }
      unint64_t v30 = 0;
    }
  }
  else
  {
    if (!container_query_get_last_error())
    {
      uint64_t v6 = 0;
      goto LABEL_38;
    }
    unint64_t v30 = (void *)container_error_copy_unlocalized_description();
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v36 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = v4;
      __int16 v48 = 2080;
      v49 = v30;
      _os_log_fault_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_FAULT, "Error getting data separated volume container from containermanager for persona %@: %s", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }
  free(v30);
LABEL_38:
  container_query_free();
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EA3D1060, v38, (uint64_t)v6, v4);
  pthread_mutex_unlock(&stru_1EA3CCEF8);
  if (!v6)
  {
    uint64_t v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v39, v40);
    id v44 = objc_msgSend_stringWithUTF8String_(NSString, v43, (uint64_t)"NSString * _Nonnull CKGetDataSeparatedVolumeCacheDirectory(void)");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v42, v45, (uint64_t)v44, @"CKDDaemonUtils.m", 438, @"Unexpectedly-nil cache dir for persona id %@", v4);

    uint64_t v6 = 0;
  }
LABEL_40:

  return v6;
}

uint64_t CKShouldAdoptPersona(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v3 = objc_msgSend_personaAttributesForPersonaUniqueString_(MEMORY[0x1E4FB3710], v2, (uint64_t)v1);
  uint64_t isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v4, v5);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  xpc_object_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = @" not";
    if (isEnterprisePersona) {
      uint64_t v9 = &stru_1F2044F30;
    }
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v1;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Should%@ adopt persona with ID %@", (uint8_t *)&v10, 0x16u);
  }

  return isEnterprisePersona;
}

BOOL CKAdoptPersonaID(void *a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (sub_1C4D0D570())
  {
    if (CKShouldAdoptPersona(v1))
    {
      id v4 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v2, v3);
      xpc_object_t v7 = objc_msgSend_currentPersona(v4, v5, v6);
      uint64_t v9 = objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(v7, v8, (uint64_t)v1);

      int v10 = (void *)*MEMORY[0x1E4F1A548];
      if (v9)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v10);
        }
        id v11 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          int v43 = 138412546;
          id v44 = v1;
          __int16 v45 = 2112;
          v46 = v9;
          _os_log_fault_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_FAULT, "Couldn't adopt personaID %@ : %@", (uint8_t *)&v43, 0x16u);
        }
        BOOL v12 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v10);
        }
        uint64_t v29 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          int v43 = 138412290;
          id v44 = v1;
          _os_log_debug_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_DEBUG, "Current thread adopting persona %@", (uint8_t *)&v43, 0xCu);
        }
        uint64_t v9 = 0;
        BOOL v12 = 1;
      }
    }
    else
    {
      BOOL v12 = v1 == 0;
      id v13 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v2, v3);
      uint64_t v16 = objc_msgSend_currentPersona(v13, v14, v15);
      uint64_t v9 = objc_msgSend_userPersonaUniqueString(v16, v17, v18);

      uint64_t v21 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v19, v20);
      id v24 = objc_msgSend_currentPersona(v21, v22, v23);
      id v26 = objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(v24, v25, 0);

      uint64_t v27 = (void *)*MEMORY[0x1E4F1A548];
      if (v26)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v27);
        }
        dispatch_block_t v28 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
        {
          int v43 = 138412546;
          id v44 = v9;
          __int16 v45 = 2112;
          v46 = v26;
          _os_log_fault_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_FAULT, "Couldn't drop current persona %@: %@", (uint8_t *)&v43, 0x16u);
        }
        BOOL v12 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v27);
        }
        unint64_t v30 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          os_log_t v32 = (void *)MEMORY[0x1E4FB36F8];
          uint64_t v33 = v30;
          uint64_t v36 = objc_msgSend_sharedManager(v32, v34, v35);
          uint64_t v39 = objc_msgSend_currentPersona(v36, v37, v38);
          uint64_t v42 = objc_msgSend_userPersonaUniqueString(v39, v40, v41);
          int v43 = 138412546;
          id v44 = v9;
          __int16 v45 = 2112;
          v46 = v42;
          _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Current thread dropping persona %@. New persona is %@", (uint8_t *)&v43, 0x16u);
        }
      }
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void CKMuckingWithPersonas(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (sub_1C4D0D570())
  {
    id v4 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v2, v3);
    xpc_object_t v7 = objc_msgSend_currentPersona(v4, v5, v6);
    id v28 = 0;
    uint64_t v9 = objc_msgSend_copyCurrentPersonaContextWithError_(v7, v8, (uint64_t)&v28);
    id v10 = v28;

    id v11 = (void **)MEMORY[0x1E4F1A548];
    BOOL v12 = (void *)*MEMORY[0x1E4F1A548];
    id v13 = (void *)MEMORY[0x1E4F1A550];
    uint64_t v14 = (os_log_t *)MEMORY[0x1E4F1A500];
    if (v10)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v12);
      }
      uint64_t v15 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v10;
        _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "Error setting aside persona context: %@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v12);
      }
      uint64_t v16 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v9;
        _os_log_debug_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_DEBUG, "Current thread caching context %@", buf, 0xCu);
      }
    }
    v1[2](v1);
    if (v9)
    {
      uint64_t v19 = objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v17, v18);
      char v22 = objc_msgSend_currentPersona(v19, v20, v21);
      id v24 = objc_msgSend_restorePersonaWithSavedPersonaContext_(v22, v23, (uint64_t)v9);

      __int16 v25 = *v11;
      if (v24)
      {
        if (*v13 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v25);
        }
        id v26 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v24;
          _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Error restoring persona context: %@", buf, 0xCu);
        }
      }
      else
      {
        if (*v13 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], v25);
        }
        uint64_t v27 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v9;
          _os_log_debug_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_DEBUG, "Current thread restored context %@", buf, 0xCu);
        }
        id v24 = 0;
      }
    }
    else
    {
      id v24 = v10;
    }
  }
  else
  {
    v1[2](v1);
  }
}

void CKRegisterXPCActivity(const char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = NSString;
  uint64_t v12 = *MEMORY[0x1E4F14170];
  id v32 = a6;
  id v13 = a5;
  id v14 = a2;
  uint64_t v16 = objc_msgSend_stringWithUTF8String_(v11, v15, v12);
  v34[0] = v16;
  uint64_t v18 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v17, a3);
  v35[0] = v18;
  uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v19, *MEMORY[0x1E4F141A8]);
  v34[1] = v20;
  char v22 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v21, a4);
  v35[1] = v22;
  id v24 = objc_msgSend_stringWithUTF8String_(NSString, v23, *MEMORY[0x1E4F142C8]);
  v34[2] = v24;
  id v26 = objc_msgSend_stringWithUTF8String_(NSString, v25, *MEMORY[0x1E4F142D0]);
  v35[2] = v26;
  id v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v35, v34, 3);
  id v30 = objc_msgSend_dictionaryWithDictionary_(v10, v29, (uint64_t)v28);

  if (v13) {
    objc_msgSend_addEntriesFromDictionary_(v30, v31, (uint64_t)v13);
  }
  else {
    objc_msgSend_addEntriesFromDictionary_(v30, v31, MEMORY[0x1E4F1CC08]);
  }

  sub_1C4FC3A20(a1, v14, v30, v32);
}

void sub_1C4FC3A20(const char *a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  uint64_t v15 = objc_msgSend_processType(v12, v13, v14);

  if (v15 == 2)
  {
    uint64_t v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17);
    uint64_t v33 = objc_msgSend_stringWithUTF8String_(NSString, v32, (uint64_t)"void _CKRegisterXPCActivity(const char *, __strong os_activity_t, NSDictionary *__strong, void (^__strong)(void))");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v31, v34, (uint64_t)v33, @"CKDDaemonUtils.m", 583, @"You shouldn't be registering XPC activities in daemons");
  }
  uint64_t v18 = objc_msgSend_currentProcess(CKDDaemonProcess, v16, v17);
  char isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v18, v19, v20);

  if ((isSystemInstalledBinary & 1) == 0)
  {
    uint64_t v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
    unint64_t v37 = objc_msgSend_stringWithUTF8String_(NSString, v36, (uint64_t)"void _CKRegisterXPCActivity(const char *, __strong os_activity_t, NSDictionary *__strong, void (^__strong)(void))");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v35, v38, (uint64_t)v37, @"CKDDaemonUtils.m", 584, @"You shouldn't be registering XPC activities from non-system binaries");
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v24 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = a1;
    __int16 v47 = 2114;
    id v48 = v8;
    _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_INFO, "Registering: %s xpc activity with criteria: %{public}@", buf, 0x16u);
  }
  __int16 v25 = CKCurrentPersonaID();
  id v26 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1C4FC5764;
  handler[3] = &unk_1E64F80F0;
  id v40 = v7;
  id v41 = v8;
  id v43 = v9;
  id v44 = a1;
  id v42 = v25;
  id v27 = v9;
  id v28 = v25;
  id v29 = v8;
  id v30 = v7;
  xpc_activity_register(a1, v26, handler);
}

void CKRegisterRepeatingXPCActivity(const char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v10 = NSString;
  uint64_t v11 = *MEMORY[0x1E4F141C8];
  id v35 = a6;
  id v12 = a5;
  id v13 = a2;
  uint64_t v15 = objc_msgSend_stringWithUTF8String_(v10, v14, v11);
  v37[0] = v15;
  uint64_t v17 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v16, a3);
  v38[0] = v17;
  uint64_t v19 = objc_msgSend_stringWithUTF8String_(NSString, v18, *MEMORY[0x1E4F141A8]);
  v37[1] = v19;
  uint64_t v21 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v20, a4);
  v38[1] = v21;
  uint64_t v23 = objc_msgSend_stringWithUTF8String_(NSString, v22, *MEMORY[0x1E4F142F8]);
  v37[2] = v23;
  v38[2] = MEMORY[0x1E4F1CC38];
  __int16 v25 = objc_msgSend_stringWithUTF8String_(NSString, v24, *MEMORY[0x1E4F142C8]);
  v37[3] = v25;
  id v27 = objc_msgSend_stringWithUTF8String_(NSString, v26, *MEMORY[0x1E4F142D0]);
  v38[3] = v27;
  id v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v38, v37, 4);

  id v32 = objc_msgSend_mutableCopy(v29, v30, v31);
  char v34 = v32;
  if (v12) {
    objc_msgSend_addEntriesFromDictionary_(v32, v33, (uint64_t)v12);
  }
  else {
    objc_msgSend_addEntriesFromDictionary_(v32, v33, MEMORY[0x1E4F1CC08]);
  }

  sub_1C4FC3A20(a1, v13, v34, v35);
}

void CKUnregisterXPCActivity(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v2 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = a1;
    _os_log_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_INFO, "Unregistering: %s xpc activity", (uint8_t *)&v3, 0xCu);
  }
  xpc_activity_unregister(a1);
}

uint64_t CKEncryptWithPublicKey(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  CFErrorRef error = 0;
  id v52 = 0;
  uint64_t v12 = *MEMORY[0x1E4F3B6D8];
  v57[0] = *MEMORY[0x1E4F3B718];
  v57[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3B6F0];
  v58[0] = *MEMORY[0x1E4F3B740];
  v58[1] = v13;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v58, v57, 2);
  CFDictionaryRef v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (a5) {
    *a5 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!v9)
  {
    char v34 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 1000, @"NULL serverPublicKeyObj");
    uint64_t v35 = 0;
    id v24 = 0;
    uint64_t v33 = 0;
    uint64_t v18 = 0;
LABEL_18:
    id v36 = 0;
    id v52 = v34;
    goto LABEL_19;
  }
  uint64_t v18 = objc_msgSend_publicKey(v9, v15, v16);

  if (!v18)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v19, *MEMORY[0x1E4F19DD8], 1000, @"nil publicKey");
    char v34 = LABEL_17:;
    uint64_t v35 = 0;
    id v24 = 0;
    uint64_t v33 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = objc_msgSend_certData(v9, v19, v20);

  if (!v18)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 1000, @"nil certData");
    goto LABEL_17;
  }
  objc_msgSend_publicKey(v9, v21, v22);
  CFDataRef v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  id v24 = SecKeyCreateWithData(v23, v17, &error);

  CFErrorRef v26 = error;
  if (error)
  {
    CFErrorRef error = 0;
    id v52 = v26;
  }
  if (v24)
  {
    CFTypeRef cf = v24;
    uint64_t v18 = objc_opt_new();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v27, (uint64_t)&unk_1F20AC930, *MEMORY[0x1E4F3BB40]);
    id v24 = objc_msgSend_certData(v9, v28, v29);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v30, (uint64_t)v24, *MEMORY[0x1E4F3BB50]);
    if (v11)
    {
      uint64_t v33 = objc_msgSend_dataUsingEncoding_(v11, v31, 4);
      if (!v33)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v32, *MEMORY[0x1E4F19DD8], 1000, @"Could not encode uri %@ to UTF-8", v11);
        id v52 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_42;
      }
      objc_msgSend_setObject_forKeyedSubscript_(v18, v32, (uint64_t)v33, *MEMORY[0x1E4F3BB38]);
    }
    else
    {
      uint64_t v33 = 0;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v38 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v49 = v10;
      uint64_t v39 = v38;
      id v42 = objc_msgSend_publicKey(v9, v40, v41);
      *(_DWORD *)buf = 138412290;
      id v54 = v42;
      _os_log_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_INFO, "server public key: %@", buf, 0xCu);

      id v10 = v49;
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
    }
    id v43 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v24;
      _os_log_impl(&dword_1C4CFF000, v43, OS_LOG_TYPE_INFO, "shared info: %@", buf, 0xCu);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
    }
    id v44 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v54 = v11;
      __int16 v55 = 2112;
      uint64_t v56 = v33;
      _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "additional auth data %@ (%@)", buf, 0x16u);
    }
    EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();
    if (EncryptedDataWithParameters)
    {
      id v36 = EncryptedDataWithParameters;
      if (a4)
      {
        id v36 = EncryptedDataWithParameters;
        *a4 = v36;
      }
      uint64_t v35 = 1;
      goto LABEL_43;
    }
    if (!v52)
    {
      __int16 v47 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v46, *MEMORY[0x1E4F19DD8], 1000, @"SecKeyCreateEncryptedDataWithParameters NULL error");
      id v48 = v52;
      id v52 = v47;
    }
LABEL_42:
    id v36 = 0;
    uint64_t v35 = 0;
LABEL_43:
    CFRelease(cf);
    goto LABEL_19;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v25, *MEMORY[0x1E4F19DD8], 1000, @"CCECCryptorImportPublicKey failed: NULL");
  id v52 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v18 = 0;
  id v36 = 0;
LABEL_19:
  if (a5 && (v35 & 1) == 0) {
    *a5 = v52;
  }

  return v35;
}

void sub_1C4FC4584()
{
  id v0 = (void *)qword_1EBBD0078;
  qword_1EBBD0078 = (uint64_t)&unk_1F20AC348;
}

id sub_1C4FC459C(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v4 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v2, v3);
  id v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], v5, v6);
  id v8 = (void *)IDSCopyIDForPhoneNumber();
  if (objc_msgSend_length(v8, v9, v10))
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = objc_msgSend_characterAtIndex_(v8, v11, v12);
      if (objc_msgSend_characterIsMember_(v4, v14, v13)) {
        objc_msgSend_appendFormat_(v7, v15, @"%C", v13);
      }
      ++v12;
    }
    while (v12 < objc_msgSend_length(v8, v15, v16));
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  CFDictionaryRef v17 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v1;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Performed phone number canonicalization: %@ -> %@ (raw was %@)", buf, 0x20u);
  }

  return v7;
}

id sub_1C4FC4754()
{
  if (qword_1EBBD0090 != -1) {
    dispatch_once(&qword_1EBBD0090, &unk_1F2044810);
  }
  id v0 = (void *)qword_1EBBD0088;
  return v0;
}

void sub_1C4FC47A8()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v2 = objc_msgSend_initWithBase64EncodedString_options_(v0, v1, @"ewogICJhcHBsaW5rcyI6IHsKICAgICJkZXRhaWxzIjogWwogICAgICB7CiAgICAgICAgImFwcElEIjogImNvbS5hcHBsZS5DbG91ZEtpdC5TaGFyZUJlYXIiLAogICAgICAgICJjb21wb25lbnRzIjogWwogICAgICAgICAgICB7ICIvIjogIi9wYWdlcy8/KiIgfSwKICAgICAgICAgICAgeyAiLyI6ICIvbnVtYmVycy8/KiIgfSwKICAgICAgICAgICAgeyAiLyI6ICIva2V5bm90ZS8/KiIgfSwKICAgICAgICAgICAgeyAiLyI6ICIvaWNsb3VkZHJpdmUvPyoiIH0sCiAgICAgICAgICAgIHsgIi8iOiAiL3NoYXJlLz8qIiB9LAogICAgICAgICAgICB7ICIvIjogIi9ub3Rlcy8/KiIgfSwKICAgICAgICAgICAgeyAiLyI6ICIvcGhvdG9zLz8qIiB9LAogICAgICAgICAgICB7ICIvIjogIi9waG90b3Nfc2hhcmluZy8/KiIgfSwKICAgICAgICAgICAgeyAiLyI6ICIvcGhvdG9zX2xpbmtzLz8qIiB9LAogICAgICAgICAgICB7ICIvIjogIi9yZW1pbmRlcnMvdGVtcGxhdGUvKiIsICJleGNsdWRlIjogdHJ1ZSB9LAogICAgICAgICAgICB7ICIvIjogIi9yZW1pbmRlcnMvPyoiIH0sCiAgICAgICAgICAgIHsgIi8iOiAiL3NhZmFyaS10YWItZ3JvdXBzLz8qIiB9LAogICAgICAgICAgICB7ICIvIjogIi9mcmVlZm9ybS9jb3B5LyoiLCAiZXhjbHVkZSI6IHRydWUgfSwKICAgICAgICAgICAgeyAiLyI6ICIvZnJlZWZvcm0vPyoiIH0sCiAgICAgICAgICAgIHsgIi8iOiAiL3YvPyoiIH0KICAgICAgICBdLAogICAgICAgICJhbHdheXNFbmFibGVkIjogdHJ1ZQogICAgICB9CiAgICBdCiAgfQp9Cg==", 1);
  v6[0] = @"*.icloud.com";
  v6[1] = @"*.icloud.com.cn";
  v7[0] = v2;
  v7[1] = v2;
  v6[2] = @"icloud.com";
  v6[3] = @"icloud.com.cn";
  v7[2] = v2;
  v7[3] = v2;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v7, v6, 4);
  uint64_t v5 = (void *)qword_1EBBD0088;
  qword_1EBBD0088 = v4;
}

id CKDescriptionForIdentitySet(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = (const void *)PCSIdentitySetCopyService();
  objc_msgSend_appendFormat_(v2, v4, @"<PCSIdentitySetRef %p service: %@, identities: {\n", a1, v3);
  if (v3) {
    CFRelease(v3);
  }
  id v7 = v2;
  PCSIdentitySetEnumeratePublicKeys();
  objc_msgSend_appendString_(v7, v5, @"}>");

  return v7;
}

uint64_t sub_1C4FC496C(uint64_t a1, const char *a2)
{
  return objc_msgSend_appendFormat_(*(void **)(a1 + 32), a2, @"\t%@\n", a2);
}

id sub_1C4FC499C(void *a1)
{
  id v1 = a1;
  uint64_t v4 = objc_msgSend_containerID(v1, v2, v3);
  id v9 = objc_msgSend_account(v1, v5, v6);
  uint64_t v10 = @"Default";
  if (*MEMORY[0x1E4F1A4E0])
  {
    id v11 = objc_msgSend_deviceContext(v1, v7, v8);
    uint64_t v14 = objc_msgSend_testDeviceReference(v11, v12, v13);

    if (v14) {
      uint64_t v10 = @"UnitTest";
    }
  }
  uint64_t v15 = NSString;
  uint64_t v16 = objc_msgSend_accountID(v9, v7, v8);
  uint64_t v19 = objc_msgSend_containerIdentifier(v4, v17, v18);
  objc_msgSend_environment(v4, v20, v21);
  uint64_t v22 = CKContainerEnvironmentString();
  id v24 = objc_msgSend_stringWithFormat_(v15, v23, @"%@-%@-%@-%@", v16, v19, v22, v10);

  return v24;
}

void CKWarnForIncorrectServiceIdentity(void *a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v8 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    id v49 = v8;
    id v52 = objc_msgSend_ckShortDescription(v6, v50, v51);
    __int16 v55 = objc_msgSend_ckShortDescription(v6, v53, v54);
    *(_DWORD *)buf = 138544386;
    id v57 = v5;
    __int16 v58 = 2114;
    v59 = v52;
    __int16 v60 = 2114;
    id v61 = v7;
    __int16 v62 = 2114;
    uint64_t v63 = v55;
    __int16 v64 = 2114;
    id v65 = v5;
    _os_log_error_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_ERROR, "Decryption failed for PCS using the service name, %{public}@. This likely indicates a CloudKit adopter misconfiguration. An identity exists that can decrypt this data, but the adopter process is not configured to use it. Ensure that the service name for containerID %{public}@ in the com.apple.private.cloudkit.serviceNameForContainerMap entitlement is correctly set. If this entitlement was recently modified, any zones created prior to the change must be deleted. Devices signed into affected test accounts can delete the misconfigured zone using the following command:\n\nckctl -b %{public}@ -v production -x \"container %{public}@ %{public}@\" -x \"zone deleteAll\"\n\nAlternatively, reverting the entitlement to its previous value will allow access to the data.", buf, 0x34u);
  }
  id v11 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v9, v10);
  if (!objc_msgSend_isAppleInternalInstall(v11, v12, v13)) {
    goto LABEL_13;
  }
  uint64_t v16 = objc_msgSend_currentProcess(CKDDaemonProcess, v14, v15);
  BOOL v19 = objc_msgSend_processType(v16, v17, v18) == 2;

  if (!v19)
  {
    if (qword_1EBBD0098 != -1) {
      dispatch_once(&qword_1EBBD0098, &unk_1F2044830);
    }
    id v20 = (id)qword_1EBBD00A0;
    objc_sync_enter(v20);
    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EBBD00A0, v21, (uint64_t)v6);
    objc_msgSend_timeIntervalSinceNow(v22, v23, v24);
    if (v22 && v27 >= -3600.0)
    {

      objc_sync_exit(v20);
      id v11 = v20;
    }
    else
    {
      id v28 = objc_msgSend_distantFuture(MEMORY[0x1E4F1C9C8], v25, v26);
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EBBD00A0, v29, (uint64_t)v28, v6);

      objc_sync_exit(v20);
      id v30 = NSString;
      uint64_t v33 = objc_msgSend_ckShortDescription(v6, v31, v32);
      id v11 = objc_msgSend_stringWithFormat_(v30, v34, @"Unexpected service identity for %@", v33);

      uint64_t v35 = objc_opt_new();
      objc_msgSend_setComponentID_(v35, v36, @"552485");
      objc_msgSend_setTitle_(v35, v37, (uint64_t)v11);
      objc_msgSend_setComponentName_(v35, v38, @"CloudKit");
      objc_msgSend_setComponentVersion_(v35, v39, @"All");
      id v42 = objc_msgSend_sharedManager(MEMORY[0x1E4F1A450], v40, v41);
      objc_msgSend_triggerTapToRadarWithRequest_(v42, v43, (uint64_t)v35);

      id v44 = (id)qword_1EBBD00A0;
      objc_sync_enter(v44);
      __int16 v47 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v45, v46);
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1EBBD00A0, v48, (uint64_t)v47, v6);

      objc_sync_exit(v44);
    }
LABEL_13:
  }
}

void sub_1C4FC4E24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FC4E48()
{
  qword_1EBBD00A0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FC4E84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (ba_is_process_extension())
  {
    id v5 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, 1);
    objc_msgSend_setObject_forKeyedSubscript_(v7, v6, (uint64_t)v5, *MEMORY[0x1E4F1A5E0]);
  }
}

id sub_1C4FC4F08(void *a1)
{
  return objc_getAssociatedObject(a1, "CKRecordZonePCS");
}

void sub_1C4FC4F14(void *a1, uint64_t a2, void *a3)
{
}

id sub_1C4FC4F24(void *a1)
{
  return objc_getAssociatedObject(a1, "CKZoneishPCS");
}

void sub_1C4FC4F30(void *a1, uint64_t a2, void *a3)
{
}

void sub_1C4FC4F40(void *a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_zonePCS(a1, a2, a3))
  {
    uint64_t v6 = objc_msgSend_zonePCS(a1, v4, v5);
    uint64_t v8 = objc_msgSend_publicKeyIDFromIdentity_(CKDPCSManager, v7, v6);
    objc_msgSend_setPcsKeyID_(a1, v9, (uint64_t)v8);
  }
  if (objc_msgSend_zoneishPCS(a1, v4, v5))
  {
    uint64_t v12 = objc_msgSend_zoneishPCS(a1, v10, v11);
    objc_msgSend_protectionIdentifierFromShareProtection_(CKDPCSManager, v13, v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishKeyID_(a1, v14, (uint64_t)v15);
  }
}

id sub_1C4FC500C(void *a1)
{
  return objc_getAssociatedObject(a1, "CKRecordPCS");
}

void sub_1C4FC5018(void *a1, uint64_t a2, void *a3)
{
  objc_setAssociatedObject(a1, "CKRecordPCS", a3, (void *)0x301);
  id v7 = objc_msgSend_zoneishKeyID(a1, v5, v6);

  if (a3 && v7)
  {
    objc_msgSend_protectionIdentifierFromShareProtection_(CKDPCSManager, v8, (uint64_t)a3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishKeyID_(a1, v9, (uint64_t)v10);
  }
}

void sub_1C4FC50C4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_zoneishKeyID(a1, a2, a3);
  if (v5)
  {
  }
  else if (objc_msgSend_recordPCS(a1, v6, v7))
  {
    BOOL v19 = objc_msgSend_pcsKeyID(a1, v8, v9);

    uint64_t v23 = objc_msgSend_recordPCS(a1, v20, v21);
    if (v19)
    {
      objc_msgSend_allProtectionIdentifiersFromShareProtection_(CKDPCSManager, v22, v23);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v44, v48, 16);
      if (v26)
      {
        uint64_t v29 = v26;
        uint64_t v30 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v24);
            }
            uint64_t v32 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v33 = objc_msgSend_pcsKeyID(a1, v27, v28);
            LOBYTE(v32) = objc_msgSend_isEqualToData_(v32, v34, (uint64_t)v33);

            if (v32)
            {
              unint64_t v37 = v24;
              goto LABEL_18;
            }
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v44, v48, 16);
          if (v29) {
            continue;
          }
          break;
        }
      }

      unint64_t v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36);
      id v40 = objc_msgSend_recordID(a1, v38, v39);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v41, (uint64_t)a2, a1, @"CKDDaemonUtils.m", 1021, @"Generated PCS key ID not found in PCS for record %@", v40);

LABEL_18:
    }
    else
    {
      id v42 = objc_msgSend_protectionIdentifierFromShareProtection_(CKDPCSManager, v22, v23);
      objc_msgSend_setPcsKeyID_(a1, v43, (uint64_t)v42);
    }
  }
  if (objc_msgSend_recordPCS(a1, v8, v9))
  {
    uint64_t v12 = objc_msgSend_recordPCS(a1, v10, v11);
    uint64_t v14 = objc_msgSend_allProtectionIdentifiersFromShareProtection_(CKDPCSManager, v13, v12);
    CFDictionaryRef v17 = objc_msgSend_copy(v14, v15, v16);
    objc_msgSend_setAllPCSKeyIDs_(a1, v18, (uint64_t)v17);
  }
}

id sub_1C4FC530C(void *a1)
{
  return objc_getAssociatedObject(a1, "PrivatePCS");
}

void sub_1C4FC5318(void *a1, uint64_t a2, void *a3)
{
}

id sub_1C4FC5328(void *a1)
{
  return objc_getAssociatedObject(a1, "PublicPCS");
}

void sub_1C4FC5334(void *a1, uint64_t a2, void *a3)
{
}

id sub_1C4FC5344(void *a1)
{
  return objc_getAssociatedObject(a1, "PerParticipantPCS");
}

void sub_1C4FC5350(void *a1, uint64_t a2, void *a3)
{
}

void sub_1C4FC5360(void *a1, uint64_t a2, void *a3, int a4)
{
  id v38 = a3;
  uint64_t v8 = objc_msgSend_pcs(v38, v6, v7);
  objc_msgSend_setPrivatePCS_(a1, v9, v8);
  uint64_t v14 = objc_msgSend_etag(v38, v10, v11);
  if (!a4) {
    goto LABEL_6;
  }
  id v15 = objc_msgSend_previousProtectionEtag(a1, v12, v13);

  if (!v15) {
    goto LABEL_6;
  }
  CFDictionaryRef v17 = objc_msgSend_previousProtectionEtag(a1, v12, v16);

  if (!objc_msgSend_isEqualToString_(v17, v18, @"NO_ETAG_FOR_YOU"))
  {
    uint64_t v14 = v17;
LABEL_6:
    objc_msgSend_setPreviousProtectionEtag_(a1, v12, (uint64_t)v14);
    goto LABEL_7;
  }

  uint64_t v14 = 0;
  objc_msgSend_setPreviousProtectionEtag_(a1, v19, 0);
LABEL_7:
  uint64_t v22 = objc_msgSend_publicPCS(v38, v20, v21);
  objc_msgSend_setPublicPCS_(a1, v23, v22);
  uint64_t v28 = objc_msgSend_publicPCSEtag(v38, v24, v25);
  if (a4)
  {
    uint64_t v29 = objc_msgSend_previousPublicProtectionEtag(a1, v26, v27);

    if (v29)
    {
      uint64_t v31 = objc_msgSend_previousPublicProtectionEtag(a1, v26, v30);

      if (objc_msgSend_isEqualToString_(v31, v32, @"NO_ETAG_FOR_YOU"))
      {

        uint64_t v28 = 0;
        objc_msgSend_setPreviousPublicProtectionEtag_(a1, v33, 0);
        goto LABEL_13;
      }
      uint64_t v28 = v31;
    }
  }
  objc_msgSend_setPreviousPublicProtectionEtag_(a1, v26, (uint64_t)v28);
LABEL_13:
  uint64_t v36 = objc_msgSend_myParticipantPCS(v38, v34, v35);
  objc_msgSend_setMyParticipantPCS_(a1, v37, v36);
}

uint64_t sub_1C4FC54D0(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setSharePCSData_isUnitTestAccount_(a1, a2, a3, 0);
}

id sub_1C4FC54D8(void *a1)
{
  return objc_getAssociatedObject(a1, "PublicPCS");
}

void sub_1C4FC54E4(void *a1, uint64_t a2, void *a3)
{
}

void sub_1C4FC5764(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1C8789E70]();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  xpc_activity_state_t v5 = xpc_activity_get_state(v3);
  if (v5 == 2)
  {
    id v10 = (void *)MEMORY[0x1E4F1A550];
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = v14;
      _os_log_debug_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_DEBUG, "%s xpc activity state: run.", buf, 0xCu);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1C4FC5A9C;
    v17[3] = &unk_1E64F0E18;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    CKMuckingWithPersonas(v17);
    if (!xpc_activity_set_state(v3, 5))
    {
      if (*v10 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v13 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Couldn't set activity state to DONE", buf, 2u);
      }
    }

    uint64_t v6 = v18;
    goto LABEL_21;
  }
  if (!v5)
  {
    uint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (!v7 || !xpc_equal(v7, v6)) {
      xpc_activity_set_criteria(v3, v6);
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 64);
      xpc_object_t v16 = xpc_activity_copy_criteria(v3);
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      xpc_object_t v24 = v16;
      _os_log_debug_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_DEBUG, "%s xpc activity state: check in. criteria: %@", buf, 0x16u);
    }
LABEL_21:
  }
  os_activity_scope_leave(&state);
}

void sub_1C4FC5A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t sub_1C4FC5A9C(uint64_t a1)
{
  uint64_t result = CKAdoptPersonaID(*(void **)(a1 + 32));
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

BOOL CKDPRecordFieldReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  xpc_activity_state_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    xpc_object_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        id v18 = objc_alloc_init(CKDPFieldAction);
        objc_msgSend_addAction_(a1, v19, (uint64_t)v18);
        if (!PBReaderPlaceMark() || !sub_1C4F3EDB4((id *)&v18->super.super.isa, a2))
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        id v18 = objc_alloc_init(CKDPRecordFieldIdentifier);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark() || (CKDPRecordFieldIdentifierReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    id v18 = objc_alloc_init(CKDPRecordFieldValue);
    objc_storeStrong(a1 + 3, v18);
    if (!PBReaderPlaceMark() || (CKDPRecordFieldValueReadFrom((uint64_t)v18, a2) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1C4FC6CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  xpc_activity_state_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    xpc_object_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else if (v17 == 2)
      {
        uint64_t v26 = PBReaderReadData();
        uint64_t v27 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v26;
      }
      else if (v17 == 1)
      {
        id v18 = objc_alloc_init(CKDPRecord);
        objc_msgSend_addRecord_((void *)a1, v19, (uint64_t)v18);
        if (!PBReaderPlaceMark() || (CKDPRecordReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t sub_1C4FCAE4C()
{
  qword_1EBBD00A8 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FCBC84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FCBD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C4FCC0E0(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    if (a2 > 2) {
      char v8 = @"Unknown";
    }
    else {
      char v8 = off_1E64F8228[a2];
    }
    *(_DWORD *)uint64_t v11 = 138543618;
    *(void *)&v11[4] = v8;
    *(_WORD *)&v11[12] = 2112;
    *(void *)&v11[14] = v5;
    unsigned int v9 = v6;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Renew result was %{public}@. error=%@", v11, 0x16u);
  }
  if (a2 == 2)
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 2011, v5, @"Failed to renew account credential", *(_OWORD *)v11, *(void *)&v11[16], v12);
  }
  else
  {
    if (a2 != 1)
    {
      unint64_t v10 = 0;
      goto LABEL_14;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v7, *MEMORY[0x1E4F19DD8], 2011, v5, @"User rejected a prompt to enter their iCloud account password", *(_OWORD *)v11, *(void *)&v11[16], v12);
  unint64_t v10 = };
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1C4FCC4DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  xpc_object_t v7 = *MEMORY[0x1E4F1A500];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      goto LABEL_5;
    }
LABEL_8:
    unint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v8, *MEMORY[0x1E4F4ED98]);
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4FCC6A0;
    v14[3] = &unk_1E64F8118;
    id v15 = *(id *)(a1 + 48);
    objc_msgSend_validateVettingToken_forAltDSID_completion_(v11, v13, v12, v10, v14);

    goto LABEL_9;
  }
  *(_DWORD *)buf = 138412546;
  id v17 = v6;
  __int16 v18 = 2112;
  id v19 = v5;
  _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Got vetting auth completion, error: %@, results: %@", buf, 0x16u);
  if (!v6) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
LABEL_9:
}

uint64_t sub_1C4FCC6A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1C4FCCD08(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v2 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_DEBUG, "Registering device count refresh activity", buf, 2u);
  }
  os_activity_t v3 = _os_activity_create(&dword_1C4CFF000, "refreshDeviceCount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  uint64_t v4 = *MEMORY[0x1E4F141E8];
  uint64_t v5 = *MEMORY[0x1E4F14238];
  xpc_object_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v6, *MEMORY[0x1E4F142F0]);
  BOOL v14 = v7;
  uint64_t v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v8, *MEMORY[0x1E4F14210]);
  v15[0] = v9;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v15, &v14, 1);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4FCCF0C;
  v12[3] = &unk_1E64F1B50;
  v12[4] = *(void *)(a1 + 32);
  CKRegisterRepeatingXPCActivity("com.apple.cloudkit.refresh-device-count", v3, v4, v5, v11, v12);
}

void sub_1C4FCCF0C(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v2 = (os_log_t *)MEMORY[0x1E4F1A500];
  os_activity_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_INFO, "Refreshing device counts", buf, 2u);
  }
  uint64_t v4 = dispatch_group_create();
  xpc_object_t v7 = objc_msgSend_sharedAccountStore(CKDAccountStore, v5, v6);
  unint64_t v10 = objc_msgSend_accountStore(v7, v8, v9);

  id v45 = 0;
  uint64_t v12 = objc_msgSend_aa_appleAccountsWithError_(v10, v11, (uint64_t)&v45);
  id v13 = v45;
  BOOL v14 = v13;
  id v15 = &unk_1C5080000;
  if (v12)
  {
    id v33 = v13;
    char v34 = v12;
    uint64_t v35 = v10;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v16 = v12;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v41, v46, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v16);
          }
          unint64_t v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          char v25 = objc_msgSend_aa_cloudKitAccount(v24, v19, v20, v33, v34, v35);

          if (v25)
          {
            dispatch_group_enter(v4);
            uint64_t v26 = *(void **)(a1 + 32);
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = sub_1C4FCD310;
            v39[3] = &unk_1E64F8168;
            id v40 = v4;
            objc_msgSend_deviceCountForAccount_ignoreCache_completionHandler_(v26, v27, (uint64_t)v24, 0, v39);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v41, v46, 16);
      }
      while (v21);
    }

    uint64_t v12 = v34;
    unint64_t v10 = v35;
    v2 = (os_log_t *)MEMORY[0x1E4F1A500];
    id v1 = (void *)MEMORY[0x1E4F1A550];
    BOOL v14 = v33;
    id v15 = (void *)&unk_1C5080000;
  }
  else
  {
    if (*v1 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v28 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_ERROR, "Error getting accounts to refresh device count: %@", buf, 0xCu);
    }
  }
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
  uint64_t v30 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = v15[126];
  block[2] = sub_1C4FCD318;
  block[3] = &unk_1E64F05C8;
  uint64_t v31 = v29;
  id v38 = v31;
  dispatch_group_notify(v4, v30, block);

  dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
  if (*v1 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v32 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, "Finished refreshing device counts", buf, 2u);
  }
}

void sub_1C4FCD310(uint64_t a1)
{
}

intptr_t sub_1C4FCD318(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1C4FCD374()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cloudkit.device-count", v2);
  id v1 = (void *)qword_1EBBD00B8;
  qword_1EBBD00B8 = (uint64_t)v0;
}

void sub_1C4FCD4FC(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_activity_t v3 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = *(void *)(a1 + 32);
    LODWORD(v51) = 138412290;
    *(void *)((char *)&v51 + 4) = v37;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "Getting device count for account %@", (uint8_t *)&v51, 0xCu);
  }
  *(void *)&long long v51 = 0;
  *((void *)&v51 + 1) = &v51;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  if (*(unsigned char *)(a1 + 64)) {
    goto LABEL_6;
  }
  uint64_t v18 = objc_msgSend_creationDate(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_timeIntervalSinceNow(v18, v19, v20);
  BOOL v22 = v21 > -86400.0;

  if (v22)
  {
    if (*v2 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v23 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Returning unknown device count for newly signed-in account", buf, 2u);
    }
    *(void *)(*((void *)&v51 + 1) + 24) = 0;
LABEL_13:
    id v17 = CKGetGlobalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FCD930;
    block[3] = &unk_1E64F07E0;
    id v16 = (id *)v46;
    v46[0] = *(id *)(a1 + 40);
    v46[1] = &v51;
    dispatch_async(v17, block);
    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    unint64_t v24 = objc_msgSend_ck_cloudKitAccount(*(void **)(a1 + 32), v5, v6);
    char v25 = v24;
    if (v24)
    {
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v24, v5, @"deviceCount");
      uint64_t v29 = objc_msgSend_integerValue(v26, v27, v28);
      *(void *)(*((void *)&v51 + 1) + 24) = v29;

      uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v25, v30, @"deviceCountFetchDate");
      char v34 = v31;
      if (v31)
      {
        objc_msgSend_timeIntervalSinceNow(v31, v32, v33);
        if (v35 < 0.0 && v35 > -86400.0)
        {
          if (*v2 != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v36 = *v3;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = *(void *)(*((void *)&v51 + 1) + 24);
            *(_DWORD *)buf = 134218242;
            uint64_t v48 = v38;
            __int16 v49 = 2114;
            uint64_t v50 = v34;
            _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Using cached device count %ld from last fetch date %{public}@", buf, 0x16u);
          }

          goto LABEL_13;
        }
      }
    }
  }
LABEL_6:
  xpc_object_t v7 = objc_msgSend_deviceCountQueue(*(void **)(a1 + 56), v5, v6);
  dispatch_suspend(v7);

  char v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 32);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1C4FCD954;
  v39[3] = &unk_1E64F81B8;
  long long v42 = &v51;
  id v10 = v9;
  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v40 = v10;
  uint64_t v43 = v11;
  id v13 = v12;
  uint64_t v14 = *(void *)(a1 + 56);
  long long v41 = v13;
  uint64_t v44 = v14;
  objc_msgSend_fetchDeviceCountForAccount_completionHandler_(v8, v15, (uint64_t)v10, v39);
  id v16 = &v40;
  id v17 = v41;
LABEL_14:

  _Block_object_dispose(&v51, 8);
}

void sub_1C4FCD904(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FCD930(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1, 0);
}

void sub_1C4FCD954(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v9 = objc_msgSend_ck_cloudKitAccount(*(void **)(a1 + 32), v6, v7);
  if (v9)
  {
    id v10 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v8, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    objc_msgSend_setObject_forKeyedSubscript_(v9, v11, (uint64_t)v10, @"deviceCount");

    uint64_t v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v12, v13);
    objc_msgSend_setObject_forKeyedSubscript_(v9, v15, (uint64_t)v14, @"deviceCountFetchDate");

    uint64_t v18 = objc_msgSend_accountStore(v9, v16, v17);
    id v35 = 0;
    char v20 = objc_msgSend_saveVerifiedAccount_error_(v18, v19, (uint64_t)v9, &v35);
    id v21 = v35;

    BOOL v22 = (void *)*MEMORY[0x1E4F1A548];
    if (v20)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v22);
      }
      uint64_t v23 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_DEBUG, "Saved device count", buf, 2u);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v22);
      }
      unint64_t v24 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v21;
        _os_log_error_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_ERROR, "Error saving device count: %@", buf, 0xCu);
      }
    }
  }
  char v25 = CKGetGlobalQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FCDC00;
  block[3] = &unk_1E64F8190;
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 48);
  id v31 = v5;
  id v32 = v26;
  uint64_t v28 = *(void *)(a1 + 64);
  uint64_t v33 = v27;
  uint64_t v34 = v28;
  id v29 = v5;
  dispatch_async(v25, block);
}

void sub_1C4FCDC00(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = objc_msgSend_deviceCountQueue(*(void **)(a1 + 56), v2, v3);
  dispatch_resume(v4);
}

void sub_1C4FCDDE8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v10 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v9;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Error fetching device list: %@", (uint8_t *)&v25, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 1000, v9, @"Failed to fetch device list");
    id v19 = LABEL_18:;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v20 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = v20;
      uint64_t v23 = (objc_class *)objc_opt_class();
      unint64_t v24 = NSStringFromClass(v23);
      int v25 = 138543362;
      uint64_t v26 = (uint64_t)v24;
      _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Wrong response type %{public}@ when fetching devices", (uint8_t *)&v25, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 1000, 0, @"Bad response from AppleAccount");
    goto LABEL_18;
  }
  uint64_t v14 = objc_msgSend_devices(v8, v12, v13);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v18 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134217984;
    uint64_t v26 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "Fetched device list with %ld devices", (uint8_t *)&v25, 0xCu);
  }
  id v19 = 0;
LABEL_19:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1C4FCE230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F19F20]);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPRecordIdentifierReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

void sub_1C4FCED08(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v6 = objc_msgSend_deviceContext(v2, v4, v5);
  objc_msgSend_logicalDeviceScopedClientProxyForDeviceContext_(v3, v7, (uint64_t)v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_hasBeenThrottled(v13, v8, v9))
  {
    objc_msgSend_resetThrottles(v13, v10, v11);
    objc_msgSend_setHasBeenThrottled_(v13, v12, 0);
  }
}

uint64_t sub_1C4FD0648()
{
  dispatch_queue_t v0 = [CKDURLSessionPool alloc];
  qword_1EBBD00C8 = objc_msgSend_initInternal(v0, v1, v2);
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FD0FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4FD101C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v10 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_23;
  }
  if (*MEMORY[0x1E4F1A4E0]
    && objc_msgSend_checkAndClearUnitTestOverrides_(WeakRetained, v8, @"FakePCSDecryptionFailure"))
  {
    uint64_t v11 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 5004, 0, @"TEST PCS decrypt failure");

    id v6 = (id)v11;
  }
  objc_msgSend_noteOperationDidFinishWaitingOnPCS(v10, v8, v9);
  objc_msgSend_setError_(v10, v12, (uint64_t)v6);
  if (!v6)
  {
    uint64_t v15 = objc_msgSend_pcs(v5, v13, v14);
    uint64_t v18 = objc_msgSend_zone(v10, v16, v17);
    objc_msgSend_setZonePCS_(v18, v19, v15);

    objc_msgSend_zone(v10, v20, v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = objc_msgSend_zoneishProtectionData(v22, v23, v24);
    if (!v25)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v28 = (void *)v25;
    uint64_t v29 = objc_msgSend_pcs(v5, v26, v27);

    if (v29)
    {
      uint64_t v30 = objc_msgSend_container(v10, v13, v14);
      uint64_t v33 = objc_msgSend_pcsManager(v30, v31, v32);
      uint64_t v36 = objc_msgSend_zone(v10, v34, v35);
      uint64_t v39 = objc_msgSend_zoneishProtectionData(v36, v37, v38);
      uint64_t v42 = objc_msgSend_pcs(v5, v40, v41);
      id v58 = 0;
      uint64_t v44 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v33, v43, (uint64_t)v39, 1, v42, &v58);
      id v22 = v58;

      long long v47 = objc_msgSend_zone(v10, v45, v46);
      objc_msgSend_setZoneishPCS_(v47, v48, (uint64_t)v44);

      if (v44) {
        CFRelease(v44);
      }
      if (v22)
      {
        objc_msgSend_setError_(v10, v49, (uint64_t)v22);
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v50 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v60 = v22;
          _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Failed to decode zoneishPCS data: %@", buf, 0xCu);
        }
      }
      goto LABEL_15;
    }
  }
LABEL_16:
  long long v51 = objc_msgSend_error(v10, v13, v14);

  if (!v51)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v54 = *MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v54, OS_LOG_TYPE_DEBUG, "PCS successfully decrypted, updating cache.", buf, 2u);
    }
    objc_msgSend_updatePCSCache(v10, v55, v56);
  }
  id v57 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v52, v53);
  dispatch_group_leave(v57);

LABEL_23:
}

void sub_1C4FD1690(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v5 = objc_msgSend_zoneKeysRemoved(v11, v3, v4);
  objc_msgSend_setZoneKeysRemoved_(v11, v6, *(void *)(a1 + 32) + v5);
  uint64_t v9 = objc_msgSend_zoneishKeysRemoved(v11, v7, v8);
  objc_msgSend_setZoneishKeysRemoved_(v11, v10, *(void *)(a1 + 40) + v9);
}

void sub_1C4FD1900(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4FD19D4;
  v5[3] = &unk_1E64F8290;
  objc_copyWeak(&v6, &location);
  objc_msgSend_setSaveCompletionBlock_(v3, v4, (uint64_t)v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_1C4FD19B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C4FD19D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    if (*MEMORY[0x1E4F1A4E0]
      && objc_msgSend_checkAndClearUnitTestOverrides_(WeakRetained, v11, @"FakeZoneSaveFailure"))
    {
      uint64_t v14 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 2000, 0, @"TEST Save Zone failure");

      id v9 = (id)v14;
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v16 = *MEMORY[0x1E4F1A550];
    if (v8 && !v9)
    {
      if (v16 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v15);
      }
      uint64_t v17 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = v17;
        uint64_t v27 = objc_msgSend_zoneID(v8, v25, v26);
        int v28 = 138412290;
        id v29 = v27;
        _os_log_debug_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEBUG, "Saved PCS changes to the server for zone %@", (uint8_t *)&v28, 0xCu);
      }
      objc_msgSend_setZone_(v12, v18, (uint64_t)v8);
      id v9 = 0;
      goto LABEL_18;
    }
    if (v16 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v15);
    }
    uint64_t v21 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412546;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "Failed to save PCS changes to the server for zone %@: %@", (uint8_t *)&v28, 0x16u);
      if (v9) {
        goto LABEL_17;
      }
    }
    else if (v9)
    {
LABEL_17:
      objc_msgSend_setError_(v12, v22, (uint64_t)v9);
LABEL_18:
      uint64_t v23 = objc_msgSend_stateTransitionGroup(v12, v19, v20);
      dispatch_group_leave(v23);

      goto LABEL_19;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 5002, 0, @"Failed to save updated PCS to the server");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_19:
}

BOOL sub_1C4FD21F0(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      if ((v10 >> 3) == 2)
      {
        uint64_t v17 = objc_alloc_init(CKDPAsset);
        objc_msgSend_addSections_(a1, v18, (uint64_t)v17);
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        uint64_t v17 = objc_alloc_init(CKDPAsset);
        objc_storeStrong(a1 + 1, v17);
      }
      if (!PBReaderPlaceMark() || (CKDPAssetReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1C4FD2BD0(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = objc_alloc_init(CKDPRequestedFields);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || !CKDPRequestedFieldsReadFrom(v23, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        *(unsigned char *)(a1 + 16) = v19 != 0;
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

void sub_1C4FD3268()
{
  dispatch_queue_t v0 = (void *)qword_1EBBCDF08;
  qword_1EBBCDF08 = (uint64_t)&unk_1F20AC370;
}

uint64_t sub_1C4FD38F4(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v17;

        goto LABEL_88;
      case 2u:
        uint64_t v20 = (CKDPRequestedFields *)objc_alloc_init(MEMORY[0x1E4F19F30]);
        objc_storeStrong((id *)(a1 + 40), v20);
        if (!PBReaderPlaceMark() || (CKDPRecordZoneIdentifierReadFrom() & 1) == 0) {
          goto LABEL_90;
        }
        goto LABEL_44;
      case 3u:
        uint64_t v20 = objc_alloc_init(CKDPRequestedFields);
        objc_storeStrong((id *)(a1 + 24), v20);
        if (!PBReaderPlaceMark() || !CKDPRequestedFieldsReadFrom(v20, a2)) {
          goto LABEL_90;
        }
        goto LABEL_44;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_69:
        uint64_t v50 = 16;
        goto LABEL_74;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_73:
        uint64_t v50 = 20;
LABEL_74:
        *(_DWORD *)(a1 + v50) = v23;
        goto LABEL_88;
      case 6u:
        uint64_t v20 = objc_alloc_init(CKDPAssetsToDownload);
        objc_storeStrong((id *)(a1 + 8), v20);
        if PBReaderPlaceMark() && (sub_1C4FD2BD0((uint64_t)v20, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_88:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_90:

        return 0;
      case 7u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(unsigned char *)(a1 + 52) |= 0x10u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                uint64_t v34 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_78:
        BOOL v51 = v34 != 0;
        uint64_t v52 = 50;
        goto LABEL_87;
      case 8u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(unsigned char *)(a1 + 52) |= 4u;
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
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v40 = 0;
                goto LABEL_82;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_82:
        BOOL v51 = v40 != 0;
        uint64_t v52 = 48;
        goto LABEL_87;
      case 9u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(unsigned char *)(a1 + 52) |= 8u;
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
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v14 = v45++ >= 9;
              if (v14)
              {
                uint64_t v46 = 0;
                goto LABEL_86;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v46 = 0;
        }
LABEL_86:
        BOOL v51 = v46 != 0;
        uint64_t v52 = 49;
LABEL_87:
        *(unsigned char *)(a1 + v52) = v51;
        goto LABEL_88;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_88;
    }
  }
}

uint64_t sub_1C4FD4BE8(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_valueID(a2, (const char *)a2, a3);
}

id sub_1C4FD4CA8(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = objc_msgSend_valueID(a2, (const char *)a2, a3);
  id v6 = objc_msgSend_recordID(v3, v4, v5);
  unsigned int v9 = objc_msgSend_zoneID(v6, v7, v8);

  return v9;
}

BOOL sub_1C4FD66A0(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(CKDPMergeableDelta);
        objc_msgSend_addDeltas_(a1, v18, (uint64_t)v17);
        if (!PBReaderPlaceMark() || (CKDPMergeableDeltaReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadData();
    uint64_t v17 = (CKDPMergeableDelta *)a1[1];
    a1[1] = v19;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1C4FD75F0(uint64_t a1, const char *a2)
{
  return objc_msgSend__locked_callbackForRecordZone_zoneID_error_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_1C4FD98F0(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v5 = objc_msgSend_zoneKeysRemoved(v11, v3, v4);
  objc_msgSend_setZoneKeysRemoved_(v11, v6, *(void *)(a1 + 32) + v5);
  uint64_t v9 = objc_msgSend_zoneishKeysRemoved(v11, v7, v8);
  objc_msgSend_setZoneishKeysRemoved_(v11, v10, *(void *)(a1 + 40) + v9);
}

void sub_1C4FD9960(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = objc_msgSend_keyRollsSkippedBySizeCheck(v6, v2, v3);
  objc_msgSend_setKeyRollsSkippedBySizeCheck_(v6, v5, v4 + 1);
}

void sub_1C4FD99A8(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = objc_msgSend_zoneKeysRolled(v6, v2, v3);
  objc_msgSend_setZoneKeysRolled_(v6, v5, v4 + 1);
}

uint64_t sub_1C4FD9C68(uint64_t a1, const char *a2)
{
  return objc_msgSend__locked_callbackForRecordZone_zoneID_error_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_1C4FD9E94(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  objc_initWeak(&from, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4FDA024;
  v9[3] = &unk_1E64F8290;
  objc_copyWeak(&v10, &from);
  objc_msgSend_setSaveCompletionBlock_(v3, v4, (uint64_t)v9);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4FDA09C;
  v6[3] = &unk_1E64F0170;
  objc_copyWeak(&v7, &from);
  objc_copyWeak(&v8, &location);
  objc_msgSend_setCompletionBlock_(v3, v5, (uint64_t)v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_1C4FD9FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 64));
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1C4FDA024(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend__handleRecordZoneSaved_error_(WeakRetained, v8, (uint64_t)v7, v6);
}

void sub_1C4FDA09C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = objc_msgSend_error(WeakRetained, v2, v3);

  if (!v4)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    id v10 = objc_msgSend_error(v7, v8, v9);
    objc_msgSend_setError_(WeakRetained, v11, (uint64_t)v10);
  }
  unint64_t v12 = objc_msgSend_stateTransitionGroup(WeakRetained, v5, v6);
  dispatch_group_leave(v12);
}

void sub_1C4FDA488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
}

uint64_t sub_1C4FDA4E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C4FDA4F4(uint64_t a1)
{
}

void sub_1C4FDA4FC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = objc_msgSend_zoneID(a2, (const char *)a2, a3);
  objc_msgSend_addObject_(v4, v6, (uint64_t)v5);

  if (!--*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend_fetchZonesFromServer_(*(void **)(a1 + 32), v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v10 = objc_msgSend_stateTransitionGroup(WeakRetained, v8, v9);
    dispatch_group_leave(v10);
  }
}

void sub_1C4FDAB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4FDAB40(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "Failed to remove anonymous share. error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_msgSend_stateTransitionGroup(WeakRetained, v6, v7);
  dispatch_group_leave(v8);
}

uint64_t sub_1C4FDAC54(uint64_t a1, const char *a2)
{
  return objc_msgSend__locked_callbackForRecordZone_zoneID_error_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void sub_1C4FDB138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location,char a38)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);
  _Block_object_dispose((const void *)(v39 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1C4FDB190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend_noteOperationDidFinishWaitingOnPCS(WeakRetained, v8, v9);

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v12 = objc_msgSend_zoneishProtectionData(*(void **)(a1 + 32), v10, v11);
    if (v12 && (int v15 = (void *)v12, v16 = objc_msgSend_pcs(v5, v13, v14), v15, v16))
    {
      unsigned int v18 = objc_msgSend_container(*(void **)(a1 + 40), v13, v17);
      char v21 = objc_msgSend_pcsManager(v18, v19, v20);
      uint64_t v24 = objc_msgSend_zoneishProtectionData(*(void **)(a1 + 32), v22, v23);
      uint64_t v27 = objc_msgSend_pcs(v5, v25, v26);
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v28 + 40);
      unint64_t v30 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v21, v29, (uint64_t)v24, 1, v27, &obj);
      objc_storeStrong((id *)(v28 + 40), obj);

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        char v32 = *MEMORY[0x1E4F1A528];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = v36;
          _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Couldn't decode zoneishPCS data: %@", buf, 0xCu);
        }
      }
      objc_msgSend_setZoneishPCS_(v5, v31, (uint64_t)v30);
      if (v30) {
        CFRelease(v30);
      }
    }
    else
    {
      objc_msgSend_setZoneishPCS_(v5, v13, 0);
    }
  }
  uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v5;
  id v35 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1C4FDB3DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v7 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = v7;
      uint64_t v12 = objc_msgSend_zoneID(v8, v10, v11);
      int v13 = 138412546;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Warn: Failed to decrypt zone %@ with Reminders identity: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1C4FDB518(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_pcs(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2, a3);
  uint64_t v9 = objc_msgSend_zoneishPCS(*(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5, v6);
  if (*MEMORY[0x1E4F1A4E0])
  {
    id v10 = objc_msgSend_unitTestOverrides(*(void **)(a1 + 32), v7, v8);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"FailZonePCSDecryptionOnZoneFetch");

    if (v12)
    {
      int v13 = objc_msgSend_dataUsingEncoding_(@"EncryptionBreaker", v7, 4);
      objc_msgSend_setProtectionData_(*(void **)(a1 + 40), v14, (uint64_t)v13);

      uint64_t v16 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v15, *MEMORY[0x1E4F19DD8], 5004, @"Couldn't decode zone PCS data");
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      unsigned int v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v9 = 0;
      uint64_t v4 = 0;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = (void *)*MEMORY[0x1E4F1A528];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
    {
      unsigned int v45 = *(void **)(a1 + 40);
      uint64_t v46 = v19;
      char v49 = objc_msgSend_zoneID(v45, v47, v48);
      uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = v49;
      __int16 v54 = 2112;
      uint64_t v55 = v50;
      _os_log_error_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_ERROR, "Error handling zone PCS for zone %@: %@", buf, 0x16u);
    }
    unsigned int v22 = *(void **)(a1 + 32);
    uint64_t v23 = objc_msgSend_zoneID(*(void **)(a1 + 40), v20, v21);
    objc_msgSend_setPCSData_forFetchedZoneID_(v22, v24, 0, v23);
  }
  else
  {
    objc_msgSend_setZonePCS_(*(void **)(a1 + 40), v7, v4);
    objc_msgSend_setZoneishPCS_(*(void **)(a1 + 40), v32, v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    uint64_t v33 = *(void **)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v35 + 40);
    int v37 = objc_msgSend__locked_checkAndUpdateZonePCSIfNeededForZone_error_(v33, v36, v34, &obj);
    objc_storeStrong((id *)(v35 + 40), obj);
    uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v37)
    {
      if (!v38)
      {
        uint64_t v39 = *(void *)(a1 + 40);
        uint64_t v40 = objc_msgSend_zonesToSaveForPCSUpdateByZoneID(*(void **)(a1 + 32), v25, v26);
        char v43 = objc_msgSend_zoneID(*(void **)(a1 + 40), v41, v42);
        objc_msgSend_setObject_forKeyedSubscript_(v40, v44, v39, v43);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
    }
    else if (!v38)
    {
      objc_msgSend__cachePCSOnRecordZone_(*(void **)(a1 + 32), v25, *(void *)(a1 + 40));
    }
  }
  if (objc_msgSend_ignorePCSFailures(*(void **)(a1 + 32), v25, v26))
  {
    uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    objc_msgSend__locked_callbackForRecordZone_zoneID_error_(*(void **)(a1 + 32), v27, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  char v31 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v27, v28);
  dispatch_group_leave(v31);
}

void sub_1C4FDBD44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1C4FDBDBC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, v26, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        __int16 v15 = [CKDAnonymousZoneDataObject alloc];
        uint64_t v17 = objc_msgSend_initWithEncryptedData_(v15, v16, v14, (void)v22);
        objc_msgSend_addObject_(v7, v18, (uint64_t)v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v22, v26, 16);
    }
    while (v11);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__handleAnonymousZoneDataObjects_responsecode_(WeakRetained, v21, (uint64_t)v7, v6);
}

void sub_1C4FDBF28(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend__handleRecordZoneFetch_zoneID_responseCode_error_(WeakRetained, v13, (uint64_t)v12, v11, v10, v9);
}

void sub_1C4FDBFD0(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)MEMORY[0x1E4F1A280];
  uint64_t v6 = *MEMORY[0x1E4F19DD8];
  uint64_t v7 = sub_1C4E94D98(v3);
  id v10 = objc_msgSend_request(WeakRetained, v8, v9);
  id v11 = sub_1C4E940D0(v10, v3);
  uint64_t v14 = objc_msgSend_error(v3, v12, v13);

  uint64_t v17 = objc_msgSend_errorDescription(v14, v15, v16);
  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_format_(v5, v18, v6, v7, v11, @"Error fetching all record zones from server: %@", v17);

  uint64_t v20 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v21 = (os_log_t *)MEMORY[0x1E4F1A500];
  long long v22 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    char v32 = v22;
    uint64_t v33 = (objc_class *)objc_opt_class();
    uint64_t v34 = NSStringFromClass(v33);
    int v37 = objc_msgSend_ckShortDescription(WeakRetained, v35, v36);
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = v34;
    __int16 v40 = 2048;
    id v41 = WeakRetained;
    __int16 v42 = 2114;
    char v43 = v37;
    __int16 v44 = 2112;
    unsigned int v45 = v19;
    _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Fetch record zones operation <%{public}@: %p; %{public}@> hit top-level error %@",
      buf,
      0x2Au);
  }
  long long v25 = objc_msgSend_error(WeakRetained, v23, v24);

  if (v25)
  {
    if (*v20 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v27 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = v27;
      char v31 = objc_msgSend_error(WeakRetained, v29, v30);
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      id v41 = v31;
      _os_log_debug_impl(&dword_1C4CFF000, v28, OS_LOG_TYPE_DEBUG, "Not propagating operation error: %@, in favor of preceding error: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend_setError_(WeakRetained, v26, (uint64_t)v19);
  }
}

void sub_1C4FDC2A0(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    long long v25 = v6;
    uint64_t v26 = (objc_class *)objc_opt_class();
    os_log_t v27 = NSStringFromClass(v26);
    uint64_t v30 = objc_msgSend_ckShortDescription(WeakRetained, v28, v29);
    uint64_t v33 = objc_msgSend_error(v3, v31, v32);
    int v34 = 138544130;
    uint64_t v35 = v27;
    __int16 v36 = 2048;
    id v37 = WeakRetained;
    __int16 v38 = 2114;
    uint64_t v39 = v30;
    __int16 v40 = 2112;
    id v41 = v33;
    _os_log_debug_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_DEBUG, "Fetch record zones operation <%{public}@: %p; %{public}@> request finished with error %@",
      (uint8_t *)&v34,
      0x2Au);
  }
  uint64_t v9 = objc_msgSend_error(WeakRetained, v7, v8);

  id v12 = objc_msgSend_error(v3, v10, v11);
  uint64_t v14 = v12;
  if (!v9)
  {
    objc_msgSend_setError_(WeakRetained, v13, (uint64_t)v12);
    goto LABEL_12;
  }

  if (v14)
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v17;
      uint64_t v20 = objc_msgSend_error(v3, v18, v19);
      long long v23 = objc_msgSend_error(WeakRetained, v21, v22);
      int v34 = 138412546;
      uint64_t v35 = v20;
      __int16 v36 = 2112;
      id v37 = v23;
      _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Not propagating operation request error: %@, in favor of preceding error: %@", (uint8_t *)&v34, 0x16u);

LABEL_12:
    }
  }
  uint64_t v24 = objc_msgSend_stateTransitionGroup(WeakRetained, v15, v16);
  dispatch_group_leave(v24);
}

uint64_t sub_1C4FDC69C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4181798](a2, sel_setZoneIDs_, *(void *)(a1 + 32));
}

uint64_t CKDPResponseOperationResultErrorServerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t sub_1C4FDDF08(uint64_t a1, const char *a2)
{
  return objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"zoneID = $ZONE AND accountID = $ACCOUNT AND serviceName = $SERVICE");
}

uint64_t sub_1C4FDE050(uint64_t a1, const char *a2)
{
  return objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"shareID = $SHARE AND accountID = $ACCOUNT AND serviceName = $SERVICE");
}

uint64_t sub_1C4FDE1F8(uint64_t a1, const char *a2)
{
  return objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], a2, @"identifier = $IDENTIFIER AND databaseScope = $SCOPE AND itemType = $TYPE AND accountID = $ACCOUNT AND serviceName = $SERVICE");
}

void sub_1C4FDE48C(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend_cacheTable(a2, (const char *)a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteAllEntries_(v4, v3, 0);
}

void sub_1C4FDE69C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_deviceScopedDatabase(*(void **)(a1 + 32), a2, a3);
  uint64_t v7 = objc_msgSend_specialContainerType(*(void **)(a1 + 40), v5, v6);
  uint64_t v9 = objc_msgSend_tableGroupOptionsForContainerType_(CKDPCSSQLCacheTableGroup, v8, v7);
  uint64_t v10 = *(void *)(a1 + 48);
  id v21 = 0;
  unint64_t v12 = objc_msgSend_tableGroupInDatabase_withName_options_error_(CKDPCSSQLCacheTableGroup, v11, (uint64_t)v4, v10, v9, &v21);
  id v13 = v21;
  if (v12)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 56) + 32), v12);
    uint64_t v16 = objc_msgSend_cacheTable(v12, v14, v15);
    uint64_t v17 = *(void *)(a1 + 56);
    unsigned int v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_ERROR, "Failed to create PCS cache database for containerID %@, error: %@", buf, 0x16u);
    }
  }
}

void sub_1C4FDE94C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_sqliteRepresentation(*(void **)(a1 + 40), a2, a3);
  objc_msgSend__lockedFetchPCSDataForID_databaseScope_itemType_(v4, v6, (uint64_t)v5, *(void *)(a1 + 56), 2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
  }
}

void sub_1C4FDEAA4(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_sqliteRepresentation(*(void **)(a1 + 40), a2, a3);
  objc_msgSend__lockedFetchPCSDataForID_databaseScope_itemType_(v4, v6, (uint64_t)v5, *(void *)(a1 + 56), 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
  }
}

void sub_1C4FDEBFC(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_sqliteRepresentation(*(void **)(a1 + 40), a2, a3);
  objc_msgSend__lockedFetchPCSDataForID_databaseScope_itemType_(v4, v6, (uint64_t)v5, *(void *)(a1 + 56), 3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
  }
}

uint64_t sub_1C4FDF07C(uint64_t a1, const char *a2)
{
  objc_msgSend__lockedSetPCSData_databaseScope_itemType_forID_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t sub_1C4FDF1C4(void *a1, const char *a2, uint64_t a3)
{
  id v4 = (void *)a1[4];
  if (v4)
  {
    id v5 = *(void **)(a1[5] + 40);
    uint64_t v6 = objc_msgSend_sqliteRepresentation(v4, a2, a3);
    id v8 = (id)objc_msgSend_deletePCSDataForZone_account_serviceName_(v5, v7, (uint64_t)v6, *(void *)(a1[5] + 16), *(void *)(a1[5] + 24));
  }
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

void sub_1C4FDF320(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 40);
    uint64_t v6 = objc_msgSend_sqliteRepresentation(v4, a2, a3);
    id v8 = (id)objc_msgSend_deletePCSDataForShare_account_serviceName_(v5, v7, (uint64_t)v6, *(void *)(*(void *)(a1 + 40) + 16), *(void *)(*(void *)(a1 + 40) + 24));
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v9 = CKGetGlobalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FDF40C;
    block[3] = &unk_1E64F0A80;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
}

uint64_t sub_1C4FDF40C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1C4FDF494(uint64_t a1, const char *a2)
{
  return objc_msgSend_deleteAllEntries_(*(void **)(*(void *)(a1 + 32) + 40), a2, 0);
}

uint64_t sub_1C4FDF53C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL sub_1C4FDF9EC(char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 8;
LABEL_26:
        uint64_t v20 = *(CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo **)&a1[v19];
        *(void *)&a1[v19] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v20 = objc_alloc_init(CKCDPCodeServiceResponseAssetAuthorizationResponseHeaderInfo);
    objc_msgSend_addResponseHeaders_(a1, v21, (uint64_t)v20);
    if (!PBReaderPlaceMark() || !sub_1C4E60C14((uint64_t)v20, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C4FE0580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1C4FE0594(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v2 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    int v15 = v2;
    uint64_t v18 = objc_msgSend_record(WeakRetained, v16, v17);
    id v21 = objc_msgSend_recordID(v18, v19, v20);
    int v22 = 138412290;
    uint64_t v23 = v21;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Decrypt of record %@ is complete", (uint8_t *)&v22, 0xCu);
  }
  id v5 = objc_msgSend_callback(WeakRetained, v3, v4);

  if (v5)
  {
    objc_msgSend_callback(WeakRetained, v6, v7);
    char v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend_record(WeakRetained, v9, v10);
    BOOL v14 = objc_msgSend_error(WeakRetained, v12, v13);
    ((void (**)(void, void *, void *))v8)[2](v8, v11, v14);
  }
}

void sub_1C4FE0C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4FE0C68(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend__recordInfoWasDecrypted_nextSteps_(v2, v3, (uint64_t)WeakRetained, *(void *)(a1 + 40));
}

uint64_t sub_1C4FE0CC4(uint64_t a1, const char *a2)
{
  return objc_msgSend__decryptRecordInfo_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
}

void sub_1C4FE1104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FE1E5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = *(void **)(a1 + 32);
    id v37 = v9;
    __int16 v40 = objc_msgSend_recordID(v36, v38, v39);
    id v41 = @" with error: ";
    uint64_t v42 = &stru_1F2044F30;
    *(_DWORD *)buf = 138412802;
    __int16 v44 = v40;
    if (v6) {
      uint64_t v42 = v6;
    }
    else {
      id v41 = &stru_1F2044F30;
    }
    __int16 v45 = 2114;
    uint64_t v46 = v41;
    __int16 v47 = 2112;
    uint64_t v48 = v42;
    _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Got PCS data from fetched share %@%{public}@%@", buf, 0x20u);
  }
  if (objc_msgSend_pcs(v5, v10, v11))
  {
    uint64_t v13 = objc_msgSend__decryptRecordPCSForRecord_usingSharePCS_(*(void **)(a1 + 40), v12, *(void *)(a1 + 32), v5);
    objc_msgSend_setError_(*(void **)(a1 + 48), v14, (uint64_t)v13);
  }
  else
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void **)(a1 + 32);
      id v21 = v17;
      uint64_t v24 = objc_msgSend_share(v20, v22, v23);
      os_log_t v27 = objc_msgSend_recordID(v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      __int16 v44 = v27;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't get a PCS for our current share %@", buf, 0xCu);
    }
    uint64_t v28 = *(void **)(a1 + 40);
    uint64_t v29 = objc_msgSend_recordID(*(void **)(a1 + 32), v18, v19);
    uint64_t v32 = objc_msgSend_recordID(*(void **)(a1 + 32), v30, v31);
    uint64_t v13 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v28, v33, (uint64_t)v6, v29, 5001, @"Record %@ has items that require encryption but no share protection data was found", v32);

    objc_msgSend_setError_(*(void **)(a1 + 48), v34, (uint64_t)v13);
  }
  uint64_t v35 = objc_msgSend_decryptGroup(*(void **)(a1 + 48), v15, v16);
  dispatch_group_leave(v35);
}

void sub_1C4FE2100(void **a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = a1[4];
    log = v9;
    uint64_t v39 = objc_msgSend_recordID(v36, v37, v38);
    uint64_t v42 = objc_msgSend_recordID(a1[4], v40, v41);
    __int16 v45 = objc_msgSend_zoneID(v42, v43, v44);
    uint64_t v48 = objc_msgSend_etag(v5, v46, v47);
    *(_DWORD *)buf = 134219010;
    BOOL v51 = v36;
    __int16 v52 = 2112;
    uint64_t v53 = v39;
    __int16 v54 = 2112;
    uint64_t v55 = v45;
    __int16 v56 = 2114;
    id v57 = v48;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Fetched zone PCS data. Record %p recordID %@ zoneID %@ zone PCS etag %{public}@%@", buf, 0x34u);
  }
  if (objc_msgSend_pcs(v5, v10, v11))
  {
    uint64_t v13 = objc_msgSend__decryptRecordPCSForRecord_usingZonePCS_(a1[5], v12, (uint64_t)a1[4], v5);
    objc_msgSend_setError_(a1[6], v14, (uint64_t)v13);
  }
  else
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = a1[4];
      id v21 = v17;
      uint64_t v24 = objc_msgSend_recordID(v20, v22, v23);
      os_log_t v27 = objc_msgSend_zoneID(v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      BOOL v51 = v27;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for zone %@", buf, 0xCu);
    }
    uint64_t v28 = a1[5];
    uint64_t v29 = objc_msgSend_recordID(a1[4], v18, v19);
    uint64_t v32 = objc_msgSend_recordID(a1[4], v30, v31);
    uint64_t v13 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v28, v33, (uint64_t)v6, v29, 5001, @"Record %@ has items that require encryption but no zone protection data was found", v32);

    objc_msgSend_setError_(a1[6], v34, (uint64_t)v13);
  }
  uint64_t v35 = objc_msgSend_decryptGroup(a1[6], v15, v16);
  dispatch_group_leave(v35);
}

void sub_1C4FE36DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1C4FE370C(void **a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = a1[4];
    log = v9;
    uint64_t v39 = objc_msgSend_recordID(v36, v37, v38);
    uint64_t v42 = objc_msgSend_share(a1[4], v40, v41);
    __int16 v45 = objc_msgSend_recordID(v42, v43, v44);
    uint64_t v48 = objc_msgSend_etag(v5, v46, v47);
    *(_DWORD *)buf = 134219010;
    BOOL v51 = v36;
    __int16 v52 = 2112;
    uint64_t v53 = v39;
    __int16 v54 = 2112;
    uint64_t v55 = v45;
    __int16 v56 = 2114;
    id v57 = v48;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Fetched share PCS data. Record %p recordID %@ shareID %@ share PCS etag %{public}@%@", buf, 0x34u);
  }
  if (objc_msgSend_pcs(v5, v10, v11))
  {
    uint64_t v13 = objc_msgSend__decryptRecordPCSForRecord_usingSharePCS_(a1[5], v12, (uint64_t)a1[4], v5);
    objc_msgSend_setError_(a1[6], v14, (uint64_t)v13);
  }
  else
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = a1[4];
      id v21 = v17;
      uint64_t v24 = objc_msgSend_share(v20, v22, v23);
      os_log_t v27 = objc_msgSend_recordID(v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      BOOL v51 = v27;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for share %@", buf, 0xCu);
    }
    uint64_t v28 = a1[5];
    uint64_t v29 = objc_msgSend_recordID(a1[4], v18, v19);
    uint64_t v32 = objc_msgSend_recordID(a1[4], v30, v31);
    uint64_t v13 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v28, v33, (uint64_t)v6, v29, 5001, @"Record %@ has items that require encryption but no share protection data was found", v32);

    objc_msgSend_setError_(a1[6], v34, (uint64_t)v13);
  }
  uint64_t v35 = objc_msgSend_decryptGroup(a1[6], v15, v16);
  dispatch_group_leave(v35);
}

void sub_1C4FE39E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v8 = a3;
  if (v8
    || (objc_msgSend_chainPCSData(v5, v6, v7), uint64_t v33 = objc_claimAutoreleasedReturnValue(),
                                               v33,
                                               !v33))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = v9;
      uint64_t v16 = objc_msgSend_parent(v12, v14, v15);
      uint64_t v19 = objc_msgSend_recordID(v16, v17, v18);
      *(_DWORD *)buf = 138412290;
      uint64_t v48 = v19;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for parent record %@", buf, 0xCu);
    }
    uint64_t v20 = *(void **)(a1 + 40);
    id WeakRetained = objc_msgSend_recordID(*(void **)(a1 + 32), v10, v11);
    uint64_t v24 = objc_msgSend_recordID(*(void **)(a1 + 32), v22, v23);
    os_log_t v27 = objc_msgSend_parent(*(void **)(a1 + 32), v25, v26);
    uint64_t v30 = objc_msgSend_recordID(v27, v28, v29);
    uint64_t v32 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v20, v31, (uint64_t)v8, WeakRetained, 5001, @"Record %@ has items that require encryption but no protection data was found for parent %@", v24, v30);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    int v34 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      __int16 v40 = v34;
      char v43 = objc_msgSend_recordID(v5, v41, v42);
      uint64_t v46 = objc_msgSend_recordID(*(void **)(a1 + 32), v44, v45);
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v43;
      __int16 v49 = 2112;
      uint64_t v50 = v46;
      _os_log_debug_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_DEBUG, "Fetched parent PCS data from record %@ for record %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v32 = objc_msgSend__decryptRecordPCSForRecord_usingChainPCS_(WeakRetained, v35, *(void *)(a1 + 32), v5);
  }

  objc_msgSend_setError_(*(void **)(a1 + 48), v36, (uint64_t)v32);
  uint64_t v39 = objc_msgSend_decryptGroup(*(void **)(a1 + 48), v37, v38);
  dispatch_group_leave(v39);
}

void sub_1C4FE3CC4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = *(void **)(a1 + 32);
    id v37 = v9;
    __int16 v40 = objc_msgSend_recordID(v36, v38, v39);
    uint64_t v41 = @" with error: ";
    uint64_t v42 = &stru_1F2044F30;
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v40;
    if (v6) {
      uint64_t v42 = v6;
    }
    else {
      uint64_t v41 = &stru_1F2044F30;
    }
    __int16 v45 = 2114;
    uint64_t v46 = v41;
    __int16 v47 = 2112;
    uint64_t v48 = v42;
    _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Got PCS data from fetched share %@%{public}@%@", buf, 0x20u);
  }
  if (objc_msgSend_pcs(v5, v10, v11))
  {
    uint64_t v13 = objc_msgSend__decryptRecordPCSForRecord_usingSharePCS_(*(void **)(a1 + 40), v12, *(void *)(a1 + 32), v5);
    objc_msgSend_setError_(*(void **)(a1 + 48), v14, (uint64_t)v13);
  }
  else
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void **)(a1 + 32);
      id v21 = v17;
      uint64_t v24 = objc_msgSend_share(v20, v22, v23);
      os_log_t v27 = objc_msgSend_recordID(v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v27;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't get a PCS for our current share %@", buf, 0xCu);
    }
    uint64_t v28 = *(void **)(a1 + 40);
    uint64_t v29 = objc_msgSend_recordID(*(void **)(a1 + 32), v18, v19);
    uint64_t v32 = objc_msgSend_recordID(*(void **)(a1 + 32), v30, v31);
    uint64_t v13 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v28, v33, (uint64_t)v6, v29, 5001, @"Record %@ has items that require encryption but no share protection data was found", v32);

    objc_msgSend_setError_(*(void **)(a1 + 48), v34, (uint64_t)v13);
  }
  uint64_t v35 = objc_msgSend_decryptGroup(*(void **)(a1 + 48), v15, v16);
  dispatch_group_leave(v35);
}

void sub_1C4FE3F68(void **a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  unsigned int v9 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = a1[4];
    log = v9;
    uint64_t v39 = objc_msgSend_recordID(v36, v37, v38);
    uint64_t v42 = objc_msgSend_recordID(a1[4], v40, v41);
    __int16 v45 = objc_msgSend_zoneID(v42, v43, v44);
    uint64_t v48 = objc_msgSend_etag(v5, v46, v47);
    *(_DWORD *)buf = 134219010;
    uint64_t v51 = v36;
    __int16 v52 = 2112;
    uint64_t v53 = v39;
    __int16 v54 = 2112;
    uint64_t v55 = v45;
    __int16 v56 = 2114;
    id v57 = v48;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Fetched zone PCS data. Record %p recordID %@ zoneID %@ zone PCS etag %{public}@%@", buf, 0x34u);
  }
  if (objc_msgSend_pcs(v5, v10, v11))
  {
    uint64_t v13 = objc_msgSend__decryptRecordPCSForRecord_usingZonePCS_(a1[5], v12, (uint64_t)a1[4], v5);
    objc_msgSend_setError_(a1[6], v14, (uint64_t)v13);
  }
  else
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = a1[4];
      id v21 = v17;
      uint64_t v24 = objc_msgSend_recordID(v20, v22, v23);
      os_log_t v27 = objc_msgSend_zoneID(v24, v25, v26);
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v27;
      _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Couldn't fetch a PCS for zone %@", buf, 0xCu);
    }
    uint64_t v28 = a1[5];
    uint64_t v29 = objc_msgSend_recordID(a1[4], v18, v19);
    uint64_t v32 = objc_msgSend_recordID(a1[4], v30, v31);
    uint64_t v13 = objc_msgSend__possiblyWrapError_forRecordWithID_withCode_format_(v28, v33, (uint64_t)v6, v29, 5001, @"Record %@ has items that require encryption but no shared zone protection data was found", v32);

    objc_msgSend_setError_(a1[6], v34, (uint64_t)v13);
  }
  uint64_t v35 = objc_msgSend_decryptGroup(a1[6], v15, v16);
  dispatch_group_leave(v35);
}

id sub_1C4FE5CD0(uint64_t a1, const char *a2, uint64_t a3)
{
  if ((objc_msgSend_isCancelled(*(void **)(a1 + 32), a2, a3) & 1) == 0)
  {
    id v6 = objc_msgSend_outstandingDecryptions(*(void **)(a1 + 32), v4, v5);
    uint64_t v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      BOOL v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v19 = objc_msgSend_operationID(v16, v17, v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v20, v15, v16, @"CKDDecryptRecordsOperation.m", 679, @"Decrypt operation %@ finished but there were still outstanding decryptions", v19);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  v21.receiver = *(id *)(a1 + 32);
  v21.super_class = (Class)CKDDecryptRecordsOperation;
  return objc_msgSendSuper2(&v21, sel__finishOnCallbackQueueWithError_, v12);
}

void sub_1C4FE5EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FE6194(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v2 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v2;
    uint64_t v9 = objc_msgSend_operationID(v5, v7, v8);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_debug_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_DEBUG, "All records have been decrypted for operation %{public}@", (uint8_t *)&v10, 0xCu);
  }
  return objc_msgSend_finishWithError_(*(void **)(a1 + 32), v3, 0);
}

void sub_1C4FE6608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FE67B8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = a5;
  if (v8)
  {
    uint64_t v12 = objc_msgSend_allowsCellularAccess(v7, v9, v10);
    uint64_t v15 = objc_msgSend_allowsExpensiveNetworkAccess(v7, v13, v14);
    uint64_t v18 = objc_msgSend_preferAnonymousRequests(v7, v16, v17);
    objc_super v21 = objc_msgSend_entitlements(v8, v19, v20);
    char hasDarkWakeNetworkReachabilityEnabledEntitlement = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v21, v22, v23);

    id v25 = objc_opt_new();
    objc_msgSend_setQualityOfService_(v25, v26, 9);
    objc_msgSend_setAllowsCellularAccess_(v25, v27, v12);
    objc_msgSend_setAllowsExpensiveNetworkAccess_(v25, v28, v15);
    objc_msgSend_setPreferAnonymousRequests_(v25, v29, v18);
    uint64_t v32 = objc_msgSend_sourceApplicationBundleIdentifier(v7, v30, v31);
    objc_msgSend_setSourceApplicationBundleIdentifier_(v25, v33, (uint64_t)v32);

    __int16 v36 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v7, v34, v35);
    objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v25, v37, (uint64_t)v36);

    __int16 v40 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v7, v38, v39);
    objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v25, v41, (uint64_t)v40);

    uint64_t v44 = objc_msgSend_sourceApplicationSecondaryIdentifier(v7, v42, v43);
    objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v25, v45, (uint64_t)v44);

    uint64_t v48 = objc_msgSend_privacyProxyFailClosedOverride(v7, v46, v47);
    objc_msgSend_setPrivacyProxyFailClosedOverride_(v25, v49, (uint64_t)v48);

    uint64_t v50 = objc_opt_new();
    objc_msgSend_setResolvedConfiguration_(v50, v51, (uint64_t)v25);
    __int16 v52 = [CKDOperationInfoHolderOperation alloc];
    __int16 v54 = objc_msgSend_initWithOperationInfo_container_(v52, v53, (uint64_t)v50, v8);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = sub_1C4FE6B14;
    v62[3] = &unk_1E64F8560;
    id v63 = v7;
    char v67 = v12;
    char v68 = v15;
    char v69 = hasDarkWakeNetworkReachabilityEnabledEntitlement;
    uint64_t v66 = v11;
    id v64 = v54;
    id v65 = v8;
    id v55 = v54;
    objc_msgSend_fetchConfigurationForOperation_withCompletionHandler_(v65, v56, (uint64_t)v55, v62);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v57 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      __int16 v58 = v57;
      uint64_t v61 = objc_msgSend_metricUUID(v7, v59, v60);
      *(_DWORD *)buf = 138412290;
      v71 = v61;
      _os_log_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_INFO, "CKDContainer missing for CKEventMetric %@", buf, 0xCu);
    }
    if (v11) {
      v11[2](v11);
    }
  }
}

void sub_1C4FE6B14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v8 = a3;
  if (v8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = v9;
      uint64_t v14 = objc_msgSend_metricUUID(v10, v12, v13);
      int v66 = 138412546;
      char v67 = v14;
      __int16 v68 = 2112;
      id v69 = v8;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Failed to fetch server configuration for CKEventMetric %@. %@", (uint8_t *)&v66, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
  else
  {
    if (objc_msgSend_isCKInternalMetric(*(void **)(a1 + 32), v6, v7)) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F50D58]);
    objc_msgSend_setAllowsCellularAccess_(v17, v18, *(unsigned __int8 *)(a1 + 64));
    objc_msgSend_set_allowsExpensiveAccess_(v17, v19, *(unsigned __int8 *)(a1 + 65));
    objc_msgSend_set_allowsPowerNapScheduling_(v17, v20, *(unsigned __int8 *)(a1 + 66));
    uint64_t v23 = objc_msgSend_sourceApplicationSecondaryIdentifier(*(void **)(a1 + 40), v21, v22);
    objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v17, v24, (uint64_t)v23);

    os_log_t v27 = objc_msgSend_privacyProxyFailClosedOverride(*(void **)(a1 + 40), v25, v26);
    objc_msgSend_setPrivacyProxyFailClosedOverride_(v17, v28, (uint64_t)v27);

    uint64_t v31 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(*(void **)(a1 + 40), v29, v30);
    objc_msgSend_set_sourceApplicationBundleIdentifier_(v17, v32, (uint64_t)v31);

    uint64_t v35 = objc_msgSend_metricUUID(*(void **)(a1 + 32), v33, v34);

    if (v35)
    {
      uint64_t v38 = objc_msgSend_metricUUID(*(void **)(a1 + 32), v36, v37);
      objc_msgSend_setMetricUUID_(v17, v39, (uint64_t)v38);
    }
    __int16 v40 = objc_msgSend_metricOptionsForEventMetric_metricType_container_config_reportingCompletionBlock_(MEMORY[0x1E4F50D50], v36, *(void *)(a1 + 32), v16, *(void *)(a1 + 48), v5, *(void *)(a1 + 56));
    objc_msgSend_setMetricOptions_(v17, v41, (uint64_t)v40);

    uint64_t v44 = objc_msgSend_metricOptions(v17, v42, v43);

    if (v44)
    {
      uint64_t v47 = (void *)MEMORY[0x1E4F50D68];
      uint64_t v48 = objc_msgSend_eventName(*(void **)(a1 + 32), v45, v46);
      uint64_t v51 = objc_msgSend_startTime(*(void **)(a1 + 32), v49, v50);
      __int16 v54 = objc_msgSend_endTime(*(void **)(a1 + 32), v52, v53);
      id v57 = objc_msgSend_attributes(*(void **)(a1 + 32), v55, v56);
      objc_msgSend_reportMetricWithOptions_genericMetricType_eventName_startTime_endTime_attributes_(v47, v58, (uint64_t)v17, v16, v48, v51, v54, v57);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v59 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v60 = *(void **)(a1 + 32);
        uint64_t v61 = v59;
        id v64 = objc_msgSend_metricUUID(v60, v62, v63);
        int v66 = 138412290;
        char v67 = v64;
        _os_log_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_INFO, "Failed to set options for CKEventMetric %@", (uint8_t *)&v66, 0xCu);
      }
      uint64_t v65 = *(void *)(a1 + 56);
      if (v65) {
        (*(void (**)(void))(v65 + 16))();
      }
    }
  }
}

void sub_1C4FE7078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C4FE7094(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = objc_msgSend_infoFetchedGroup(WeakRetained, v2, v3);
  dispatch_group_leave(v4);
}

void sub_1C4FE7278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1C4FE72B0(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = objc_msgSend_error(v3, v4, v5);

  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v9;
      uint64_t v15 = objc_msgSend_error(v3, v13, v14);
      int v23 = 138412290;
      uint64_t v24 = v15;
      _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Error fetching database URL from the server: %@", (uint8_t *)&v23, 0xCu);
LABEL_10:
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_containerServerInfo(v3, v7, v8);
    objc_msgSend_setContainerServerInfo_(WeakRetained, v17, (uint64_t)v16);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v18 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v18;
      uint64_t v15 = objc_msgSend_containerServerInfo(WeakRetained, v19, v20);
      int v23 = 138412290;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Fetched database URLS from the server: %@", (uint8_t *)&v23, 0xCu);
      goto LABEL_10;
    }
  }
  objc_super v21 = objc_msgSend_error(v3, v10, v11);
  objc_msgSend_finishWithError_(WeakRetained, v22, (uint64_t)v21);
}

uint64_t sub_1C4FE781C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_zoneID(a2, (const char *)a2, a3);
}

id sub_1C4FE79B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend_operationType(v4, v5, v6);
  uint64_t v9 = objc_msgSend_operationRequestWithType_(v4, v8, v7);
  uint64_t v12 = objc_msgSend_mergeableValueIDsByRequestID(*(void **)(a1 + 32), v10, v11);
  uint64_t v15 = objc_msgSend_request(v9, v13, v14);
  uint64_t v18 = objc_msgSend_operationUUID(v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v19, (uint64_t)v3, v18);

  if (!objc_msgSend_requiresCKAnonymousUserIDs(*(void **)(a1 + 32), v20, v21)) {
    goto LABEL_4;
  }
  uint64_t v24 = objc_msgSend_zoneID(v3, v22, v23);
  os_log_t v27 = objc_msgSend_anonymousCKUserID(v24, v25, v26);

  if (v27)
  {
    uint64_t v30 = objc_msgSend_zoneID(v3, v28, v29);
    uint64_t v33 = objc_msgSend_anonymousCKUserID(v30, v31, v32);
    __int16 v36 = objc_msgSend_CKDPIdentifier_User(v33, v34, v35);
    uint64_t v39 = objc_msgSend_request(v9, v37, v38);
    objc_msgSend_setAnonymousCKUserID_(v39, v40, (uint64_t)v36);

LABEL_4:
    uint64_t v41 = objc_opt_new();
    uint64_t v44 = objc_msgSend_translator(*(void **)(a1 + 32), v42, v43);
    uint64_t v46 = objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v44, v45, (uint64_t)v3);
    objc_msgSend_setIdentifier_(v41, v47, (uint64_t)v46);

    uint64_t v50 = objc_msgSend_previousContinuationTokens(*(void **)(a1 + 32), v48, v49);
    __int16 v52 = objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)v3);

    if (v52) {
      objc_msgSend_setContinuation_(v41, v53, (uint64_t)v52);
    }
    objc_msgSend_setMergeableDeltaRetrieveRequest_(v9, v53, (uint64_t)v41);
    id v54 = v9;
    goto LABEL_7;
  }
  uint64_t v41 = objc_opt_new();
  __int16 v52 = objc_msgSend_stringWithFormat_(NSString, v56, @"An anonymousCKUserID is required to fetch %@ when using anonymous to server share participants", v3);
  objc_msgSend_setObject_forKeyedSubscript_(v41, v57, (uint64_t)v52, *MEMORY[0x1E4F28568]);
  uint64_t v60 = objc_msgSend_operation(*(void **)(a1 + 32), v58, v59);
  uint64_t v63 = objc_msgSend_topmostParentOperation(v60, v61, v62);

  char v67 = objc_msgSend_operationID(v63, v64, v65);
  if (v67) {
    objc_msgSend_setObject_forKeyedSubscript_(v41, v66, (uint64_t)v67, *MEMORY[0x1E4F19C50]);
  }
  __int16 v68 = *(void **)(a1 + 32);
  id v69 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v66, *MEMORY[0x1E4F19DD8], 5015, v41);
  objc_msgSend_finishWithError_(v68, v70, (uint64_t)v69);

  id v54 = 0;
LABEL_7:

  return v54;
}

void sub_1C4FE83EC()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EBBD00D8);
  dispatch_queue_t v0 = [CKDLogicalDeviceContext alloc];
  uint64_t v2 = objc_msgSend__initWithTestDeviceReference_(v0, v1, 0);
  id v3 = (void *)qword_1EBBD00E0;
  qword_1EBBD00E0 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EBBD00D8);
}

void sub_1C4FE8680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FE869C(uint64_t a1, const char *a2, uint64_t a3)
{
  qword_1EBBD00F8 = objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E4F28E10], a2, a3);
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FE8CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1C4FE8F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C4FE9744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FE9F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CKBasicStringForIdentitySet(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x1C8789E70]();
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v5, v6, @"Identity Set: %p\n", a2);
  objc_msgSend_appendFormat_(v5, v7, @"Primary service name: %@\n", v3);
  uint64_t v8 = PCSIdentitySetCopyCurrentIdentityWithError();
  if (v8)
  {
    uint64_t v10 = (const void *)v8;
    objc_msgSend_appendFormat_(v5, v9, @"Current key: %p\n", v8);
    uint64_t v11 = PCSIdentityGetPublicKey();
    objc_msgSend_appendFormat_(v5, v12, @"\tpublic-key: %@\n", v11);
    uint64_t KeyID = PCSIdentityGetKeyID();
    objc_msgSend_appendFormat_(v5, v14, @"\tkeyid: %@\n", KeyID);
    if (PCSIdentityIsFullManatee()) {
      objc_msgSend_appendFormat_(v5, v15, @"\tmanatee: %@\n", @"yes");
    }
    else {
      objc_msgSend_appendFormat_(v5, v15, @"\tmanatee: %@\n", @"no");
    }
    CFDictionaryRef v16 = (const __CFDictionary *)PCSGetPublicIdentitites();
    PublicKey = (const void *)PCSIdentityGetPublicKey();
    if (CFDictionaryGetValueIfPresent(v16, PublicKey, 0)) {
      objc_msgSend_appendFormat_(v5, v18, @"\tis public identity\n");
    }
    CFRelease(v10);
  }
  else
  {
    objc_msgSend_appendFormat_(v5, v9, @"No current key for the given service name.");
    uint64_t v11 = 0;
  }
  uint64_t v21 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v19, v20);
  int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v21, v22, v23);

  if (isAppleInternalInstall)
  {
    uint64_t v25 = objc_opt_new();
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    id v29 = v11;
    id v26 = v25;
    PCSIdentitySetEnumeratePublicKeys();
    if (v31[3]) {
      objc_msgSend_appendFormat_(v5, v27, @"Additional public keys (%lu):\n%@", v31[3], v26);
    }

    _Block_object_dispose(&v30, 8);
  }

  return v5;
}

void sub_1C4FEA22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C4FEA4E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FEA5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FEB200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FEC704(uint64_t a1, const char *a2)
{
  objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a2);
  id v3 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v3);
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FECBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "service: %{public}@ <%{public}@>", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1C4FED010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1C4FED040(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = objc_msgSend_password(*(void **)(a1 + 32), a2, a3);
    if ((objc_msgSend_isEqualToString_(*(void **)(a1 + 40), v5, (uint64_t)v4) & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  int v6 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v6);
}

uint64_t sub_1C4FED100()
{
  qword_1EBBD0100 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FED2C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FED3F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FEE4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "service: %{public}@ <%{public}@>", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1C4FEE724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FEE740(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C4FEE750(uint64_t a1)
{
}

id sub_1C4FEE758(uint64_t a1)
{
  ExternalForm = (void *)PCSIdentitySetCreateExternalForm();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  return ExternalForm;
}

uint64_t sub_1C4FEE820()
{
  qword_1EBBD0110 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FEECDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FEF030(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FEFFDC()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  qword_1EBBD0120 = objc_msgSend_initWithObjects_(v0, v1, @"ForceSecurityErrorOnIdentityValidation", @"MasqueradeAsManateeIdentity", @"RefetchPCSIdentitySet", 0);
  return MEMORY[0x1F41817F8]();
}

void sub_1C4FF0110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C4FF0260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C4FF0348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FF0460(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend_isEqualToString_(a2, (const char *)a2, *(void *)(a1 + 32));
  if ((result & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    return objc_msgSend_appendFormat_(*(void **)(a1 + 40), v5, @"\t%@\n", a2);
  }
  return result;
}

BOOL sub_1C4FF0634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = *(CKDPCodeFunctionInvokeResponseAttestationResponse **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

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
    uint64_t v18 = objc_alloc_init(CKDPCodeFunctionInvokeResponseAttestationResponse);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (sub_1C4F00C94(v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C4FF0E6C(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2)
  {
    char v8 = *(void **)(a1 + 32);
    unsigned int v9 = objc_msgSend_appleAccount(*(void **)(a1 + 40), v5, v6);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1C4FF0FFC;
    v13[3] = &unk_1E64F8118;
    id v14 = *(id *)(a1 + 48);
    objc_msgSend_saveVerifiedAccount_withCompletionHandler_(v8, v10, (uint64_t)v9, v13);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Failed to update account properties, error %@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v7);
    }
  }
}

void sub_1C4FF0FFC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v6 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_ERROR, "Failed to save verified account, error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void sub_1C4FF1AF8(uint64_t a1)
{
}

void sub_1C4FF1C14(uint64_t a1)
{
}

void sub_1C4FF1D30(uint64_t a1)
{
}

void sub_1C4FF1FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1C4FF202C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend_error(v2, v3, v4);

  if (v5)
  {
    int v8 = objc_msgSend_error(v2, v6, v7);
    objc_msgSend_finishWithError_(WeakRetained, v9, (uint64_t)v8);
  }
  else
  {
    int v8 = objc_msgSend_userPrivacySettings(v2, v6, v7);
    objc_msgSend__handleRetrievedPrivacySettings_(WeakRetained, v10, (uint64_t)v8);
  }
}

BOOL sub_1C4FF25D0(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 4) {
        break;
      }
      if (v17 == 3)
      {
        uint64_t v21 = PBReaderReadData();
        uint64_t v18 = (CKDPAssetUploadTokenRetrieveResponseUploadToken *)a1[1];
        a1[1] = v21;
        goto LABEL_28;
      }
      if (v17 == 2)
      {
        uint64_t v18 = objc_alloc_init(CKDPAssetUploadTokenRetrieveResponseUploadToken);
        objc_msgSend_addUploadTokens_(a1, v19, (uint64_t)v18);
        if (!PBReaderPlaceMark() || (sub_1C4E26A00((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(CKDPAssetUploadTokenRetrieveResponseHeaderInfo);
    objc_msgSend_addContentResponseHeaders_(a1, v20, (uint64_t)v18);
    if (!PBReaderPlaceMark() || !sub_1C4D7DB08((uint64_t)v18, a2))
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C4FF36D4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void))v7 + 2))(v7, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void sub_1C4FF3E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FF3E84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C4FF3E94(uint64_t a1)
{
}

void sub_1C4FF3E9C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  char v8 = (void *)MEMORY[0x1E4F1A550];
  unsigned int v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v10 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      unint64_t v12 = v10;
      int v15 = objc_msgSend_recordID(v11, v13, v14);
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = v15;
      __int16 v62 = 2112;
      id v63 = v16;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Warn: Couldn't prep PCS data %@: %@", buf, 0x16u);
    }
  }
  if (objc_msgSend_publicPCS(*(void **)(a1 + 32), v6, v7))
  {
    uint64_t v19 = objc_msgSend_container(*(void **)(a1 + 40), v17, v18);
    uint64_t v22 = objc_msgSend_pcsManager(v19, v20, v21);
    uint64_t v25 = objc_msgSend_publicPCS(*(void **)(a1 + 32), v23, v24);
    id v59 = 0;
    os_log_t v27 = objc_msgSend_sharingIdentityDataFromPCS_error_(v22, v26, v25, &v59);
    id v28 = v59;
    id v29 = v59;

    id v30 = objc_alloc(MEMORY[0x1E4F19FA0]);
    uint64_t v32 = objc_msgSend_initWithData_(v30, v31, (uint64_t)v27);
    objc_msgSend_setMutableEncryptedPSK_(*(void **)(a1 + 32), v33, (uint64_t)v32);

    uint64_t v34 = (void *)*MEMORY[0x1E4F1A548];
    if (v29)
    {
      if (*v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v34);
      }
      os_log_t v35 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = *(void **)(a1 + 32);
        uint64_t v37 = v35;
        __int16 v40 = objc_msgSend_recordID(v36, v38, v39);
        *(_DWORD *)buf = 138412546;
        uint64_t v61 = v40;
        __int16 v62 = 2112;
        id v63 = v29;
        _os_log_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_INFO, "Warn: Couldn't get a public sharing identity for share %@: %@", buf, 0x16u);
      }
      uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v43 = *(void *)(v41 + 40);
      uint64_t v42 = (id *)(v41 + 40);
      if (!v43) {
        objc_storeStrong(v42, v28);
      }
    }
    else
    {
      if (*v8 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v34);
      }
      uint64_t v44 = (void *)*MEMORY[0x1E4F1A528];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
      {
        __int16 v45 = *(void **)(a1 + 32);
        uint64_t v46 = v44;
        uint64_t v49 = objc_msgSend_recordID(v45, v47, v48);
        __int16 v52 = objc_msgSend_mutableEncryptedPSK(*(void **)(a1 + 32), v50, v51);
        id v55 = objc_msgSend_data(v52, v53, v54);
        *(_DWORD *)buf = 138412546;
        uint64_t v61 = v49;
        __int16 v62 = 2112;
        id v63 = v55;
        _os_log_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_INFO, "Public sharing identity for share %@ is %@", buf, 0x16u);
      }
    }
  }
  objc_msgSend__performCallbackForURL_withShare_error_(*(void **)(a1 + 40), v17, *(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  __int16 v58 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 40), v56, v57);
  dispatch_group_leave(v58);
}

void sub_1C4FF5070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a43);
  _Unwind_Resume(a1);
}

void sub_1C4FF50C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend__handleShareURLAccepted_forShare_responseCode_(WeakRetained, v10, (uint64_t)v9, v8, v7);
}

void sub_1C4FF5154(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = objc_msgSend_error(v3, v4, v5);

  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = v9;
      int v15 = objc_msgSend_error(v3, v13, v14);
      int v19 = 138412290;
      uint64_t v20 = v15;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Error accepting shares: %@", (uint8_t *)&v19, 0xCu);
    }
    id v16 = objc_msgSend_error(v3, v10, v11);
    objc_msgSend_setError_(WeakRetained, v17, (uint64_t)v16);
  }
  uint64_t v18 = objc_msgSend_stateTransitionGroup(WeakRetained, v7, v8);
  dispatch_group_leave(v18);
}

void sub_1C4FF55F8(id *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v9 = v6;
  if (!v5 || v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v27 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = v9;
    id v30 = "Couldn't pull pcsData off fetched share, re-fetching: %@";
    uint64_t v31 = v27;
    uint32_t v32 = 12;
    goto LABEL_13;
  }
  uint64_t v10 = objc_msgSend_publicPCS(v5, v7, v8);
  if (!v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v33 = *MEMORY[0x1E4F1A500];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v30 = "Fetched share's PCS data lacked publicPCS, re-fetching";
    uint64_t v31 = v33;
    uint32_t v32 = 2;
LABEL_13:
    _os_log_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_INFO, v30, buf, v32);
LABEL_14:
    uint64_t v34 = objc_msgSend_container(a1[5], v28, v29);
    uint64_t v37 = objc_msgSend_pcsCache(v34, v35, v36);
    __int16 v40 = objc_msgSend_share(a1[6], v38, v39);
    uint64_t v43 = objc_msgSend_recordID(v40, v41, v42);
    id v44 = a1[5];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    void v46[2] = sub_1C4FF58C4;
    v46[3] = &unk_1E64F84E8;
    v46[4] = v44;
    id v47 = a1[6];
    id v48 = a1[4];
    objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v37, v45, (uint64_t)v43, v44, 0, v46);

    goto LABEL_15;
  }
  uint64_t v13 = v10;
  id v14 = a1[4];
  int v15 = objc_msgSend_container(a1[5], v11, v12);
  uint64_t v18 = objc_msgSend_pcsManager(v15, v16, v17);
  objc_msgSend__decryptDataWithPCSBlob_pcsManager_(v14, v19, v13, v18);

  uint64_t v22 = objc_msgSend_acceptedInProcess(a1[4], v20, v21);
  objc_msgSend_setAcceptedInProcess_(a1[6], v23, v22);
  id v26 = objc_msgSend_stateTransitionGroup(a1[5], v24, v25);
  dispatch_group_leave(v26);

LABEL_15:
}

void sub_1C4FF58C4(void **a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v8 = a3;
  if (!v5 || (uint64_t v9 = objc_msgSend_publicPCS(v5, v6, v7), v8) || !v9)
  {
    uint64_t v17 = objc_msgSend_container(a1[4], v6, v7);
    uint64_t v20 = objc_msgSend_pcsManager(v17, v18, v19);
    uint64_t v23 = objc_msgSend_share(a1[5], v21, v22);
    id v26 = objc_msgSend_publicProtectionData(v23, v24, v25);
    uint64_t v29 = objc_msgSend_privateToken(a1[5], v27, v28);
    id v42 = 0;
    uint64_t v10 = (const void *)objc_msgSend_createSharePCSFromData_sharePrivateKey_error_(v20, v30, (uint64_t)v26, v29, &v42);
    id v13 = v42;

    if (!v10) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v31 = a1[6];
    uint32_t v32 = objc_msgSend_container(a1[4], v11, v12);
    os_log_t v35 = objc_msgSend_pcsManager(v32, v33, v34);
    objc_msgSend__decryptDataWithPCSBlob_pcsManager_(v31, v36, (uint64_t)v10, v35);

    uint64_t v39 = objc_msgSend_acceptedInProcess(a1[6], v37, v38);
    objc_msgSend_setAcceptedInProcess_(a1[5], v40, v39);
    CFRelease(v10);
    goto LABEL_11;
  }
  uint64_t v10 = (const void *)objc_msgSend_publicPCS(v5, v6, v7);
  CFRetain(v10);
  id v13 = 0;
  if (v10) {
    goto LABEL_10;
  }
LABEL_5:
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v14 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v13;
    _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Warn: Couldn't create share PCS data while accepting metadata: %@", buf, 0xCu);
  }
LABEL_11:
  uint64_t v41 = objc_msgSend_stateTransitionGroup(a1[4], v15, v16);
  dispatch_group_leave(v41);
}

void sub_1C4FF5E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  objc_initWeak(&from, *(id *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4FF5FFC;
  v12[3] = &unk_1E64F8678;
  id v13 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, &from);
  objc_msgSend_setRecordFetchCompletionBlock_(v3, v4, (uint64_t)v12);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4FF6154;
  v8[3] = &unk_1E64F0238;
  objc_copyWeak(&v11, &location);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  objc_msgSend_setCompletionBlock_(v3, v7, (uint64_t)v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_1C4FF5FC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C4FF5FFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v11, (uint64_t)v7);
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v13 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Accepted share %@ fetched for URL %@", (uint8_t *)&v16, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend__performCallbackForURL_withShare_error_(WeakRetained, v15, (uint64_t)v12, v10, v9);
}

void sub_1C4FF6154(void **a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = objc_msgSend_error(WeakRetained, v3, v4);

  uint64_t v6 = (void *)*MEMORY[0x1E4F1A548];
  if (v5)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v7 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      id v10 = v7;
      id v13 = objc_msgSend_error(WeakRetained, v11, v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v13;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Warn: Error while fetching accepted shares: %@", buf, 0xCu);
    }
    uint64_t v14 = objc_msgSend_error(WeakRetained, v8, v9);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v17 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "All accepted shares were fetched successfully", buf, 2u);
    }
    uint64_t v14 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v18, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't fetch accepted share from the server");
  }
  uint64_t v19 = (void *)v14;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v20 = objc_msgSend_allKeys(a1[4], v15, v16, 0);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v37, v41, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v20);
        }
        os_log_t v27 = objc_msgSend_objectForKeyedSubscript_(a1[4], v23, *(void *)(*((void *)&v37 + 1) + 8 * v26));
        id v30 = objc_msgSend_acceptedShareURLsToFetch(a1[5], v28, v29);
        int v32 = objc_msgSend_containsObject_(v30, v31, (uint64_t)v27);

        if (v32) {
          objc_msgSend__performCallbackForURL_withShare_error_(a1[5], v33, (uint64_t)v27, 0, v19);
        }

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v37, v41, 16);
    }
    while (v24);
  }

  uint64_t v36 = objc_msgSend_stateTransitionGroup(a1[5], v34, v35);
  dispatch_group_leave(v36);
}

void sub_1C4FF70F8(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v7 = *MEMORY[0x1E4F1A550];
  if (v5 || !a2)
  {
    if (v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v17 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = *(void **)(a1 + 32);
      id v10 = v17;
      id v13 = objc_msgSend_share(v18, v19, v20);
      uint64_t v16 = objc_msgSend_recordID(v13, v21, v22);
      int v23 = 138412546;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "Error decrypting the invited PCS on share %@: %@", (uint8_t *)&v23, 0x16u);
      goto LABEL_7;
    }
  }
  else
  {
    if (v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v6);
    }
    id v8 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v13 = objc_msgSend_share(v9, v11, v12);
      uint64_t v16 = objc_msgSend_recordID(v13, v14, v15);
      int v23 = 138412290;
      uint64_t v24 = v16;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Successfully decrypted the invited PCS on share %@", (uint8_t *)&v23, 0xCu);
LABEL_7:
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1C4FF84CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1C4FF84F8(uint64_t a1, int a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v8 = *MEMORY[0x1E4F1A550];
  if (v6 || !a2)
  {
    if (v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    uint64_t v20 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void **)(a1 + 32);
      int v32 = v20;
      uint64_t v35 = objc_msgSend_share(v31, v33, v34);
      long long v38 = objc_msgSend_recordID(v35, v36, v37);
      *(_DWORD *)buf = 138412290;
      long long v40 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Couldn't decrypt invited PCS blob for share %@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v22)
    {
      uint64_t v23 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v21, *MEMORY[0x1E4F19DD8], 5004, @"Can not accept share at URL %@ because we couldn't decrypt the share as an invited user", *(void *)(a1 + 40));
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      __int16 v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend__performCallbackForURL_withShare_error_(*(void **)(a1 + 48), v21, *(void *)(a1 + 40), 0, v22);
    uint64_t v28 = objc_msgSend_shareMetadatasToAcceptByURL(*(void **)(a1 + 48), v26, v27);
    objc_msgSend_removeObjectForKey_(v28, v29, *(void *)(a1 + 40));
  }
  else
  {
    if (v8 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = v9;
      uint64_t v16 = objc_msgSend_share(v12, v14, v15);
      uint64_t v19 = objc_msgSend_recordID(v16, v17, v18);
      *(_DWORD *)buf = 138412290;
      long long v40 = v19;
      _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "We were able to decrypt the private PCS for share %@", buf, 0xCu);
    }
  }
  id v30 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 48), v10, v11);
  dispatch_group_leave(v30);
}

void sub_1C4FF8AAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1C4FF8AD8(uint64_t a1, char a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_noteOperationDidFinishWaitingOnPCS(WeakRetained, v7, v8);
  uint64_t v9 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v10 = *MEMORY[0x1E4F1A550];
  if (v5 || (a2 & 1) == 0)
  {
    if (v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    uint64_t v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v18;
      __int16 v45 = 2112;
      id v46 = v5;
      _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "User key sync failed for operation %{public}@ with error %@.", buf, 0x16u);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v19 = objc_msgSend_URLsWaitingKRSByServiceType(*(void **)(a1 + 40), v16, v17, 0);
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, *(void *)(a1 + 48));

    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v38, v42, 16);
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v21);
          }
          uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          objc_msgSend__performCallbackForURL_withShare_error_(*(void **)(a1 + 40), v24, v28, 0, v5);
          uint64_t v31 = objc_msgSend_shareMetadatasToAcceptByURL(*(void **)(a1 + 40), v29, v30);
          objc_msgSend_removeObjectForKey_(v31, v32, v28);
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v38, v42, 16);
      }
      while (v25);
    }
  }
  else
  {
    if (v10 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v9);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v14;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "User key sync succeeded for operation %{public}@", buf, 0xCu);
    }
  }
  uint64_t v33 = objc_msgSend_URLsWaitingKRSByServiceType(*(void **)(a1 + 40), v12, v13);
  objc_msgSend_removeObjectForKey_(v33, v34, *(void *)(a1 + 48));

  uint64_t v37 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 40), v35, v36);
  dispatch_group_leave(v37);
}

void sub_1C4FF9770(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void))v7 + 2))(v7, *(void *)(a1 + 40), 0, *(void *)(a1 + 48));
  }
}

void sub_1C4FF97F8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void))v7 + 2))(v7, *(void *)(a1 + 40), 0, *(void *)(a1 + 48));
  }
}

void sub_1C4FF9880(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void))v7 + 2))(v7, *(void *)(a1 + 40), 0, *(void *)(a1 + 48));
  }
}

void sub_1C4FF9908(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = sub_1C4FF9A68;
  v15[3] = &unk_1E64F01C0;
  v15[4] = *(void *)(a1 + 32);
  objc_msgSend_setShareMetadataFetchedBlock_(v3, v4, (uint64_t)v15);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1C4FF9BB0;
  uint64_t v12 = &unk_1E64F01E8;
  objc_copyWeak(&v14, &location);
  uint64_t v13 = *(void *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v5, (uint64_t)&v9);
  uint64_t v8 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v6, v7, v9, v10, v11, v12);
  dispatch_group_enter(v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_1C4FF9A40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1C4FF9A68(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = v9;
  if (v7)
  {
    if (!v8 || v9)
    {
      if (!v9)
      {
        uint64_t v12 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v10, *MEMORY[0x1E4F19DD8], 2003, @"Couldn't get metadata for the share with url %@", v7);
      }
      objc_msgSend__performCallbackForURL_withShare_error_(*(void **)(a1 + 32), v10, (uint64_t)v7, 0, v12);
    }
    else
    {
      uint64_t v12 = objc_msgSend_shareMetadatasToAcceptByURL(*(void **)(a1 + 32), v10, v11);
      objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, v7);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Missing shareURL in shareMetadataFetchedBlock", buf, 2u);
    }
  }
}

void sub_1C4FF9BB0(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_error(WeakRetained, v3, v4);
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    id v9 = @" with error ";
    uint64_t v10 = &stru_1F2044F30;
    if (v5) {
      uint64_t v10 = v5;
    }
    else {
      id v9 = &stru_1F2044F30;
    }
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "Done fetching all share metadata%{public}@%@", (uint8_t *)&v13, 0x16u);
  }
  if (v5)
  {
    uint64_t v11 = objc_msgSend_error(*(void **)(a1 + 32), v7, v8);

    if (!v11) {
      objc_msgSend_setError_(*(void **)(a1 + 32), v7, (uint64_t)v5);
    }
  }
  uint64_t v12 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v7, v8);
  dispatch_group_leave(v12);
}

void sub_1C4FF9E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C4FF9E60(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_ERROR, "Failing to accept anonymous share. %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = objc_msgSend_stateTransitionGroup(WeakRetained, v6, v7);
  dispatch_group_leave(v8);
}

void sub_1C4FFA290()
{
  id v0 = (void *)qword_1EBBD0130;
  qword_1EBBD0130 = (uint64_t)&unk_1F20AC3C0;
}

uint64_t sub_1C4FFA3CC(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

id sub_1C4FFAC38(uint64_t a1, void *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend_operationType(v4, v5, v6);
  unsigned int v9 = objc_msgSend_operationRequestWithType_(v4, v8, v7);
  unint64_t v10 = objc_opt_new();
  objc_msgSend_setRecordRetrieveVersionsRequest_(v9, v11, (uint64_t)v10);

  id v14 = objc_msgSend_translator(*(void **)(a1 + 32), v12, v13);
  uint64_t v16 = objc_msgSend_pRecordIdentifierFromRecordID_(v14, v15, (uint64_t)v3);
  uint64_t v19 = objc_msgSend_recordRetrieveVersionsRequest(v9, v17, v18);
  objc_msgSend_setRecordIdentifier_(v19, v20, (uint64_t)v16);

  uint64_t v23 = objc_msgSend_desiredKeys(*(void **)(a1 + 32), v21, v22);

  if (v23)
  {
    id v81 = v3;
    uint64_t v26 = objc_opt_new();
    uint64_t v29 = objc_msgSend_recordRetrieveVersionsRequest(v9, v27, v28);
    objc_msgSend_setRequestedFields_(v29, v30, (uint64_t)v26);

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v33 = objc_msgSend_desiredKeys(*(void **)(a1 + 32), v31, v32);
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v82, v86, 16);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v83 != v37) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void *)(*((void *)&v82 + 1) + 8 * i);
          long long v40 = objc_opt_new();
          objc_msgSend_setName_(v40, v41, v39);
          uint64_t v44 = objc_msgSend_recordRetrieveVersionsRequest(v9, v42, v43);
          uint64_t v47 = objc_msgSend_requestedFields(v44, v45, v46);
          objc_msgSend_addFields_(v47, v48, (uint64_t)v40);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v49, (uint64_t)&v82, v86, 16);
      }
      while (v36);
    }

    id v3 = v81;
  }
  uint64_t v50 = objc_msgSend_minimumVersionETag(*(void **)(a1 + 32), v24, v25);
  uint64_t v53 = objc_msgSend_recordRetrieveVersionsRequest(v9, v51, v52);
  objc_msgSend_setMinimumVersionEtag_(v53, v54, (uint64_t)v50);

  id v55 = objc_opt_new();
  __int16 v58 = objc_msgSend_recordRetrieveVersionsRequest(v9, v56, v57);
  objc_msgSend_setAssetsToDownload_(v58, v59, (uint64_t)v55);

  uint64_t AssetContent = objc_msgSend_shouldFetchAssetContent(*(void **)(a1 + 32), v60, v61);
  uint64_t v65 = objc_msgSend_recordRetrieveVersionsRequest(v9, v63, v64);
  __int16 v68 = objc_msgSend_assetsToDownload(v65, v66, v67);
  objc_msgSend_setAllAssets_(v68, v69, AssetContent);

  uint64_t v72 = objc_msgSend_recordIDByRequestID(*(void **)(a1 + 32), v70, v71);
  uint64_t v75 = objc_msgSend_request(v9, v73, v74);
  uint64_t v78 = objc_msgSend_operationUUID(v75, v76, v77);
  objc_msgSend_setObject_forKeyedSubscript_(v72, v79, (uint64_t)v3, v78);

  return v9;
}

void sub_1C4FFB190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C4FFB1B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C4FFB1C0(uint64_t a1)
{
}

id sub_1C4FFB1C8(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v7 = objc_msgSend_translator(v3, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  unint64_t v10 = objc_msgSend_recordFromPRecord_error_(v7, v9, (uint64_t)v4, &obj);

  objc_storeStrong((id *)(v8 + 40), obj);
  if (!v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Invalid data from server: %@", buf, 0xCu);
    }
  }
  return v10;
}

void sub_1C4FFBB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1C4FFBBA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend_error(v2, v3, v4);
  objc_msgSend_finishWithError_(WeakRetained, v6, (uint64_t)v5);
}

uint64_t sub_1C4FFCD3C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_sourceRecordID(a2, (const char *)a2, a3);
}

uint64_t sub_1C4FFCD44(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_destinationRecord(a2, (const char *)a2, a3);
}

uint64_t sub_1C4FFCD4C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_recordID(a2, (const char *)a2, a3);
}

id sub_1C4FFCFE0(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v5 = objc_msgSend_sourceRecordID(v2, v3, v4);
  uint64_t v8 = objc_msgSend_zoneID(v5, v6, v7);
  v21[0] = v8;
  uint64_t v11 = objc_msgSend_destinationRecord(v2, v9, v10);

  id v14 = objc_msgSend_recordID(v11, v12, v13);
  uint64_t v17 = objc_msgSend_zoneID(v14, v15, v16);
  v21[1] = v17;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v21, 2);

  return v19;
}

uint64_t sub_1C4FFE540(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
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
            goto LABEL_35;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 32) = v19 != 0;
        goto LABEL_38;
      case 2u:
        uint64_t v24 = objc_alloc_init(CKDPSignedVersionedBlob);
        uint64_t v25 = 16;
        goto LABEL_31;
      case 3u:
        uint64_t v24 = objc_alloc_init(CKDPSignedVersionedBlob);
        uint64_t v25 = 8;
        goto LABEL_31;
      case 4u:
        uint64_t v24 = objc_alloc_init(CKDPSignedVersionedBlob);
        uint64_t v25 = 24;
LABEL_31:
        objc_storeStrong((id *)(a1 + v25), v24);
        if PBReaderPlaceMark() && (sub_1C4E9180C((uint64_t)v24, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

uint64_t sub_1C4FFF4E0(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_23;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_23:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
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
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (v14)
                {
                  uint64_t v23 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_41:
          *(void *)(a1 + 8) = v23;
          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
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
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v29) = 0;
      }
LABEL_45:
      *(_DWORD *)(a1 + 32) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C5000168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5000298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5003E40(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,long long buf)
{
  if (a2 == 1)
  {
    id v37 = objc_begin_catch(a1);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v38 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_INFO, "Warn: Caught an exception when trying to encode record: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1C5003DE8);
  }
  _Unwind_Resume(a1);
}

void sub_1C5003F28(void *a1, void *a2, void *a3)
{
  id v31 = a1;
  id v5 = a2;
  id v6 = a3;
  unsigned int v9 = objc_msgSend_actions(v5, v7, v8);
  uint64_t v12 = objc_msgSend_count(v9, v10, v11);

  if (v12)
  {
    int v15 = objc_msgSend_identifier(v5, v13, v14);
    uint64_t v18 = objc_msgSend_name(v15, v16, v17);

    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v6, v19, (uint64_t)v18);

    if (v20)
    {
      unsigned int v22 = objc_msgSend_objectForKeyedSubscript_(v6, v21, (uint64_t)v18);
      unint64_t v25 = objc_msgSend_actions(v22, v23, v24);
      unsigned int v28 = objc_msgSend_actions(v5, v26, v27);
      objc_msgSend_addObjectsFromArray_(v25, v29, (uint64_t)v28);
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v21, (uint64_t)v5, v18);
      objc_msgSend_addFields_(v31, v30, (uint64_t)v5);
    }
  }
  else
  {
    objc_msgSend_addFields_(v31, v13, (uint64_t)v5);
  }
}

void sub_1C50046A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,long long buf)
{
  if (a2 == 1)
  {
    id v39 = objc_begin_catch(a1);
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v40 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v39;
      _os_log_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_INFO, "Warn: Caught an exception when trying to encode record: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1C50045D4);
  }
  _Unwind_Resume(a1);
}

void sub_1C500704C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    if (objc_msgSend_errorCode(v10, v11, v12) == 1006
      || objc_msgSend_errorCode(v10, v13, v14) == 1009)
    {
      int v15 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v16 = objc_msgSend_reason(v10, v13, v14);
      uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(v15, v17, *MEMORY[0x1E4F19DD8], 1009, @"Invalid predicate: %@");
    }
    else
    {
      uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v13, *MEMORY[0x1E4F19DD8], 1000, @"Unknown error %@");
      uint64_t v16 = 0;
    }

    if (v9) {
      *unsigned int v9 = v18;
    }

    objc_end_catch();
    JUMPOUT(0x1C5006E6CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C5009E68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = (id)objc_opt_new();
  objc_msgSend_setKey_(v10, v7, (uint64_t)v6);

  objc_msgSend_setValues_(v10, v8, (uint64_t)v5);
  objc_msgSend_addObject_(*(void **)(a1 + 32), v9, (uint64_t)v10);
}

void sub_1C5009FF4(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v6 = objc_msgSend_key(v3, v4, v5);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v9 = objc_msgSend_values(v3, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, v26, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        uint64_t v16 = *(void **)(a1 + 32);
        id v17 = objc_alloc(MEMORY[0x1E4F19F58]);
        uint64_t v19 = objc_msgSend_initWithLevel_name_value_(v17, v18, *(unsigned int *)(a1 + 40), v6, v15);
        objc_msgSend_addObject_(v16, v20, (uint64_t)v19);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v21, (uint64_t)&v22, v26, 16);
    }
    while (v12);
  }
}

BOOL sub_1C500E080(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  uint64_t v6 = (int)*MEMORY[0x1E4F1A4B8];
  BOOL v7 = (*(unsigned char *)(a1 + v6) & 1) == 0
    || (v4[v6] & 1) == 0
    || *(_DWORD *)(a1 + (int)*MEMORY[0x1E4F1A4B0]) == *(_DWORD *)&v4[*MEMORY[0x1E4F1A4B0]];
  uint64_t v8 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v5, v9, v8)
    || (uint64_t v11 = (int)*MEMORY[0x1E4F1A4C8], v12 = *(void *)(a1 + v11), v13 = *(void *)&v5[v11], v12 | v13)
    && !objc_msgSend_isEqual_((void *)v12, v10, v13)
    || (uint64_t v14 = (int)*MEMORY[0x1E4F1A4C0], v15 = *(void *)(a1 + v14), v16 = *(void *)&v5[v14], v15 | v16)
    && !objc_msgSend_isEqual_((void *)v15, v10, v16))
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t sub_1C500E164(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_hash(*(void **)(a1 + (int)*MEMORY[0x1E4F1A4C8]), a2, a3);
  return objc_msgSend_hash(*(void **)(a1 + (int)*MEMORY[0x1E4F1A4C0]), v5, v6) ^ v4;
}

void sub_1C500F0DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  objc_msgSend_recordRetrieveRequest(v3, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = objc_msgSend_requestedFields(v11, v7, v8);
  objc_msgSend_addListField_(v9, v10, (uint64_t)v4);
}

BOOL sub_1C5010554(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  BOOL v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 2;
        goto LABEL_30;
      case 2u:
        uint64_t v19 = objc_alloc_init(CKDPProtectionInfo);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || !sub_1C4D5BCB4((uint64_t)v19, a2)) {
          goto LABEL_38;
        }
        goto LABEL_28;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 1;
        goto LABEL_30;
      case 4u:
        uint64_t v19 = (CKDPProtectionInfo *)objc_alloc_init(MEMORY[0x1E4F19F00]);
        objc_storeStrong(a1 + 5, v19);
        if PBReaderPlaceMark() && (CKDPDistributedTimestampsReadFrom())
        {
LABEL_28:
          PBReaderRecallMark();
LABEL_31:

LABEL_32:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_38:

        return 0;
      case 5u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 6;
LABEL_30:
        uint64_t v19 = (CKDPProtectionInfo *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_31;
      case 6u:
        PBReaderReadString();
        uint64_t v19 = (CKDPProtectionInfo *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          objc_msgSend_addReplacedDeltaIdentifiers_(a1, v20, (uint64_t)v19);
        }
        goto LABEL_31;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_32;
    }
  }
}

void sub_1C5011800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1C5011824(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_replacementDeltas(a2, (const char *)a2, a3);
}

void sub_1C501182C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7) {
      objc_msgSend_setError_(WeakRetained, v3, (uint64_t)v7);
    }
    uint64_t v6 = objc_msgSend_stateTransitionGroup(WeakRetained, v3, v4);
    dispatch_group_leave(v6);
  }
}

void sub_1C5011B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1C5011B8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_handleReplaceDeltasRequest_result_(WeakRetained, v8, (uint64_t)v5, v6);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unint64_t v10 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Replace deltas operation deallocated before per request block", v11, 2u);
    }
  }
}

void sub_1C5011C74(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)*MEMORY[0x1E4F1A548];
  if (WeakRetained)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v3);
    }
    uint64_t v4 = (void *)*MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v4;
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      long long v22 = objc_msgSend_ckShortDescription(WeakRetained, v20, v21);
      int v23 = 138543874;
      long long v24 = v19;
      __int16 v25 = 2048;
      id v26 = WeakRetained;
      __int16 v27 = 2114;
      unsigned int v28 = v22;
      _os_log_debug_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_DEBUG, "Replace deltas URL request completed for operation <%{public}@: %p; %{public}@>",
        (uint8_t *)&v23,
        0x20u);
    }
    id v7 = objc_msgSend_error(WeakRetained, v5, v6);

    if (!v7)
    {
      id v10 = objc_loadWeakRetained((id *)(a1 + 40));
      char v13 = objc_msgSend_error(v10, v11, v12);
      objc_msgSend_setError_(WeakRetained, v14, (uint64_t)v13);
    }
    int v15 = objc_msgSend_stateTransitionGroup(WeakRetained, v8, v9);
    dispatch_group_leave(v15);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v3);
    }
    uint64_t v16 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_INFO, "Replace deltas operation deallocated before request completion block", (uint8_t *)&v23, 2u);
    }
  }
}

void sub_1C50122B8()
{
  id v0 = (void *)qword_1EBBD0140;
  qword_1EBBD0140 = (uint64_t)&unk_1F20AC3E8;
}

void sub_1C50125DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C50133D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C5014310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C5014E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C5014ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C5014F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_1C5015AC0(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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

uint64_t sub_1C50167BC(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(CKDPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t sub_1C50171F0(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      uint64_t v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      unsigned int v18 = (const char *)(v10 >> 3);
      if ((v10 >> 3) == 2)
      {
        objc_msgSend_clearOneofValuesForIdentifier((void *)a1, v18, v16);
        *(unsigned char *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 16) = 2;
        uint64_t v25 = PBReaderReadString();
        id v26 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v25;
      }
      else if (v18 == 1)
      {
        objc_msgSend_clearOneofValuesForIdentifier((void *)a1, v18, v16);
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 16) = 1;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 1;
          v29 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0) {
            goto LABEL_40;
          }
          v27 += 7;
          BOOL v14 = v28++ >= 9;
          if (v14)
          {
            uint64_t v29 = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_42:
        *(void *)(a1 + 8) = v29;
      }
      else if (v18)
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        unsigned int v19 = 0;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          unint64_t v22 = v21 + 1;
          int v23 = *(char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v22;
          if (v23 < 0 && v19++ <= 8) {
            continue;
          }
          goto LABEL_43;
        }
        *(unsigned char *)(a2 + *v5) = 1;
      }
LABEL_43:
      ;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptionsHeaderInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = 8;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
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
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1C5018444(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        int v23 = objc_alloc_init(CKCDPCodeServiceRequestServiceClientConfig);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || (sub_1C4F6E8A8((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v19;
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

void sub_1C5018CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1C5018CDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend_error(v2, v3, v4);

  if (v5)
  {
    char v8 = objc_msgSend_error(v2, v6, v7);
    objc_msgSend_finishWithError_(WeakRetained, v9, (uint64_t)v8);
  }
  else
  {
    objc_msgSend_finishWithError_(WeakRetained, v6, 0);
  }
}

uint64_t sub_1C50191C4(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(unsigned char *)(a1 + 28) |= 2u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 16) = v28;
      }
      else if (v18 == 2)
      {
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0) {
            goto LABEL_45;
          }
          v29 += 7;
          BOOL v15 = v30++ >= 9;
          if (v15)
          {
            uint64_t v31 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_47:
        *(void *)(a1 + 8) = v31;
      }
      else if (v18 == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 28) |= 4u;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_41;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_43:
        *(_DWORD *)(a1 + 24) = v21;
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

void sub_1C5019A14()
{
  id v0 = (void *)qword_1EBBD0150;
  qword_1EBBD0150 = (uint64_t)&unk_1F20AC410;
}

void sub_1C501A1D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C501A3C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C501A454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C501A634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

uint64_t sub_1C501BB2C(void *a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  long long v82 = objc_msgSend_startDate(v3, v4, v5);
  objc_msgSend_duration(v3, v6, v7);
  double v9 = v8;
  objc_msgSend_queueing(v3, v10, v11);
  double v13 = v12;
  objc_msgSend_executing(v3, v14, v15);
  double v17 = v16;
  uint64_t v81 = objc_msgSend_bytesUploaded(v3, v18, v19);
  uint64_t v80 = objc_msgSend_bytesDownloaded(v3, v20, v21);
  uint64_t v79 = objc_msgSend_connections(v3, v22, v23);
  uint64_t v78 = objc_msgSend_connectionsCreated(v3, v24, v25);
  uint64_t v77 = objc_msgSend_bytesFulfilledByPeers(v3, v26, v27);
  uint64_t v76 = objc_msgSend_bytesFulfilledLocally(v3, v28, v29);
  uint64_t v75 = objc_msgSend_bytesResumed(v3, v30, v31);
  uint64_t v74 = objc_msgSend_totalBytesByChunkProfile(v3, v32, v33);
  uint32_t v73 = objc_msgSend_chunkCountByChunkProfile(v3, v34, v35);
  long long v38 = objc_msgSend_fileCountByChunkProfile(v3, v36, v37);
  char v72 = objc_msgSend_walrusEnabled(v3, v39, v40);
  uint64_t v71 = objc_msgSend_zoneishKeysRolled(v3, v41, v42);
  uint64_t v45 = objc_msgSend_perRecordKeysRolled(v3, v43, v44);
  uint64_t v48 = objc_msgSend_zoneKeysRolled(v3, v46, v47);
  uint64_t v51 = objc_msgSend_shareKeysRolled(v3, v49, v50);
  uint64_t v54 = objc_msgSend_keyRollsSkippedBySizeCheck(v3, v52, v53);
  uint64_t v57 = objc_msgSend_zoneKeysRemoved(v3, v55, v56);
  uint64_t v60 = objc_msgSend_zoneishKeysRemoved(v3, v58, v59);
  uint64_t v63 = objc_msgSend_recordKeysRemoved(v3, v61, v62);
  uint64_t v66 = objc_msgSend_keysNotRemoved(v3, v64, v65);

  char v70 = v72;
  uint64_t v68 = objc_msgSend_initWithStartDate_duration_queueing_executing_bytesUploaded_bytesDownloaded_connections_connectionsCreated_bytesFulfilledByPeers_bytesFulfilledLocally_bytesResumed_totalBytesByChunkProfile_chunkCountByChunkProfile_fileCountByChunkProfile_walrusEnabled_zoneishKeysRolled_perRecordKeysRolled_zoneKeysRolled_shareKeysRolled_keyRollsSkippedBySizeCheck_zoneKeysRemoved_zoneishKeysRemoved_recordKeysRemoved_keysNotRemoved_(a1, v67, (uint64_t)v82, v81, v80, v79, v78, v77, v9, v13, v17, v76, v75, v74, v73, v38, v70, v71, v45,
          v48,
          v51,
          v54,
          v57,
          v60,
          v63,
          v66);

  return v68;
}

uint64_t sub_1C501C79C(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        double v17 = objc_alloc_init(CKDPUser);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (sub_1C4EBFF88((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

BOOL CKDPShareIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        id v17 = objc_alloc_init(MEMORY[0x1E4F19F08]);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0) {
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
    id v17 = objc_alloc_init(MEMORY[0x1E4F19F30]);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (CKDPRecordZoneIdentifierReadFrom() & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C501D70C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1C501D754(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v9 = objc_msgSend_anonymousShareSavedBlock(WeakRetained, v7, v8);

  if (v9)
  {
    objc_msgSend_anonymousShareSavedBlock(WeakRetained, v10, v11);
    unint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v12)[2](v12, v13, v5);
  }
}

void sub_1C501D7FC(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v5 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v6 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "Completed CKDAnonymousShareAddURLRequest", (uint8_t *)&v22, 2u);
  }
  unsigned int v9 = objc_msgSend_error(v3, v7, v8);

  if (v9)
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v15 = v12;
      unint64_t v18 = objc_msgSend_error(v3, v16, v17);
      int v22 = 138412290;
      uint64_t v23 = v18;
      _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Error CKDAnonymousShareAddURLRequest: %@", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v19 = objc_msgSend_error(v3, v13, v14);
    objc_msgSend_setError_(WeakRetained, v20, (uint64_t)v19);
  }
  uint64_t v21 = objc_msgSend_stateTransitionGroup(WeakRetained, v10, v11);
  dispatch_group_leave(v21);
}

uint64_t sub_1C501DC58(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_containsMergeableValues(a2, (const char *)a2, a3);
}

uint64_t sub_1C501DE28(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_recordID(a2, (const char *)a2, a3);
}

uint64_t sub_1C5022098(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        unint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t sub_1C5025140(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_35;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else if (v17 == 2)
      {
        uint64_t v26 = PBReaderReadData();
        uint64_t v27 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v26;
      }
      else if (v17 == 1)
      {
        unint64_t v18 = objc_alloc_init(CKDPZoneRetrieveChangesResponseChangedZone);
        objc_msgSend_addChangedZones_((void *)a1, v19, (uint64_t)v18);
        if (!PBReaderPlaceMark() || (sub_1C4F345BC((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

void sub_1C5025BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5025C6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5025CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5025D5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C50273B8(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t sub_1C5027968(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(CKDPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t sub_1C50299D4(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_48;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 80) |= 1u;
          while (2)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
              *(void *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_52:
          uint64_t v37 = 16;
          goto LABEL_61;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 80) |= 4u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v14 = v26++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v21) = 0;
          }
LABEL_56:
          uint64_t v37 = 64;
          goto LABEL_61;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 80) |= 2u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_48;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_48;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_48;
        case 0xBu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_48;
        case 0xCu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_48:
          uint64_t v36 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
        *(void *)(a2 + v32) = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_58;
        }
        v30 += 7;
        BOOL v14 = v31++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_60;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v21) = 0;
      }
LABEL_60:
      uint64_t v37 = 32;
LABEL_61:
      *(_DWORD *)(a1 + v37) = v21;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1C502AF20(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSItems(a2, (const char *)a2, a3);
}

uint64_t sub_1C502AF38(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allRereferenceMMCSPackageItems(a2, (const char *)a2, a3);
}

uint64_t sub_1C502AF50(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSSectionItems(a2, (const char *)a2, a3);
}

uint64_t sub_1C502AF68(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSAndSectionItems(a2, (const char *)a2, a3);
}

void sub_1C502B2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C502B2F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C502B304(uint64_t a1)
{
}

void sub_1C502B30C(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = objc_msgSend_firstMMCSItemError(a2, (const char *)a2, a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void sub_1C502B410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C502B428(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_msgSend_allMMCSSectionItems(a2, (const char *)a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend_count(v6, v7, v8) != 0;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_1C502B578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C502B590(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend_isEmpty(a2, (const char *)a2, a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = result;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1C502B694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C502B6AC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend_isEmpty(a2, (const char *)a2, a3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = result;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1C502C148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C502C174(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C502C184(uint64_t a1)
{
}

void sub_1C502C18C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C502C36C;
  v14[3] = &unk_1E64F8998;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)(a1 + 48);
  long long v15 = *(_OWORD *)(a1 + 32);
  objc_msgSend_setRecordFetchCompletionBlock_(v3, v4, (uint64_t)v14);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  unsigned int v9 = sub_1C502C5EC;
  unint64_t v10 = &unk_1E64F33C0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  uint64_t v11 = *(void *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v5, (uint64_t)&v7);
  objc_msgSend_setFetchOperation_(*(void **)(a1 + 32), v6, (uint64_t)v3, v7, v8, v9, v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_1C502C324(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 80));
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_1C502C36C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_removePackages(v7, v12, v13);
  if (v9)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v15 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = v15;
      unint64_t v23 = (objc_class *)objc_opt_class();
      char v24 = NSStringFromClass(v23);
      uint64_t v27 = objc_msgSend_ckShortDescription(WeakRetained, v25, v26);
      unint64_t v28 = (objc_class *)objc_opt_class();
      char v29 = NSStringFromClass(v28);
      uint64_t v32 = objc_msgSend_ckShortDescription(v11, v30, v31);
      int v35 = 138544898;
      uint64_t v36 = v24;
      __int16 v37 = 2048;
      id v38 = WeakRetained;
      __int16 v39 = 2114;
      uint64_t v40 = v27;
      __int16 v41 = 2114;
      uint64_t v42 = v29;
      __int16 v43 = 2048;
      id v44 = v11;
      __int16 v45 = 2114;
      uint64_t v46 = v32;
      __int16 v47 = 2112;
      id v48 = v9;
      _os_log_error_impl(&dword_1C4CFF000, v22, OS_LOG_TYPE_ERROR, "Repair records operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> could not fetch"
        " original record with error %@",
        (uint8_t *)&v35,
        0x48u);
    }
    objc_msgSend_setError_(v11, v16, (uint64_t)v9);
  }
  else
  {
    char v19 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v14, (uint64_t)v8);
    if (!v19)
    {
      unint64_t v33 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, *(void *)(a1 + 64), *(void *)(a1 + 32), @"CKDRepairAssetsOperation.m", 166, @"recordIDToUUID can never produce a nil value here");
    }
    unsigned int v20 = objc_msgSend_assetOrPackageUUIDToOriginalRecord(v11, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v7, v19);
  }
}

void sub_1C502C5EC(void **a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = objc_msgSend_error(v3, v4, v5);

  id v7 = (void *)*MEMORY[0x1E4F1A548];
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    id v8 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v8;
      char v19 = (objc_class *)objc_opt_class();
      unsigned int v20 = NSStringFromClass(v19);
      unint64_t v23 = objc_msgSend_ckShortDescription(v3, v21, v22);
      char v24 = (objc_class *)objc_opt_class();
      char v25 = NSStringFromClass(v24);
      unint64_t v28 = objc_msgSend_ckShortDescription(WeakRetained, v26, v27);
      uint64_t v31 = objc_msgSend_error(v3, v29, v30);
      int v42 = 138544898;
      __int16 v43 = v20;
      __int16 v44 = 2048;
      id v45 = v3;
      __int16 v46 = 2114;
      __int16 v47 = v23;
      __int16 v48 = 2114;
      uint64_t v49 = v25;
      __int16 v50 = 2048;
      id v51 = WeakRetained;
      __int16 v52 = 2114;
      uint64_t v53 = v28;
      __int16 v54 = 2112;
      id v55 = v31;
      _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed f"
        "etch original records with error %@",
        (uint8_t *)&v42,
        0x48u);
    }
    id v11 = objc_msgSend_error(v3, v9, v10);
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v7);
  }
  BOOL v14 = (void *)*MEMORY[0x1E4F1A508];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_DEBUG))
  {
    id v11 = v14;
    uint64_t v32 = (objc_class *)objc_opt_class();
    unint64_t v33 = NSStringFromClass(v32);
    uint64_t v36 = objc_msgSend_ckShortDescription(v3, v34, v35);
    __int16 v37 = (objc_class *)objc_opt_class();
    id v38 = NSStringFromClass(v37);
    __int16 v41 = objc_msgSend_ckShortDescription(WeakRetained, v39, v40);
    int v42 = 138544642;
    __int16 v43 = v33;
    __int16 v44 = 2048;
    id v45 = v3;
    __int16 v46 = 2114;
    __int16 v47 = v36;
    __int16 v48 = 2114;
    uint64_t v49 = v38;
    __int16 v50 = 2048;
    id v51 = WeakRetained;
    __int16 v52 = 2114;
    uint64_t v53 = v41;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed fet"
      "ch original records",
      (uint8_t *)&v42,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setFetchOperation_(WeakRetained, v13, 0);
  uint64_t v17 = objc_msgSend_stateTransitionGroup(a1[4], v15, v16);
  dispatch_group_leave(v17);
}

void sub_1C502D0A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_1C502C174;
  v25[4] = sub_1C502C184;
  id v26 = (id)objc_opt_new();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1C502C174;
  v23[4] = sub_1C502C184;
  id v24 = (id)objc_opt_new();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C502D3EC;
  void v21[3] = &unk_1E64F1270;
  objc_copyWeak(&v22, &location);
  objc_msgSend_setSaveProgressBlock_(v3, v4, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C502D53C;
  v18[3] = &unk_1E64F89E8;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(v20, &from);
  uint64_t v5 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  v18[5] = v23;
  v20[1] = v5;
  v18[6] = v25;
  objc_msgSend_setSaveCompletionBlock_(v3, v6, (uint64_t)v18);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = sub_1C502D9B8;
  id v12 = &unk_1E64F8A10;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  BOOL v14 = v23;
  long long v15 = v25;
  uint64_t v13 = *(void *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v7, (uint64_t)&v9);
  objc_msgSend_setUploadOperation_(*(void **)(a1 + 32), v8, (uint64_t)v3, v9, v10, v11, v12);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_1C502D36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(v36);
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v38 - 160), 8);
  objc_destroyWeak((id *)(v38 - 112));
  objc_destroyWeak((id *)(v38 - 104));
  _Unwind_Resume(a1);
}

void sub_1C502D3E4()
{
}

void sub_1C502D3EC(uint64_t a1, void *a2, double a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v9 = objc_msgSend_recordName(v5, v7, v8);

  id v12 = objc_msgSend_UUIDToAssetOrPackage(WeakRetained, v10, v11);
  BOOL v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  long long v15 = *MEMORY[0x1E4F1A508];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412546;
    id v17 = v14;
    __int16 v18 = 2048;
    double v19 = a3;
    _os_log_debug_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEBUG, "Progress for upload of repaired asset %@: %.2f", (uint8_t *)&v16, 0x16u);
  }
}

void sub_1C502D53C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v49 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = objc_loadWeakRetained((id *)(a1 + 64));
  int v16 = objc_msgSend_recordName(v9, v14, v15);
  double v19 = objc_msgSend_UUIDToAssetOrPackage(WeakRetained, v17, v18);
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v16);

  if (!v21)
  {
    __int16 v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, *(void *)(a1 + 72), *(void *)(a1 + 32), @"CKDRepairAssetsOperation.m", 282, @"Expected non-nil asset or package in %@", v13);
  }
  id v24 = objc_msgSend_assetOrPackageUUIDToMetadata(WeakRetained, v22, v23);
  id v26 = objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v16);

  if (!v26)
  {
    __int16 v46 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v27, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, *(void *)(a1 + 72), *(void *)(a1 + 32), @"CKDRepairAssetsOperation.m", 284, @"Expected non-nil metadata for asset or package %@ in %@", v21, v13);
  }
  char v29 = (void *)*MEMORY[0x1E4F1A548];
  if (v11)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v29);
    }
    uint64_t v30 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      log = v30;
      __int16 v43 = objc_msgSend_operationID(WeakRetained, v41, v42);
      *(_DWORD *)buf = 138412802;
      __int16 v54 = v21;
      __int16 v55 = 2114;
      uint64_t v56 = v43;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_error_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_ERROR, "Failed to upload asset or package %@ with operation %{public}@: %@", buf, 0x20u);
    }
    id v31 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v31);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v32, (uint64_t)v11, v16);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v29);
    }
    unint64_t v33 = *MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v54 = v21;
      _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Successfully uploaded asset or package %@", buf, 0xCu);
    }
    id v31 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v31);
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v34, (uint64_t)v16);
  }
  objc_sync_exit(v31);

  __int16 v37 = objc_msgSend_assetOrPackageRepairedBlock(WeakRetained, v35, v36);

  if (v37)
  {
    uint64_t v40 = objc_msgSend_callbackQueue(WeakRetained, v38, v39);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C502D95C;
    block[3] = &unk_1E64F0120;
    void block[4] = WeakRetained;
    id v51 = v26;
    id v52 = v11;
    dispatch_async(v40, block);
  }
}

void sub_1C502D93C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C502D95C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_assetOrPackageRepairedBlock(*(void **)(a1 + 32), a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_1C502D9B8(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v6 = objc_msgSend_error(v3, v4, v5);

  id v7 = (void *)*MEMORY[0x1E4F1A548];
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    uint64_t v8 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v8;
      uint64_t v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      char v25 = objc_msgSend_ckShortDescription(v3, v23, v24);
      id v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      uint64_t v30 = objc_msgSend_ckShortDescription(WeakRetained, v28, v29);
      unint64_t v33 = objc_msgSend_error(v3, v31, v32);
      int v44 = 138544898;
      id v45 = v22;
      __int16 v46 = 2048;
      id v47 = v3;
      __int16 v48 = 2114;
      id v49 = v25;
      __int16 v50 = 2114;
      id v51 = v27;
      __int16 v52 = 2048;
      id v53 = WeakRetained;
      __int16 v54 = 2114;
      __int16 v55 = v30;
      __int16 v56 = 2112;
      __int16 v57 = v33;
      _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> finished with error %@",
        (uint8_t *)&v44,
        0x48u);
    }
    id v11 = objc_msgSend_error(v3, v9, v10);
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v7);
  }
  BOOL v14 = (void *)*MEMORY[0x1E4F1A508];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_DEBUG))
  {
    id v11 = v14;
    char v34 = (objc_class *)objc_opt_class();
    uint64_t v35 = NSStringFromClass(v34);
    uint64_t v38 = objc_msgSend_ckShortDescription(v3, v36, v37);
    uint64_t v39 = (objc_class *)objc_opt_class();
    uint64_t v40 = NSStringFromClass(v39);
    __int16 v43 = objc_msgSend_ckShortDescription(WeakRetained, v41, v42);
    int v44 = 138544642;
    id v45 = v35;
    __int16 v46 = 2048;
    id v47 = v3;
    __int16 v48 = 2114;
    id v49 = v38;
    __int16 v50 = 2114;
    id v51 = v40;
    __int16 v52 = 2048;
    id v53 = WeakRetained;
    __int16 v54 = 2114;
    __int16 v55 = v43;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> succeeded",
      (uint8_t *)&v44,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setAssetOrPackageUUIDToUploadError_(WeakRetained, v13, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  objc_msgSend_setUploadedAssetOrPackageUUIDs_(WeakRetained, v15, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  objc_msgSend_setUploadOperation_(WeakRetained, v16, 0);
  double v19 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v17, v18);
  dispatch_group_leave(v19);
}

void sub_1C502E6EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  objc_msgSend_setUseEncryption_(v3, v4, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C502E830;
  v7[3] = &unk_1E64F33C0;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  v7[4] = *(void *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v5, (uint64_t)v7);
  objc_msgSend_setUpdateOperation_(*(void **)(a1 + 32), v6, (uint64_t)v3);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void sub_1C502E7F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1C502E830(void **a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = objc_msgSend_error(v3, v4, v5);

  id v7 = (void *)*MEMORY[0x1E4F1A548];
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    id v8 = (void *)*MEMORY[0x1E4F1A508];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v8;
      double v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      uint64_t v23 = objc_msgSend_ckShortDescription(v3, v21, v22);
      uint64_t v24 = (objc_class *)objc_opt_class();
      char v25 = NSStringFromClass(v24);
      uint64_t v28 = objc_msgSend_ckShortDescription(WeakRetained, v26, v27);
      id v31 = objc_msgSend_error(v3, v29, v30);
      int v42 = 138544898;
      __int16 v43 = v20;
      __int16 v44 = 2048;
      id v45 = v3;
      __int16 v46 = 2114;
      id v47 = v23;
      __int16 v48 = 2114;
      id v49 = v25;
      __int16 v50 = 2048;
      id v51 = WeakRetained;
      __int16 v52 = 2114;
      id v53 = v28;
      __int16 v54 = 2112;
      __int16 v55 = v31;
      _os_log_error_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_ERROR, "Repair asset sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed rep"
        "air record update with error %@",
        (uint8_t *)&v42,
        0x48u);
    }
    id v11 = objc_msgSend_error(v3, v9, v10);
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v7);
  }
  BOOL v14 = (void *)*MEMORY[0x1E4F1A508];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A508], OS_LOG_TYPE_DEBUG))
  {
    id v11 = v14;
    uint64_t v32 = (objc_class *)objc_opt_class();
    unint64_t v33 = NSStringFromClass(v32);
    uint64_t v36 = objc_msgSend_ckShortDescription(v3, v34, v35);
    uint64_t v37 = (objc_class *)objc_opt_class();
    uint64_t v38 = NSStringFromClass(v37);
    __int16 v41 = objc_msgSend_ckShortDescription(WeakRetained, v39, v40);
    int v42 = 138544642;
    __int16 v43 = v33;
    __int16 v44 = 2048;
    id v45 = v3;
    __int16 v46 = 2114;
    id v47 = v36;
    __int16 v48 = 2114;
    id v49 = v38;
    __int16 v50 = 2048;
    id v51 = WeakRetained;
    __int16 v52 = 2114;
    id v53 = v41;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Repair asset sub-operation <%{public}@: %p; %{public}@> for operaiton <%{public}@: %p; %{public}@> completed repair record update",
      (uint8_t *)&v42,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setUpdateOperation_(WeakRetained, v13, 0);
  id v17 = objc_msgSend_stateTransitionGroup(a1[4], v15, v16);
  dispatch_group_leave(v17);
}

void sub_1C502F690(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C502F87C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C502FB5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C502FE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C502FE48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = objc_msgSend_opQueue(WeakRetained, v6, v7);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C502FF30;
    v10[3] = &unk_1E64F0E18;
    id v11 = v8;
    id v12 = v4;
    dispatch_async(v9, v10);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t sub_1C502FF30(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__lockedFetchesAreReady(*(void **)(a1 + 32), a2, a3);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

void sub_1C5030AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1C5030AEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend_fetchCoalescer(WeakRetained, v1, v2);
  objc_msgSend_coalesce_(v3, v4, 0);
}

void sub_1C5030F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C5030FAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_msgSend_fetchCoalescer(WeakRetained, v1, v2);
  objc_msgSend_coalesce_(v3, v4, 0);
}

void sub_1C503118C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C50311B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C50311C0(uint64_t a1)
{
}

void sub_1C50311C8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = objc_msgSend_queuedFetches(*(void **)(a1 + 32), a2, a3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v37, v41, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v38;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v4);
      }
      id v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
      id v13 = objc_msgSend_operationID(*(void **)(a1 + 40), v7, v8);
      char v15 = objc_msgSend_dependentOperationListContainsOperationID_(v12, v14, (uint64_t)v13);

      if (v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v37, v41, 16);
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v17 = objc_msgSend_equivalentRunningFetch(v12, v7, v8);
    uint64_t v16 = objc_msgSend_runningOperationID(v17, v18, v19);

    if (!v16) {
      return;
    }
    uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    while (1)
    {
      uint64_t v23 = objc_msgSend_operationID(v22, v20, v21);
      int isEqualToString = objc_msgSend_isEqualToString_(v16, v24, (uint64_t)v23);

      if (isEqualToString) {
        break;
      }
      uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v29 = objc_msgSend_parentOperation(v28, v26, v27);

      if (v28 == v29)
      {
        uint64_t v35 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v30, v31);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, *(void *)(a1 + 64), *(void *)(a1 + 32), @"CKDPCSFetchAggregator.m", 233, @"I am my parent?");
      }
      uint64_t v32 = objc_msgSend_parentOperation(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v30, v31);
      uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
      char v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;

      uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v22) {
        goto LABEL_18;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
LABEL_9:
    uint64_t v16 = v4;
  }
LABEL_18:
}

void sub_1C5031508(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_signpost(MEMORY[0x1E4F1A3C0], a2, a3);
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_log(v4, v5, v6);
    uint64_t v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v8))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v13;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of record %@", buf, 0xCu);
      }
    }
  }
  BOOL v14 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  char v15 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = v16;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Enqueuing fetch of record %@", buf, 0xCu);
  }
  id v17 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = objc_opt_class();
  uint64_t v21 = objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v17, v20, v18, v19);
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 48);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  void v46[2] = sub_1C50318C4;
  v46[3] = &unk_1E64F8A78;
  id v24 = v7;
  id v47 = v24;
  id v48 = *(id *)(a1 + 56);
  objc_msgSend_addRequestForRecordID_forOperation_withCompletionHandler_(v21, v25, v22, v23, v46);
  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(*(void **)(a1 + 48), v26, v27),
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v28, v29, @"DelayPCSRecordFetch"),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        int v33 = objc_msgSend_BOOLValue(v30, v31, v32),
        v30,
        v28,
        v33))
  {
    if (*v14 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v34 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v34, OS_LOG_TYPE_INFO, "Posting notification now", buf, 2u);
    }
    long long v37 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v35, v36);
    objc_msgSend_postNotificationName_object_(v37, v38, @"com.apple.cloudkit.DelayPCSRecordFetch", 0);

    dispatch_time_t v39 = dispatch_time(0, 1000000000);
    uint64_t v42 = objc_msgSend_opQueue(*(void **)(a1 + 40), v40, v41);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C50319B4;
    block[3] = &unk_1E64F05C8;
    void block[4] = *(void *)(a1 + 40);
    dispatch_after(v39, v42, block);
  }
  else
  {
    __int16 v43 = objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v26, v27);
    objc_msgSend_coalesce_(v43, v44, 0);
  }
}

void sub_1C50318C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  os_signpost_id_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_log(v12, v9, v10);
    uint64_t v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", v18, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1C50319B4(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_fetchCoalescer(*(void **)(a1 + 32), a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v4, v3, 0);
}

void sub_1C5031AFC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_signpost(MEMORY[0x1E4F1A3C0], a2, a3);
  id v7 = v4;
  if (v4)
  {
    id v8 = objc_msgSend_log(v4, v5, v6);
    uint64_t v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v8))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v13;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of share %@", buf, 0xCu);
      }
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v14 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v15;
    _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Enqueuing fetch of share %@", buf, 0xCu);
  }
  uint64_t v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = objc_opt_class();
  uint64_t v20 = objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v16, v19, v17, v18);
  uint64_t v21 = *(void **)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 48);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C5031D60;
  v29[3] = &unk_1E64F8AA0;
  id v30 = v7;
  id v31 = v21;
  id v32 = *(id *)(a1 + 56);
  id v23 = v7;
  objc_msgSend_addRequestForRecordID_forOperation_withCompletionHandler_(v20, v24, (uint64_t)v31, v22, v29);
  uint64_t v27 = objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v25, v26);
  objc_msgSend_coalesce_(v27, v28, 0);
}

void sub_1C5031D60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  os_signpost_id_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_log(v12, v9, v10);
    uint64_t v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", buf, 2u);
      }
    }
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v18, *MEMORY[0x1E4F19DD8], 2003, @"Record with ID %@ is not a share", *(void *)(a1 + 40));

      id v7 = 0;
      id v11 = (id)v19;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1C5031FB4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_signpost(MEMORY[0x1E4F1A3C0], a2, a3);
  id v7 = v4;
  if (v4)
  {
    id v8 = objc_msgSend_log(v4, v5, v6);
    uint64_t v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v8))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v13;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of zone %@", buf, 0xCu);
      }
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  BOOL v14 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v15;
    _os_log_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_INFO, "Enqueuing fetch of zone %@", buf, 0xCu);
  }
  uint64_t v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = objc_opt_class();
  uint64_t v20 = objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v16, v19, v17, v18);
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  id v31 = sub_1C5032200;
  id v32 = &unk_1E64F8AC8;
  id v33 = v7;
  uint64_t v22 = *(void *)(a1 + 48);
  id v34 = *(id *)(a1 + 56);
  id v23 = v7;
  objc_msgSend_addRequestForZoneID_forOperation_withCompletionHandler_(v20, v24, v21, v22, &v29);
  uint64_t v27 = objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v25, v26, v29, v30, v31, v32);
  objc_msgSend_coalesce_(v27, v28, 0);
}

void sub_1C5032200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  os_signpost_id_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_log(v12, v9, v10);
    uint64_t v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C4CFF000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", v18, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1C5032378(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v2 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = v5;
    _os_log_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_INFO, "PCSFetchAggregator %p was cancelled", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = objc_msgSend_queuedFetches(*(void **)(a1 + 32), v3, v4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v28, v33, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_cancelFetchOperation(*(void **)(*((void *)&v28 + 1) + 8 * i), v9, v10);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v28, v33, 16);
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = objc_msgSend_runningFetches(*(void **)(a1 + 32), v14, v15, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v24, v32, 16);
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_cancelFetchOperation(*(void **)(*((void *)&v24 + 1) + 8 * j), v19, v20);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v24, v32, 16);
    }
    while (v21);
  }
}

void sub_1C5032710()
{
  id v0 = (void *)qword_1EBBCDF18;
  qword_1EBBCDF18 = (uint64_t)&unk_1F20AC438;
}

uint64_t sub_1C50328E8(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
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

void sub_1C5033434(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_error(a1[4], a2, a3);
  if (v4)
  {

    goto LABEL_3;
  }
  int v15 = objc_msgSend_serverChangeTokenUpdatedBlock(a1[4], v5, v6);

  if (!v15)
  {
LABEL_3:
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = a1[5];
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v44, v55, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v45;
      while (1)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v7);
        }
        BOOL v14 = objc_msgSend_perRequestGroup(a1[8], v10, v11);
        dispatch_group_leave(v14);

        if (!--v12)
        {
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v44, v55, 16);
          if (!v12) {
            break;
          }
        }
      }
    }
    goto LABEL_20;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = a1[5];
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v16, (uint64_t)&v51, v56, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v42 = v49;
    uint64_t v43 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(v7);
        }
        uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(a1[6], v18, v21, v42);
        char v24 = objc_msgSend_objectForKeyedSubscript_(a1[7], v23, v21);
        long long v27 = objc_msgSend_resultServerChangeTokenData(v22, v25, v26);

        if (v27)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F1A388]);
          id v33 = objc_msgSend_resultServerChangeTokenData(v22, v31, v32);
          long long v27 = objc_msgSend_initWithData_(v30, v34, (uint64_t)v33);
        }
        objc_msgSend_serverChangeTokenUpdatedBlock(a1[4], v28, v29);
        uint64_t v35 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v38 = objc_msgSend_status(v22, v36, v37);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v49[0] = sub_1C5033740;
        v49[1] = &unk_1E64F0680;
        v49[2] = a1[4];
        id v50 = a1[8];
        ((void (**)(void, uint64_t, void *, uint64_t, void *, void *))v35)[2](v35, v21, v27, v38, v24, v48);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v18, (uint64_t)&v51, v56, 16);
    }
    while (v19);
  }
LABEL_20:

  uint64_t v41 = objc_msgSend_fetchRecordsGroup(a1[4], v39, v40);
  dispatch_group_leave(v41);
}

void sub_1C5033740(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v6 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      char v8 = *(void **)(a1 + 32);
      uint64_t v9 = v6;
      uint64_t v12 = objc_msgSend_operationID(v8, v10, v11);
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Finishing daemon operation %{public}@ due to client-returned error %@", (uint8_t *)&v14, 0x16u);
    }
    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v5);
  }
  uint64_t v13 = objc_msgSend_perRequestGroup(*(void **)(a1 + 40), v3, v4);
  dispatch_group_leave(v13);
}

void sub_1C5033B84(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if (objc_msgSend_status(v5, v6, v7))
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v8, (uint64_t)v20);

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1A388]);
      uint64_t v13 = objc_msgSend_resultServerChangeTokenData(v5, v11, v12);
      int v15 = objc_msgSend_initWithData_(v10, v14, (uint64_t)v13);

      id v16 = objc_alloc(MEMORY[0x1E4F1A030]);
      uint64_t v18 = objc_msgSend_initWithPreviousServerChangeToken_(v16, v17, (uint64_t)v15);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 40), v19, (uint64_t)v18, v20);
    }
  }
}

void sub_1C5033F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1C5033F4C(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [CKDRecordResponse alloc];
  uint64_t v7 = objc_msgSend_recordID(v3, v5, v6);
  id v10 = objc_msgSend_etag(v3, v8, v9);
  uint64_t v12 = objc_msgSend_initWithRecordID_record_etag_(v4, v11, (uint64_t)v7, v3, v10);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v18[0] = v12;
  int v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v18, 1);
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend__handleChangedRecords_perRequestSchedulerInfo_(WeakRetained, v17, (uint64_t)v15, v16);
}

void sub_1C5035580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_1C50355D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C50355E0(uint64_t a1)
{
}

void sub_1C50355E8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    id v5 = a2;
    objc_msgSend_appendString_(v4, v6, @", ");
  }
  else
  {
    char v8 = (void *)MEMORY[0x1E4F28E78];
    id v9 = a2;
    uint64_t v12 = objc_msgSend_string(v8, v10, v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  objc_msgSend_appendString_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7, (uint64_t)a2);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

uint64_t sub_1C5036200(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
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
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_48;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_48;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_58:
        uint64_t v39 = 40;
        goto LABEL_63;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 96) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_62:
        uint64_t v39 = 56;
LABEL_63:
        *(_DWORD *)(a1 + v39) = v21;
        goto LABEL_68;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_48;
      case 6u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_48;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_48;
      case 9u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                uint64_t v33 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v33 = 0;
        }
LABEL_67:
        *(void *)(a1 + 8) = v33;
        goto LABEL_68;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 80;
LABEL_48:
        uint64_t v37 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_68;
      case 0xBu:
        uint64_t v38 = objc_alloc_init(CKCDPCodeServiceRequestOperationGroup);
        objc_storeStrong((id *)(a1 + 72), v38);
        if (!PBReaderPlaceMark() || (sub_1C4F02D64((uint64_t)v38, a2) & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_54;
      case 0xCu:
        uint64_t v38 = objc_alloc_init(CKCDPCodeServiceRequestDatabaseOwner);
        objc_storeStrong((id *)(a1 + 48), v38);
        if PBReaderPlaceMark() && (sub_1C50171F0((uint64_t)v38, a2))
        {
LABEL_54:
          PBReaderRecallMark();

LABEL_68:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_70:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_68;
    }
  }
}

uint64_t sub_1C5037350()
{
  id v0 = [CKDProcessScopedStateManager alloc];
  qword_1EBBD0160 = objc_msgSend_initInternal(v0, v1, v2);
  return MEMORY[0x1F41817F8]();
}

void sub_1C5037738(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, a3);
  uint64_t v7 = objc_msgSend_metadataCache(v4, v5, v6);
  unint64_t v10 = objc_msgSend_knownAppContainerAccountTuples(v7, v8, v9);

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v10;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v67, v71, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v68 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        char v19 = objc_msgSend_appContainerTuple(v18, v13, v14);
        uint64_t v22 = objc_msgSend_applicationID(v19, v20, v21);
        char v25 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v22, v23, v24);
        unint64_t v28 = v25;
        if (v25)
        {
          id v29 = v25;
        }
        else
        {
          id v30 = objc_msgSend_appContainerTuple(v18, v26, v27);
          objc_msgSend_applicationID(v30, v31, v32);
          uint64_t v66 = v18;
          uint64_t v33 = a1;
          uint64_t v34 = v15;
          v36 = uint64_t v35 = v16;
          objc_msgSend_applicationBundleIdentifier(v36, v37, v38);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v16 = v35;
          uint64_t v15 = v34;
          a1 = v33;
          uint64_t v18 = v66;
        }
        if (objc_msgSend_isEqualToString_(v29, v39, *(void *)(a1 + 32)))
        {
          uint64_t v42 = *(void **)(a1 + 40);
          uint64_t v43 = objc_msgSend_appContainerTuple(v18, v40, v41);
          long long v46 = objc_msgSend_containerID(v43, v44, v45);
          id v49 = objc_msgSend_containerIdentifier(v46, v47, v48);
          LODWORD(v42) = objc_msgSend_containsObject_(v42, v50, (uint64_t)v49);

          if (v42)
          {
            long long v53 = objc_msgSend_appContainerTuple(v18, v51, v52);
            uint64_t v56 = objc_msgSend_personaID(v53, v54, v55);
            BOOL v57 = CKAdoptPersonaID(v56);

            if (v57)
            {
              uint64_t v60 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v58, v59);
              uint64_t v63 = objc_msgSend_tokenRegistrationScheduler(v60, v61, v62);
              objc_msgSend_unregisterTokenForAppContainerAccountTuple_(v63, v64, (uint64_t)v18);
            }
          }
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v67, v71, 16);
    }
    while (v15);
  }
}

void sub_1C5037BD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_INFO, "Resetting TCC access", v5, 2u);
  }
  TCCAccessReset();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1C5038098(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend_dataContainerURL(*(void **)(a1 + 32), a2, a3);
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v3, v4, @"Library/Caches/CloudKit", 1);
    uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v7, v8);
    uint64_t v12 = objc_msgSend_absoluteString(v6, v10, v11);
    int v14 = objc_msgSend_fileExistsAtPath_(v9, v13, (uint64_t)v12);

    if (v14)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = v15;
        uint64_t v21 = objc_msgSend_absoluteString(v6, v19, v20);
        uint64_t v24 = objc_msgSend_CKSanitizedPath(v21, v22, v23);
        int v27 = 138412290;
        unint64_t v28 = v24;
        _os_log_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_INFO, "Removing cache at %@", (uint8_t *)&v27, 0xCu);
      }
      char v25 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v16, v17);
      objc_msgSend_removeItemAtURL_error_(v25, v26, (uint64_t)v6, 0);
    }
  }
}

uint64_t sub_1C5038240(uint64_t a1)
{
  uint64_t result = CKAdoptPersonaID(*(void **)(a1 + 32));
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void sub_1C503878C(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C503882C;
  v4[3] = &unk_1E64F8BE0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v2, v3, (uint64_t)v4);
}

void sub_1C503882C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  id v169 = a2;
  id v4 = a3;
  v170 = objc_msgSend_operationInfo(v4, v5, v6);
  id v171 = v170;
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v8 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F1A500];
  unint64_t v10 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    char v13 = v10;
    uint64_t v16 = objc_msgSend_operationID(v170, v14, v15);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Found outstanding operation ID %{public}@", buf, 0xCu);
  }
  uint64_t v17 = objc_msgSend_appContainerTuple(v169, v11, v12);
  uint64_t v20 = objc_msgSend_personaID(v17, v18, v19);
  int isOperationAllowedIndependentlyInSyncBubble = CKAdoptPersonaID(v20);

  dispatch_block_t v22 = *v8;
  if ((isOperationAllowedIndependentlyInSyncBubble & 1) == 0)
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v22);
    }
    os_log_t v36 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = v36;
      uint64_t v42 = objc_msgSend_appContainerTuple(v169, v40, v41);
      uint64_t v45 = objc_msgSend_personaID(v42, v43, v44);
      uint64_t v48 = objc_msgSend_operationID(v170, v46, v47);
      objc_msgSend_sharedManager(MEMORY[0x1E4FB36F8], v49, v50);
      long long v51 = v9;
      v53 = uint64_t v52 = v7;
      objc_msgSend_currentPersona(v53, v54, v55);
      uint64_t v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v173 = 2112;
      v174 = v48;
      __int16 v175 = 2112;
      v176 = v56;
      _os_log_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_INFO, "Could not adopt persona ID %@ for long-lived operation %@. Current persona is %@", buf, 0x20u);

      uint64_t v7 = v52;
      uint64_t v9 = v51;

      uint64_t v8 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    }
    BOOL v57 = *(void **)(a1 + 32);
    uint64_t v29 = objc_msgSend_operationID(v170, v37, v38);
    objc_msgSend_addObject_(v57, v58, (uint64_t)v29);
    goto LABEL_15;
  }
  if (*v7 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v22);
  }
  os_log_t v23 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    unsigned int v26 = v23;
    uint64_t v29 = objc_msgSend_appContainerTuple(v169, v27, v28);
    uint64_t v32 = objc_msgSend_personaID(v29, v30, v31);
    uint64_t v35 = objc_msgSend_operationID(v170, v33, v34);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v32;
    __int16 v173 = 2112;
    v174 = v35;
    _os_log_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_INFO, "Adopted persona with ID %@ successfully for long-lived operation %@.", buf, 0x16u);

LABEL_15:
  }
  uint64_t v59 = objc_msgSend_retryNumber(v4, v24, v25);
  uint64_t v62 = objc_msgSend_integerValue(v59, v60, v61);

  uint64_t v65 = objc_msgSend_lastAttemptDate(v4, v63, v64);

  uint64_t v68 = -1;
  if (v65 && v62 >= 1)
  {
    long long v69 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v66, v67);
    uint64_t v72 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v70, v71);
    uint64_t v74 = objc_msgSend_components_fromDate_toDate_options_(v69, v73, 128, v65, v72, 0);

    uint64_t v68 = objc_msgSend_second(v74, v75, v76);
  }
  if (!isOperationAllowedIndependentlyInSyncBubble) {
    goto LABEL_35;
  }
  uint64_t v77 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v66, v67);
  int v80 = objc_msgSend_longlivedOperationMaxRetryCount(v77, v78, v79);

  if (v62 > v80) {
    goto LABEL_34;
  }
  long long v83 = objc_msgSend_ckOperationClassName(v170, v81, v82);

  if (!v83)
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v8);
    }
    os_log_t v102 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_FAULT))
    {
      v164 = v102;
      v167 = objc_msgSend_operationID(v170, v165, v166);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v167;
      _os_log_fault_impl(&dword_1C4CFF000, v164, OS_LOG_TYPE_FAULT, "Error preparing for long-lived operation %@. Operation class name missing.", buf, 0xCu);
    }
LABEL_34:
    id v103 = *(void **)(a1 + 32);
    v104 = objc_msgSend_operationID(v170, v81, v82);
    objc_msgSend_addObject_(v103, v105, (uint64_t)v104);

    int isOperationAllowedIndependentlyInSyncBubble = 0;
    goto LABEL_35;
  }
  if (CKIsRunningInSyncBubble())
  {
    v86 = objc_msgSend_ckOperationClassName(v170, v84, v85);
    uint64_t v89 = objc_msgSend_appContainerTuple(v169, v87, v88);
    long long v92 = objc_msgSend_containerID(v89, v90, v91);
    int isOperationAllowedIndependentlyInSyncBubble = _isOperationAllowedIndependentlyInSyncBubble(v86, v92);

    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v93 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
      uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
      goto LABEL_37;
    }
    if (isOperationAllowedIndependentlyInSyncBubble) {
      long long v94 = @"Allowing";
    }
    else {
      long long v94 = @"Denying";
    }
    long long v95 = v93;
    __int16 v98 = objc_msgSend_operationID(v170, v96, v97);
    objc_msgSend_ckOperationClassName(v170, v99, v100);
    uint64_t v101 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v94;
    __int16 v173 = 2114;
    v174 = v98;
    __int16 v175 = 2114;
    v176 = v101;
    _os_log_impl(&dword_1C4CFF000, v95, OS_LOG_TYPE_INFO, "%@ operation %{public}@ of class %{public}@ from running in sync bubble", buf, 0x20u);

    uint64_t v8 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  }
  else
  {
    int isOperationAllowedIndependentlyInSyncBubble = 1;
  }
LABEL_35:
  if (*v7 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], *v8);
  }
LABEL_37:
  os_log_t v106 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v109 = v68;
    v110 = v65;
    v111 = v9;
    v112 = v7;
    v113 = v8;
    if (isOperationAllowedIndependentlyInSyncBubble) {
      v114 = &stru_1F2044F30;
    }
    else {
      v114 = @" not";
    }
    v115 = v106;
    v118 = objc_msgSend_operationID(v170, v116, v117);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v114;
    uint64_t v8 = v113;
    uint64_t v7 = v112;
    uint64_t v9 = v111;
    uint64_t v65 = v110;
    __int16 v173 = 2114;
    v174 = v118;
    __int16 v175 = 2048;
    v176 = (NSString *)(v62 + 1);
    __int16 v177 = 2048;
    uint64_t v178 = v109;
    _os_log_impl(&dword_1C4CFF000, v115, OS_LOG_TYPE_INFO, "Will%@ enqueue outstanding operation ID %{public}@ for retry number %ld. Seconds since last retry:%ld", buf, 0x2Au);
  }
  if (isOperationAllowedIndependentlyInSyncBubble)
  {
    v119 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v107, v108);
    v122 = objc_msgSend_sharedDetachedContainers(CKDContainer, v120, v121);
    v124 = objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v123, (uint64_t)v169, v119, v122);

    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v8);
    }
    os_log_t v125 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v128 = v125;
      v131 = objc_msgSend_operationID(v170, v129, v130);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v131;
      __int16 v173 = 2112;
      v174 = v124;
      _os_log_impl(&dword_1C4CFF000, v128, OS_LOG_TYPE_INFO, "Starting outstanding operation ID %{public}@ for container %@", buf, 0x16u);
    }
    v132 = objc_msgSend_ckOperationClassName(v170, v126, v127);
    v134 = objc_msgSend_substringFromIndex_(v132, v133, 2);

    objc_msgSend_stringWithFormat_(NSString, v135, @"perform%@:withBlock:", v134);
    v136 = (NSString *)objc_claimAutoreleasedReturnValue();
    SEL v137 = NSSelectorFromString(v136);
    if (objc_opt_respondsToSelector())
    {
      *(void *)buf = &unk_1F2044C90;
      v139 = (void *)MEMORY[0x1E4F1CA18];
      v140 = objc_msgSend_methodSignatureForSelector_(v124, v138, (uint64_t)v137);
      v142 = objc_msgSend_invocationWithMethodSignature_(v139, v141, (uint64_t)v140);

      objc_msgSend_retainArguments(v142, v143, v144);
      objc_msgSend_setTarget_(v142, v145, (uint64_t)v124);
      objc_msgSend_setSelector_(v142, v146, (uint64_t)v137);
      objc_msgSend_setArgument_atIndex_(v142, v147, (uint64_t)&v171, 2);
      objc_msgSend_setArgument_atIndex_(v142, v148, (uint64_t)buf, 3);
      objc_msgSend_invoke(v142, v149, v150);
    }
    else
    {
      if (*v7 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v8);
      }
      os_log_t v151 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v157 = v151;
        v160 = objc_msgSend_operationID(v170, v158, v159);
        v163 = objc_msgSend_ckOperationClassName(v170, v161, v162);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v160;
        __int16 v173 = 2114;
        v174 = v163;
        __int16 v175 = 2114;
        v176 = v136;
        _os_log_error_impl(&dword_1C4CFF000, v157, OS_LOG_TYPE_ERROR, "Operation %{public}@ with ckOperationClassName %{public}@ doesn't respond to selector %{public}@. Dropping from long lived cache.", buf, 0x20u);
      }
      v154 = *(void **)(a1 + 40);
      v155 = objc_msgSend_operationID(v170, v152, v153);
      objc_msgSend_deleteAllInfoForOperationWithID_(v154, v156, (uint64_t)v155);
    }
  }
}

uint64_t sub_1C5039E9C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_zoneID(a2, (const char *)a2, a3);
}

void sub_1C503D2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_1C503D304(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C503D314(uint64_t a1)
{
}

id sub_1C503D31C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_needsEncryption(v3, v4, v5))
  {
    unint64_t v10 = objc_msgSend_valueID(v3, v6, v7);
    if (!v10 && !*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v11 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v8, *MEMORY[0x1E4F19DD8], 1017, 0, @"Unable to upload mergeable delta without a value ID");
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      char v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    uint64_t v15 = objc_msgSend_recordID(v10, v8, v9);
    if (!v15 && !*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v14, *MEMORY[0x1E4F19DD8], 1017, 0, @"Unable to upload mergeable delta without a record ID");
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void sub_1C503D440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v9 = objc_msgSend_container(*(void **)(a1 + 40), v7, v8);
  uint64_t v12 = objc_msgSend_pcsCache(v9, v10, v11);
  uint64_t v13 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C503D584;
  v16[3] = &unk_1E64F8C50;
  objc_copyWeak(&v20, (id *)(a1 + 56));
  uint64_t v19 = *(void *)(a1 + 48);
  id v14 = v6;
  id v17 = v14;
  id v18 = *(id *)(a1 + 32);
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v12, v15, (uint64_t)v5, v13, 0, v16);

  objc_destroyWeak(&v20);
}

void sub_1C503D570(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C503D584(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      id v53 = v6;
      uint64_t v8 = objc_alloc_init(CKDKeyEnvelopeContext);
      id v54 = v5;
      uint64_t v11 = objc_msgSend_pcs(v5, v9, v10);
      objc_msgSend_setShareProtection_(v8, v12, v11);
      id v52 = WeakRetained;
      uint64_t v15 = objc_msgSend_container(WeakRetained, v13, v14);
      id v18 = objc_msgSend_options(v15, v16, v17);
      objc_msgSend_encryptMergeableValueMetadata(v18, v19, v20);

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v21 = *(id *)(a1 + 32);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, v64, 16);
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v27 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v57 != v27) {
              objc_enumerationMutation(v21);
            }
            uint64_t v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            objc_msgSend_encryptMetadataTernary(v29, v24, v25);
            uint64_t v30 = CKBoolFromCKTernaryWithDefault();
            objc_msgSend_setEncryptMergeableValueMetadata_(v8, v31, v30);
            id v55 = 0;
            char v33 = objc_msgSend_encryptWithContext_error_(v29, v32, (uint64_t)v8, &v55);
            id v34 = v55;
            uint64_t v35 = v34;
            if ((v33 & 1) == 0)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              os_log_t v36 = (void *)*MEMORY[0x1E4F1A510];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
              {
                uint64_t v45 = v36;
                uint64_t v48 = objc_msgSend_metadata(v29, v46, v47);
                long long v51 = objc_msgSend_identifier(v48, v49, v50);
                *(_DWORD *)buf = 138412546;
                id v61 = v51;
                __int16 v62 = 2112;
                uint64_t v63 = v35;
                _os_log_error_impl(&dword_1C4CFF000, v45, OS_LOG_TYPE_ERROR, "Failed to encrypt delta, %@, with error: %@", buf, 0x16u);
              }
              if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
              {
                uint64_t v38 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v37, *MEMORY[0x1E4F19DD8], 5004, v35, @"Failed to encrypt mergeable delta");
                uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
                uint64_t v40 = *(void **)(v39 + 40);
                *(void *)(v39 + 40) = v38;
              }
              goto LABEL_19;
            }
          }
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, v64, 16);
          if (v26) {
            continue;
          }
          break;
        }
      }
LABEL_19:

      id v6 = v53;
      id v5 = v54;
      id WeakRetained = v52;
      goto LABEL_20;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v41 = *MEMORY[0x1E4F1A510];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v6;
      _os_log_error_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_ERROR, "Error fetching PCS to encrypt deltas: %@", buf, 0xCu);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v43 = objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v42, *MEMORY[0x1E4F19DD8], 5001, v6, @"Failed to fetch PCS to encrypt mergeable delta");
      uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(CKDKeyEnvelopeContext **)(v44 + 40);
      *(void *)(v44 + 40) = v43;
LABEL_20:
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_1C503D95C(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v2 = (void *)*MEMORY[0x1E4F1A510];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A510], OS_LOG_TYPE_DEBUG))
  {
    id v4 = (void *)a1[4];
    id v5 = v2;
    uint64_t v8 = objc_msgSend_operationID(v4, v6, v7);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Did encrypt mergeable deltas for operation %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

uint64_t sub_1C503DBB8(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(CKDPShareIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !CKDPShareIdentifierReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
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

void sub_1C503DFD0()
{
  id v0 = (void *)qword_1EBBCDF28;
  qword_1EBBCDF28 = (uint64_t)&unk_1F20AC460;
}

BOOL sub_1C503E1D0(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = objc_alloc_init(CKDPShareIdentifier);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark() && CKDPShareIdentifierReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_28;
          }

          return 0;
        case 2u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 16;
          goto LABEL_27;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_27;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
LABEL_27:
          uint64_t v17 = *(CKDPShareIdentifier **)(a1 + v19);
          *(void *)(a1 + v19) = v18;
LABEL_28:

          goto LABEL_29;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CKDPNotificationSyncResponsePushMessageReadFrom(unsigned char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          a1[116] |= 4u;
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
              goto LABEL_60;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_62:
          a1[112] = v19 != 0;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_53;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          a1[116] |= 2u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_66:
          uint64_t v41 = 48;
          goto LABEL_71;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_53;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_53;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v28 = 0;
          a1[116] |= 1u;
          break;
        case 7u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 32;
          goto LABEL_53;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 16;
          goto LABEL_53;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_53;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_53;
        case 0xBu:
          uint64_t v38 = PBReaderReadString();
          if (v38) {
            objc_msgSend_addTitleLocalizedArguments_(a1, v37, (uint64_t)v38);
          }
          goto LABEL_58;
        case 0xCu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_53;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
LABEL_53:
          uint64_t v39 = *(void **)&a1[v25];
          *(void *)&a1[v25] = v24;

          continue;
        case 0xEu:
          uint64_t v38 = PBReaderReadString();
          if (v38) {
            objc_msgSend_addSubtitleLocalizedArguments_(a1, v40, (uint64_t)v38);
          }
LABEL_58:

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v35 + 1;
        v28 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0) {
          goto LABEL_68;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_70;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v28) = 0;
      }
LABEL_70:
      uint64_t v41 = 8;
LABEL_71:
      *(_DWORD *)&a1[v41] = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL sub_1C5040CD4(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(CKDPProtectionInfoKeysToRemoveProtectionInfoKey);
        objc_msgSend_addKeysToRemove_(a1, v18, (uint64_t)v17);
        if (!PBReaderPlaceMark() || (sub_1C5022098((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadString();
    char v17 = (CKDPProtectionInfoKeysToRemoveProtectionInfoKey *)a1[2];
    a1[2] = v19;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C5041CA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5041D38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C5041DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1C5041EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1C504238C(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C5042404;
  v4[3] = &unk_1E64F6E60;
  void v4[4] = v2;
  return (id)objc_msgSend_performDatabaseOperation_(v2, a2, (uint64_t)v4);
}

void sub_1C5042404(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_INFO, "Removing all container metadata cached info", buf, 2u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v22[0] = @"PushTokens";
  v22[1] = @"AppContainerAccount";
  v22[2] = @"ContainerServerInfo";
  v22[3] = @"ServerConfiguration";
  v22[4] = @"VerifiedPublicKey";
  v22[5] = @"DSIDMap";
  unsigned int v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v22, 6, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, v23, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_deleteFrom_where_bindings_(v5, v12, *(void *)(*((void *)&v17 + 1) + 8 * i), @"1", 0);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, v23, 16);
    }
    while (v13);
  }

  objc_msgSend_inlock_setDateOfLastTokenUpdate_(*(void **)(a1 + 32), v16, 0);
}

id sub_1C5042688(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_performDatabaseOperation_(*(void **)(a1 + 32), a2, (uint64_t)&unk_1F2044CF0);
}

void sub_1C50426B4(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v3 = a2;
  id v5 = objc_msgSend_stringWithFormat_(v2, v4, @"%@ < ?", @"expirationDate");
  char v8 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v6, v7);
  v12[0] = v8;
  unint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v12, 1);
  objc_msgSend_deleteFrom_where_bindings_(v3, v11, @"PushTokens", v5, v10);
}

void sub_1C5042840(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = a2;
  id v6 = objc_msgSend_stringWithFormat_(v3, v5, @"%@ = ?", @"accountID");
  v22[0] = *(void *)(a1 + 32);
  char v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v22, 1);
  objc_msgSend_deleteFrom_where_bindings_(v4, v9, @"ContainerServerInfo", v6, v8);

  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)&v21, 1);
  objc_msgSend_deleteFrom_where_bindings_(v4, v12, @"PushTokens", v6, v11);

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)&v20, 1);
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, @"AppContainerAccount", v6, v14);

  uint64_t v19 = *(void *)(a1 + 32);
  long long v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)&v19, 1);
  objc_msgSend_deleteFrom_where_bindings_(v4, v18, @"DSIDMap", v6, v17);
}

uint64_t sub_1C50429D4()
{
  return 0;
}

uint64_t sub_1C5042A90(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v2 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1C4CFF000, v2, OS_LOG_TYPE_INFO, "Removing container metadata cached info for accountID %@", (uint8_t *)&v6, 0xCu);
  }
  return objc_msgSend_inlock_expungeDataForAccountID_(*(void **)(a1 + 40), v3, *(void *)(a1 + 32));
}

void sub_1C5042BF8(uint64_t a1, const char *a2)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v60[0] = @"accountID";
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v60, 1);
  int v6 = objc_msgSend_select_from_(v3, v5, (uint64_t)v4, @"ContainerServerInfo");

  uint64_t v8 = objc_msgSend_valueForKey_(v6, v7, @"accountID");
  if (objc_msgSend_count(v8, v9, v10))
  {
    unint64_t v12 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v11, (uint64_t)v8);
    int v15 = objc_msgSend_sharedAccountStore(CKDAccountStore, v13, v14);
    long long v18 = objc_msgSend_accountStore(v15, v16, v17);

    uint64_t v48 = v18;
    uint64_t v47 = objc_msgSend_aa_appleAccounts(v18, v19, v20);
    char v22 = objc_msgSend_valueForKeyPath_(v47, v21, @"identifier");
    if (objc_msgSend_count(v22, v23, v24))
    {
      char v26 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v25, (uint64_t)v22);
    }
    else
    {
      char v26 = 0;
    }
    id v49 = v8;
    uint64_t v50 = v6;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v46 = v22;
    unsigned int v27 = (os_log_t *)MEMORY[0x1E4F1A500];
    uint64_t v28 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = v28;
      char v32 = objc_msgSend_allObjects(v26, v30, v31);
      unint64_t v35 = objc_msgSend_allObjects(v12, v33, v34);
      *(_DWORD *)buf = 138412546;
      uint64_t v57 = (uint64_t)v32;
      __int16 v58 = 2112;
      long long v59 = v35;
      _os_log_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_INFO, "Got the following Apple account identifiers from Accounts:\n%@\nCached account identifiers:\n%@", buf, 0x16u);
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v36 = v12;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v51, v55, 16);
    if (v38)
    {
      uint64_t v40 = v38;
      uint64_t v41 = *(void *)v52;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v36);
          }
          uint64_t v43 = *(void *)(*((void *)&v51 + 1) + 8 * v42);
          if ((objc_msgSend_containsObject_(v26, v39, v43) & 1) == 0)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            uint64_t v44 = *v27;
            if (os_log_type_enabled(*v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v57 = v43;
              _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "Removing container metadata cached info for stale accountID %@", buf, 0xCu);
            }
            objc_msgSend_inlock_expungeDataForAccountID_(*(void **)(a1 + 32), v45, v43);
          }
          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v51, v55, 16);
      }
      while (v40);
    }

    uint64_t v8 = v49;
    int v6 = v50;
  }
}

void sub_1C50430B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C50430D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C50430E0(uint64_t a1)
{
}

void sub_1C50430E8(uint64_t a1, const char *a2, uint64_t a3)
{
  v65[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_appContainerTuple(*(void **)(a1 + 32), a2, a3);
  v64[0] = @"applicationID";
  uint64_t v7 = objc_msgSend_applicationID(v4, v5, v6);
  v65[0] = v7;
  v64[1] = @"containerID";
  uint64_t v10 = objc_msgSend_containerID(v4, v8, v9);
  v65[1] = v10;
  v64[2] = @"personaID";
  uint64_t v13 = objc_msgSend_personaID(v4, v11, v12);
  uint64_t v16 = (void *)v13;
  if (v13) {
    uint64_t v17 = (__CFString *)v13;
  }
  else {
    uint64_t v17 = &stru_1F2044F30;
  }
  v65[2] = v17;
  v64[3] = @"accountID";
  uint64_t v18 = objc_msgSend_accountID(*(void **)(a1 + 32), v14, v15);
  uint64_t v20 = (void *)v18;
  if (v18) {
    uint64_t v21 = (__CFString *)v18;
  }
  else {
    uint64_t v21 = &stru_1F2044F30;
  }
  v65[3] = v21;
  char v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v65, v64, 4);

  uint64_t v24 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v23, (uint64_t)v22);
  unsigned int v27 = objc_msgSend_v1(v24, v25, v26);
  uint64_t v31 = objc_msgSend_v2(v24, v28, v29);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v32 = objc_msgSend_stringByAppendingFormat_(v27, v30, @"AND %@ > ?", @"expirationDate");

    unint64_t v35 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v33, v34);
    uint64_t v37 = objc_msgSend_arrayByAddingObject_(v31, v36, (uint64_t)v35);

    uint64_t v31 = (void *)v37;
    unsigned int v27 = (void *)v32;
  }
  uint64_t v38 = *(void **)(a1 + 40);
  v63[0] = @"apsToken";
  v63[1] = @"apsEnvironment";
  uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v63, 2);
  uint64_t v41 = objc_msgSend_select_from_where_bindings_(v38, v40, (uint64_t)v39, @"PushTokens", v27, v31);

  if (objc_msgSend_count(v41, v42, v43))
  {
    __int16 v62 = v22;
    uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v41, v44, 0);
    uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"apsEnvironment");
    uint64_t v50 = objc_msgSend_lowercaseString(v47, v48, v49);
    long long v51 = (void *)v50;
    long long v52 = (void *)*MEMORY[0x1E4F4E1D0];
    if (v50) {
      long long v52 = (void *)v50;
    }
    id v53 = v52;

    uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v45, v54, @"apsToken");
    long long v56 = (void *)v55;
    if (v53 && v55)
    {
      uint64_t v57 = [CKDPushToken alloc];
      uint64_t v59 = objc_msgSend_initWithAPSEnvironmentString_apsToken_(v57, v58, (uint64_t)v53, v56);
      uint64_t v60 = *(void *)(*(void *)(a1 + 48) + 8);
      id v61 = *(void **)(v60 + 40);
      *(void *)(v60 + 40) = v59;
    }
    char v22 = v62;
  }
}

void sub_1C50434DC(uint64_t a1, const char *a2, uint64_t a3)
{
  v31[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_appContainerTuple(*(void **)(a1 + 32), a2, a3);
  v30[0] = @"applicationID";
  uint64_t v7 = objc_msgSend_applicationID(v4, v5, v6);
  v31[0] = v7;
  v30[1] = @"containerID";
  uint64_t v10 = objc_msgSend_containerID(v4, v8, v9);
  v31[1] = v10;
  v30[2] = @"personaID";
  uint64_t v13 = objc_msgSend_personaID(v4, v11, v12);
  uint64_t v16 = (void *)v13;
  if (v13) {
    uint64_t v17 = (__CFString *)v13;
  }
  else {
    uint64_t v17 = &stru_1F2044F30;
  }
  v31[2] = v17;
  v30[3] = @"accountID";
  uint64_t v18 = objc_msgSend_accountID(*(void **)(a1 + 32), v14, v15);
  uint64_t v20 = (void *)v18;
  if (v18) {
    uint64_t v21 = (__CFString *)v18;
  }
  else {
    uint64_t v21 = &stru_1F2044F30;
  }
  v31[3] = v21;
  char v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v31, v30, 4);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C50436A0;
  v27[3] = &unk_1E64F8D30;
  uint64_t v23 = *(void **)(a1 + 40);
  id v28 = *(id *)(a1 + 48);
  id v29 = v22;
  id v24 = v22;
  id v26 = (id)objc_msgSend_performDatabaseOperation_(v23, v25, (uint64_t)v27);
}

void sub_1C50436A0(uint64_t a1, void *a2)
{
  void v34[3] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v3 = (void *)MEMORY[0x1E4F1C9C8];
    id v4 = a2;
    uint64_t v7 = objc_msgSend_dateWithTimeIntervalSinceNow_(v3, v5, v6, 604800.0);
    uint64_t v10 = objc_msgSend_mutableCopy(*(void **)(a1 + 40), v8, v9);
    v33[0] = @"apsToken";
    uint64_t v13 = objc_msgSend_apsToken(*(void **)(a1 + 32), v11, v12);
    v34[0] = v13;
    v33[1] = @"apsEnvironment";
    uint64_t v16 = objc_msgSend_apsEnvironmentString(*(void **)(a1 + 32), v14, v15);
    v33[2] = @"expirationDate";
    v34[1] = v16;
    v34[2] = v7;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v34, v33, 3);
    objc_msgSend_addEntriesFromDictionary_(v10, v19, (uint64_t)v18);

    objc_msgSend_insertOrReplaceInto_values_(v4, v20, @"PushTokens", v10);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1A368];
    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = a2;
    objc_msgSend_equalityClauseAndBindingsForDict_(v21, v24, v22);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v27 = objc_msgSend_v1(v32, v25, v26);
    unint64_t v30 = objc_msgSend_v2(v32, v28, v29);
    objc_msgSend_deleteFrom_where_bindings_(v23, v31, @"PushTokens", v27, v30);
  }
}

void sub_1C50439BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C50439D4(uint64_t a1, const char *a2)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v19[0] = @"applicationID";
  v19[1] = @"containerID";
  v19[2] = @"personaID";
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v19, 3);
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@ = ?", @"accountID");
  uint64_t v8 = *(__CFString **)(a1 + 40);
  if (!v8) {
    uint64_t v8 = &stru_1F2044F30;
  }
  uint64_t v18 = v8;
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)&v18, 1);
  uint64_t v11 = objc_msgSend_select_from_where_bindings_(v3, v10, (uint64_t)v4, @"AppContainerAccount", v7, v9);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C5043B80;
  v16[3] = &unk_1E64F4F90;
  id v17 = *(id *)(a1 + 40);
  uint64_t v13 = objc_msgSend_CKCompactMap_(v11, v12, (uint64_t)v16);
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

id sub_1C5043B80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CKDApplicationID alloc];
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v3, v5, @"applicationID");
  uint64_t v8 = objc_msgSend_initWithSqliteRepresentation_(v4, v7, (uint64_t)v6);

  id v9 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v3, v10, @"containerID");
  uint64_t v13 = objc_msgSend_initWithSqliteRepresentation_(v9, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v3, v14, @"personaID");

  uint64_t v18 = objc_msgSend_CKNilIfLengthZero(v15, v16, v17);

  uint64_t v19 = 0;
  if (v8 && v13)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v20 = [CKDAppContainerTuple alloc];
      uint64_t v22 = objc_msgSend_initWithApplicationID_containerID_personaID_(v20, v21, (uint64_t)v8, v13, v18);
      id v23 = [CKDAppContainerAccountTuple alloc];
      uint64_t v19 = objc_msgSend_initWithAppContainerTuple_accountID_(v23, v24, (uint64_t)v22, *(void *)(a1 + 32));
    }
    else
    {
      uint64_t v19 = 0;
    }
  }

  return v19;
}

void sub_1C5043DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C5043DFC(uint64_t a1, const char *a2)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v16[0] = @"applicationID";
  v16[1] = @"containerID";
  v16[2] = @"personaID";
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v16, 3);
  uint64_t v6 = objc_msgSend_select_from_(v3, v5, (uint64_t)v4, @"AppContainerAccount");

  uint64_t v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F2044D30);
  uint64_t v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v9, (uint64_t)v8);
  uint64_t v13 = objc_msgSend_allObjects(v10, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

id sub_1C5043F10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [CKDApplicationID alloc];
  id v5 = objc_msgSend_objectForKeyedSubscript_(v2, v4, @"applicationID");
  uint64_t v7 = objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);

  id v8 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v2, v9, @"containerID");
  uint64_t v12 = objc_msgSend_initWithSqliteRepresentation_(v8, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v2, v13, @"personaID");

  uint64_t v17 = objc_msgSend_CKNilIfLengthZero(v14, v15, v16);

  uint64_t v18 = 0;
  if (v7 && v12)
  {
    uint64_t v19 = [CKDAppContainerTuple alloc];
    uint64_t v18 = objc_msgSend_initWithApplicationID_containerID_personaID_(v19, v20, (uint64_t)v7, v12, v17);
  }

  return v18;
}

void sub_1C5044138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C5044150(uint64_t a1, const char *a2)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v11[0] = @"applicationID";
  v11[1] = @"containerID";
  v11[2] = @"personaID";
  v11[3] = @"accountID";
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v11, 4);
  uint64_t v6 = objc_msgSend_select_from_(v3, v5, (uint64_t)v4, @"AppContainerAccount");

  uint64_t v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F2044D50);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

id sub_1C5044240(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1C8789E70]();
  id v4 = [CKDApplicationID alloc];
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v5, @"applicationID");
  uint64_t v8 = objc_msgSend_initWithSqliteRepresentation_(v4, v7, (uint64_t)v6);

  id v9 = objc_alloc(MEMORY[0x1E4F19ED8]);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v2, v10, @"containerID");
  uint64_t v13 = objc_msgSend_initWithSqliteRepresentation_(v9, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v2, v14, @"personaID");
  uint64_t v18 = objc_msgSend_CKNilIfLengthZero(v15, v16, v17);

  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v2, v19, @"accountID");
  id v23 = objc_msgSend_CKNilIfLengthZero(v20, v21, v22);

  id v24 = 0;
  if (v8 && v13 && v23)
  {
    uint64_t v25 = [CKDAppContainerTuple alloc];
    unsigned int v27 = objc_msgSend_initWithApplicationID_containerID_personaID_(v25, v26, (uint64_t)v8, v13, v18);
    id v28 = [CKDAppContainerAccountTuple alloc];
    id v24 = objc_msgSend_initWithAppContainerTuple_accountID_(v28, v29, (uint64_t)v27, v23);
  }

  return v24;
}

void sub_1C50444F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C5044510(uint64_t a1, const char *a2, uint64_t a3)
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_appContainerTuple(*(void **)(a1 + 32), a2, a3);
  v58[0] = @"applicationID";
  uint64_t v7 = objc_msgSend_applicationID(v4, v5, v6);
  v59[0] = v7;
  v58[1] = @"containerID";
  uint64_t v10 = objc_msgSend_containerID(v4, v8, v9);
  v59[1] = v10;
  v58[2] = @"personaID";
  uint64_t v13 = objc_msgSend_personaID(v4, v11, v12);
  uint64_t v16 = (void *)v13;
  if (v13) {
    uint64_t v17 = (__CFString *)v13;
  }
  else {
    uint64_t v17 = &stru_1F2044F30;
  }
  v59[2] = v17;
  void v58[3] = @"accountID";
  uint64_t v18 = objc_msgSend_accountID(*(void **)(a1 + 32), v14, v15);
  uint64_t v20 = (void *)v18;
  if (v18) {
    uint64_t v21 = (__CFString *)v18;
  }
  else {
    uint64_t v21 = &stru_1F2044F30;
  }
  v59[3] = v21;
  uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v59, v58, 4);

  id v24 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v23, (uint64_t)v22);
  uint64_t v25 = *(void **)(a1 + 40);
  v57[0] = @"containerOptions";
  v57[1] = @"tokenRegistered";
  unsigned int v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v57, 2);
  unint64_t v30 = objc_msgSend_v1(v24, v28, v29);
  unsigned int v33 = objc_msgSend_v2(v24, v31, v32);
  unint64_t v35 = objc_msgSend_select_from_where_bindings_(v25, v34, (uint64_t)v27, @"AppContainerAccount", v30, v33);

  if (objc_msgSend_count(v35, v36, v37))
  {
    uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v35, v38, 0);
    id v40 = objc_alloc(MEMORY[0x1E4F19EE0]);
    uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v39, v41, @"containerOptions");
    uint64_t v44 = objc_msgSend_initWithSqliteRepresentation_(v40, v43, (uint64_t)v42);

    long long v46 = objc_msgSend_objectForKeyedSubscript_(v39, v45, @"tokenRegistered");
    uint64_t v49 = objc_msgSend_integerValue(v46, v47, v48);

    uint64_t v50 = [CKDAppContainerAccountMetadata alloc];
    uint64_t v52 = objc_msgSend_initWithContainerOptions_tokenRegistered_(v50, v51, (uint64_t)v44, v49);
    uint64_t v53 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v54 = *(void **)(v53 + 40);
    *(void *)(v53 + 40) = v52;
  }
  else
  {
    uint64_t v55 = objc_opt_new();
    uint64_t v56 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v39 = *(void **)(v56 + 40);
    *(void *)(v56 + 40) = v55;
  }
}

void sub_1C50448DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C50448F4(uint64_t a1, const char *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_datePropertyForKey_(*(void **)(a1 + 32), a2, @"lastTokenUpdate");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1C5044A08(uint64_t a1, const char *a2)
{
  return objc_msgSend_inlock_setDateOfLastTokenUpdate_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
}

void sub_1C5044B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C5044B58(uint64_t a1, const char *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend_inlock_applicationMetadataForApplicationID_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

void sub_1C5044BA8(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend_insertOrReplaceInto_values_(v4, v5, @"AppBundle", v3);
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned int v27 = @"applicationID";
  v28[0] = v6;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v28, &v27, 1);
  uint64_t v10 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v9, (uint64_t)v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v11, @"%@ = %@", @"tokenRegistered", &unk_1F20AD038);
  uint64_t v15 = objc_msgSend_v1(v10, v13, v14);
  uint64_t v18 = objc_msgSend_v2(v10, v16, v17);
  objc_msgSend_update_set_where_bindings_limit_(v4, v19, @"AppContainerAccount", v12, v15, v18, 0);

  uint64_t v22 = objc_msgSend_v1(v10, v20, v21);
  uint64_t v25 = objc_msgSend_v2(v10, v23, v24);
  objc_msgSend_deleteFrom_where_bindings_(v4, v26, @"PushTokens", v22, v25);
}

void sub_1C5044E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C5044E54(uint64_t a1, const char *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  v11[0] = @"applicationID";
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v11, 1);
  uint64_t v6 = objc_msgSend_select_from_(v3, v5, (uint64_t)v4, @"AppBundle");

  uint64_t v8 = objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1F2044D70);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

id sub_1C5044F28(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [CKDApplicationID alloc];
  id v5 = objc_msgSend_objectForKeyedSubscript_(v2, v4, @"applicationID");

  uint64_t v7 = objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);
  return v7;
}

void sub_1C50450B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C50450C8(uint64_t a1, const char *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@ IS NOT NULL AND %@ != \"\"", @"applicationContainerPath", @"applicationContainerPath");
  id v4 = *(void **)(a1 + 32);
  v13[0] = @"applicationID";
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v13, 1);
  uint64_t v8 = objc_msgSend_select_from_where_bindings_(v4, v7, (uint64_t)v6, @"AppBundle", v3, 0);

  uint64_t v10 = objc_msgSend_CKCompactMap_(v8, v9, (uint64_t)&unk_1F2044D90);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id sub_1C50451D0(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [CKDApplicationID alloc];
  id v5 = objc_msgSend_objectForKeyedSubscript_(v2, v4, @"applicationID");

  uint64_t v7 = objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);
  return v7;
}

void sub_1C5045308(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C5045398;
  v4[3] = &unk_1E64F6E60;
  uint64_t v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);
}

void sub_1C5045398(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v16 = @"applicationID";
  v17[0] = v2;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v3, v5, (uint64_t)v17, &v16, 1);
  uint64_t v8 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v7, (uint64_t)v6);
  uint64_t v11 = objc_msgSend_v1(v8, v9, v10);
  uint64_t v14 = objc_msgSend_v2(v8, v12, v13);
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, @"AppBundle", v11, v14);
}

void sub_1C5045598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C50455B0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  objc_msgSend_selectAllObjectsOfClass_(v2, v4, v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_lastObject(v10, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1C5045708(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C5045798;
  v4[3] = &unk_1E64F6E60;
  uint64_t v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);
}

void sub_1C5045798(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_msgSend_deleteFrom_where_bindings_(v7, v3, @"ServerConfiguration", @"1", 0);
  objc_msgSend_deleteFrom_where_bindings_(v7, v4, @"VerifiedPublicKey", @"1", 0);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    objc_msgSend_insertOrReplaceObject_(v7, v5, v6);
  }
}

void sub_1C50459C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C50459D8(void *a1, const char *a2)
{
  v56[2] = *MEMORY[0x1E4F143B8];
  v55[0] = @"keyType";
  v55[1] = @"keyID";
  uint64_t v3 = a1[5];
  v56[0] = a1[4];
  v56[1] = v3;
  id v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v56, v55, 2);
  uint64_t v6 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v5, (uint64_t)v4);
  id v7 = (void *)a1[6];
  id v10 = objc_msgSend_v1(v6, v8, v9);
  uint64_t v13 = objc_msgSend_v2(v6, v11, v12);
  uint64_t v15 = objc_msgSend_selectAllFrom_where_bindings_(v7, v14, @"VerifiedPublicKey", v10, v13);

  if ((unint64_t)objc_msgSend_count(v15, v16, v17) >= 2)
  {
    uint64_t v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, a1[8], a1[6], @"CKDMetadataCache.m", 704, @"Unique constraint violation in public key table");
  }
  uint64_t v20 = objc_msgSend_firstObject(v15, v18, v19);
  uint64_t v22 = v20;
  if (v20)
  {
    id v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"keyExpiration");
    double v26 = (double)objc_msgSend_integerValue(v23, v24, v25);

    id v28 = objc_msgSend_objectForKeyedSubscript_(v22, v27, @"protectionSource");
    if (objc_msgSend_length(v28, v29, v30)) {
      uint64_t v31 = v28;
    }
    else {
      uint64_t v31 = 0;
    }
    id v32 = v31;

    id v53 = objc_alloc(MEMORY[0x1E4F1A288]);
    uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v22, v33, @"publicKey");
    unint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v22, v34, @"keyVersion");
    uint64_t v38 = objc_msgSend_integerValue(v35, v36, v37);
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v39, v40, v26);
    uint64_t v41 = v54 = v4;
    objc_msgSend_objectForKeyedSubscript_(v22, v42, @"keyCert");
    uint64_t v43 = v15;
    v45 = uint64_t v44 = v6;
    uint64_t v47 = objc_msgSend_initWithPublicKey_version_expiration_certificateData_protectionSource_(v53, v46, (uint64_t)v52, v38, v41, v45, v32);

    uint64_t v48 = *(void *)(a1[7] + 8);
    uint64_t v49 = *(void **)(v48 + 40);
    *(void *)(v48 + 40) = v47;

    uint64_t v6 = v44;
    uint64_t v15 = v43;

    id v4 = v54;
  }
}

void sub_1C5045DDC(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C5045E98;
  v5[3] = &unk_1E64F6EA8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v4 = (id)objc_msgSend_performDatabaseOperation_(v2, v3, (uint64_t)v5);
}

void sub_1C5045E98(uint64_t a1, void *a2)
{
  v51[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v50[0] = @"keyType";
    v50[1] = @"keyID";
    uint64_t v4 = *(void *)(a1 + 48);
    v51[0] = *(void *)(a1 + 40);
    v51[1] = v4;
    v50[2] = @"publicKey";
    id v5 = a2;
    id v8 = objc_msgSend_publicKey(v3, v6, v7);
    v51[2] = v8;
    v50[3] = @"keyVersion";
    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = objc_msgSend_version(*(void **)(a1 + 32), v10, v11);
    uint64_t v14 = objc_msgSend_numberWithInteger_(v9, v13, v12);
    v51[3] = v14;
    v50[4] = @"keyExpiration";
    uint64_t v15 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v18 = objc_msgSend_expiration(*(void **)(a1 + 32), v16, v17);
    objc_msgSend_timeIntervalSince1970(v18, v19, v20);
    id v23 = objc_msgSend_numberWithDouble_(v15, v21, v22);
    v51[4] = v23;
    v50[5] = @"keyCert";
    objc_msgSend_certData(*(void **)(a1 + 32), v24, v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    v51[5] = v26;
    v50[6] = @"protectionSource";
    uint64_t v29 = objc_msgSend_protectionSource(*(void **)(a1 + 32), v27, v28);
    uint64_t v31 = (void *)v29;
    id v32 = &stru_1F2044F30;
    if (v29) {
      id v32 = (__CFString *)v29;
    }
    v51[6] = v32;
    unsigned int v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v51, v50, 7);
    objc_msgSend_insertOrReplaceInto_values_(v5, v34, @"VerifiedPublicKey", v33);
  }
  else
  {
    unint64_t v35 = *(void **)(a1 + 48);
    id v26 = a2;
    if (objc_msgSend_isEqualToString_(v35, v36, @"*")
      && CKIsRunningInTestHost())
    {
      uint64_t v38 = *(void *)(a1 + 40);
      uint64_t v48 = @"keyType";
      uint64_t v49 = v38;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)&v49, &v48, 1);
    }
    else
    {
      v46[0] = @"keyType";
      v46[1] = @"keyID";
      uint64_t v39 = *(void *)(a1 + 48);
      v47[0] = *(void *)(a1 + 40);
      v47[1] = v39;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v47, v46, 2);
    id v8 = };
    uint64_t v14 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v40, (uint64_t)v8);
    uint64_t v18 = objc_msgSend_v1(v14, v41, v42);
    id v23 = objc_msgSend_v2(v14, v43, v44);
    objc_msgSend_deleteFrom_where_bindings_(v26, v45, @"VerifiedPublicKey", v18, v23);
  }
}

void sub_1C50466B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C50466D0(uint64_t a1, const char *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend_inlock_containerServerInfoForContainerID_accountID_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

void sub_1C5046864(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C5046924;
  v7[3] = &unk_1E64F8D80;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = (id)objc_msgSend_performDatabaseOperation_(v2, v5, (uint64_t)v7);
}

void sub_1C5046924(uint64_t a1, void *a2)
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (*(void *)(a1 + 32))
  {
    id v5 = objc_msgSend_inlock_containerServerInfoForContainerID_accountID_(*(void **)(a1 + 40), v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
    id v6 = objc_opt_new();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v7, *(void *)(a1 + 48), @"containerID");
    objc_msgSend_setObject_forKeyedSubscript_(v6, v8, *(void *)(a1 + 56), @"accountID");
    id v11 = objc_msgSend_publicCloudDBURL(*(void **)(a1 + 32), v9, v10);

    if (v11)
    {
      objc_msgSend_publicCloudDBURL(*(void **)(a1 + 32), v12, v13);
    }
    else
    {
      id v23 = objc_msgSend_publicCloudDBURL(v5, v12, v13);
      id v26 = objc_msgSend_absoluteString(v23, v24, v25);

      if (!v26) {
        goto LABEL_8;
      }
      objc_msgSend_publicCloudDBURL(v5, v27, v28);
    uint64_t v29 = };
    id v32 = objc_msgSend_absoluteString(v29, v30, v31);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v33, (uint64_t)v32, @"publicCloudDBURL");

LABEL_8:
    uint64_t v34 = objc_msgSend_publicShareServiceURL(*(void **)(a1 + 32), v27, v28);

    if (v34)
    {
      objc_msgSend_publicShareServiceURL(*(void **)(a1 + 32), v35, v36);
    }
    else
    {
      uint64_t v37 = objc_msgSend_publicShareServiceURL(v5, v35, v36);
      uint64_t v40 = objc_msgSend_absoluteString(v37, v38, v39);

      if (!v40) {
        goto LABEL_13;
      }
      objc_msgSend_publicShareServiceURL(v5, v41, v42);
    uint64_t v43 = };
    long long v46 = objc_msgSend_absoluteString(v43, v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v47, (uint64_t)v46, @"publicShareServiceURL");

LABEL_13:
    uint64_t v48 = objc_msgSend_publicDeviceServiceURL(*(void **)(a1 + 32), v41, v42);

    if (v48)
    {
      objc_msgSend_publicDeviceServiceURL(*(void **)(a1 + 32), v49, v50);
    }
    else
    {
      long long v51 = objc_msgSend_publicDeviceServiceURL(v5, v49, v50);
      long long v54 = objc_msgSend_absoluteString(v51, v52, v53);

      if (!v54) {
        goto LABEL_18;
      }
      objc_msgSend_publicDeviceServiceURL(v5, v55, v56);
    uint64_t v57 = };
    uint64_t v60 = objc_msgSend_absoluteString(v57, v58, v59);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v61, (uint64_t)v60, @"publicDeviceServiceURL");

LABEL_18:
    __int16 v62 = objc_msgSend_publicCodeServiceURL(*(void **)(a1 + 32), v55, v56);

    if (v62)
    {
      objc_msgSend_publicCodeServiceURL(*(void **)(a1 + 32), v63, v64);
    }
    else
    {
      uint64_t v65 = objc_msgSend_publicCodeServiceURL(v5, v63, v64);
      uint64_t v68 = objc_msgSend_absoluteString(v65, v66, v67);

      if (!v68) {
        goto LABEL_23;
      }
      objc_msgSend_publicCodeServiceURL(v5, v69, v70);
    uint64_t v71 = };
    uint64_t v74 = objc_msgSend_absoluteString(v71, v72, v73);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v75, (uint64_t)v74, @"publicCodeServiceURL");

LABEL_23:
    uint64_t v76 = objc_msgSend_publicMetricsServiceURL(*(void **)(a1 + 32), v69, v70);

    if (v76)
    {
      objc_msgSend_publicMetricsServiceURL(*(void **)(a1 + 32), v77, v78);
    }
    else
    {
      uint64_t v79 = objc_msgSend_publicMetricsServiceURL(v5, v77, v78);
      uint64_t v82 = objc_msgSend_absoluteString(v79, v80, v81);

      if (!v82) {
        goto LABEL_28;
      }
      objc_msgSend_publicMetricsServiceURL(v5, v83, v84);
    uint64_t v85 = };
    uint64_t v88 = objc_msgSend_absoluteString(v85, v86, v87);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, @"publicMetricsServiceURL");

LABEL_28:
    v90 = objc_msgSend_containerScopedUserID(*(void **)(a1 + 32), v83, v84);

    if (v90)
    {
      objc_msgSend_containerScopedUserID(*(void **)(a1 + 32), v91, v92);
    }
    else
    {
      os_log_t v93 = objc_msgSend_containerScopedUserID(v5, v91, v92);

      if (!v93) {
        goto LABEL_33;
      }
      objc_msgSend_containerScopedUserID(v5, v94, v95);
    v96 = };
    objc_msgSend_setObject_forKeyedSubscript_(v6, v97, (uint64_t)v96, @"scopedUserID");

LABEL_33:
    __int16 v98 = objc_msgSend_orgAdminUserID(*(void **)(a1 + 32), v94, v95);

    if (v98)
    {
      objc_msgSend_orgAdminUserID(*(void **)(a1 + 32), v99, v100);
    }
    else
    {
      uint64_t v101 = objc_msgSend_orgAdminUserID(v5, v99, v100);

      if (!v101)
      {
LABEL_38:
        objc_msgSend_insertOrReplaceInto_values_(v4, v102, @"ContainerServerInfo", v6);
        goto LABEL_39;
      }
      objc_msgSend_orgAdminUserID(v5, v102, v103);
    v104 = };
    objc_msgSend_setObject_forKeyedSubscript_(v6, v105, (uint64_t)v104, @"orgAdminUserID");

    goto LABEL_38;
  }
  uint64_t v14 = *(void *)(a1 + 48);
  os_log_t v106 = @"containerID";
  v107[0] = v14;
  id v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v107, &v106, 1);
  id v6 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v15, (uint64_t)v5);
  uint64_t v18 = objc_msgSend_v1(v6, v16, v17);
  uint64_t v21 = objc_msgSend_v2(v6, v19, v20);
  objc_msgSend_deleteFrom_where_bindings_(v4, v22, @"ContainerServerInfo", v18, v21);

LABEL_39:
}

void sub_1C5046E7C(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C5046F0C;
  v4[3] = &unk_1E64F6E60;
  uint64_t v1 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);
}

void sub_1C5046F0C(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v30 = @"containerID";
  v31[0] = v2;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  id v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v3, v5, (uint64_t)v31, &v30, 1);
  id v8 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v7, (uint64_t)v6);
  id v11 = objc_msgSend_v1(v8, v9, v10);
  uint64_t v14 = objc_msgSend_v2(v8, v12, v13);
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, @"ContainerServerInfo", v11, v14);

  uint64_t v18 = objc_msgSend_v1(v8, v16, v17);
  uint64_t v21 = objc_msgSend_v2(v8, v19, v20);
  objc_msgSend_deleteFrom_where_bindings_(v4, v22, @"AppContainerAccount", v18, v21);

  uint64_t v25 = objc_msgSend_v1(v8, v23, v24);
  uint64_t v28 = objc_msgSend_v2(v8, v26, v27);
  objc_msgSend_deleteFrom_where_bindings_(v4, v29, @"PushTokens", v25, v28);
}

void sub_1C5047160(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C5047208;
  v5[3] = &unk_1E64F8D30;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = (id)objc_msgSend_performDatabaseOperation_(v2, v3, (uint64_t)v5);
}

void sub_1C5047208(uint64_t a1, void *a2, void *a3)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v9)
  {
    if (v8)
    {
      v23[0] = @"accountID";
      v23[1] = @"DSID";
      v24[0] = v8;
      v24[1] = v9;
      uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v24, v23, 2);
      objc_msgSend_insertOrReplaceInto_values_(v5, v11, @"DSIDMap", v10);
LABEL_6:
    }
  }
  else if (v8)
  {
    uint64_t v21 = @"accountID";
    uint64_t v22 = v8;
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)&v22, &v21, 1);
    uint64_t v13 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v12, (uint64_t)v10);
    uint64_t v16 = objc_msgSend_v1(v13, v14, v15);
    uint64_t v19 = objc_msgSend_v2(v13, v17, v18);
    objc_msgSend_deleteFrom_where_bindings_(v5, v20, @"DSIDMap", v16, v19);

    goto LABEL_6;
  }
}

void sub_1C50474A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C50474C0(void *a1, const char *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v27 = @"accountID";
  v28[0] = v3;
  id v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v28, &v27, 1);
  id v6 = objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E4F1A368], v5, (uint64_t)v4);
  id v7 = (void *)a1[5];
  id v26 = @"DSID";
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)&v26, 1);
  uint64_t v12 = objc_msgSend_v1(v6, v10, v11);
  uint64_t v15 = objc_msgSend_v2(v6, v13, v14);
  uint64_t v17 = objc_msgSend_select_from_where_bindings_(v7, v16, (uint64_t)v9, @"DSIDMap", v12, v15);

  if (objc_msgSend_count(v17, v18, v19))
  {
    uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v17, v20, 0);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"DSID");
    uint64_t v24 = *(void *)(a1[6] + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

BOOL sub_1C50476E8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, int a7, int a8, char a9, void *a10)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v105 = a3;
  id v17 = a4;
  id v18 = a6;
  uint64_t v21 = objc_msgSend_downloadBaseURL(a1, v19, v20);
  uint64_t v24 = objc_msgSend_downloadURLExpiration(a1, v22, v23);
  uint64_t v27 = objc_msgSend_constructedAssetDownloadURLTemplate(a1, v25, v26);
  uint64_t v30 = (void *)v27;
  if (v24) {
    BOOL v31 = v21 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  if (v31 && !v27)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v32 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v114 = a1;
      _os_log_error_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_ERROR, "Missing required info on %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v33, *MEMORY[0x1E4F19DD8], 1000, @"Missing required info on %@", a1);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if ((a7 & 1) == 0 && !a8)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    unint64_t v35 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v114 = a1;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Not using encryption keys for the asset %@", buf, 0xCu);
      if (v17) {
        goto LABEL_18;
      }
    }
    else if (v17)
    {
LABEL_18:
      v107[0] = @"f";
      v107[1] = @"uk";
      v108[0] = v17;
      v108[1] = @"1234";
      uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v108, v107, 2);
LABEL_57:
      if (v21)
      {
        v90 = objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E4F19E50], v36, (uint64_t)v21, v37);
        objc_msgSend_setDownloadURLTemplate_(a1, v91, (uint64_t)v90);
      }
      if (v30)
      {
        uint64_t v92 = objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E4F19E50], v36, (uint64_t)v30, v37);
        long long v94 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v93, (uint64_t)v92);
        objc_msgSend_setConstructedAssetDownloadURL_(a1, v95, (uint64_t)v94);

        __int16 v98 = objc_msgSend_constructedAssetDownloadURL(a1, v96, v97);

        if (v98)
        {
          id v34 = 0;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v99, *MEMORY[0x1E4F19DD8], 1, @"Couldn't create url from template");
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v100 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v114 = v30;
            _os_log_error_impl(&dword_1C4CFF000, v100, OS_LOG_TYPE_ERROR, "Couldn't create url from template %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v34 = 0;
      }
LABEL_68:

      goto LABEL_69;
    }
    uint64_t v37 = &unk_1F20AC488;
    goto LABEL_57;
  }
  if (!a7)
  {
    if (!a8)
    {
      uint64_t v72 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v28, v29);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, a2, a1, @"CKDAssetExtensions.m", 70, @"Unhandled code path.");

      id v34 = 0;
      goto LABEL_72;
    }
    uint64_t v48 = objc_msgSend_clearAssetKey(a1, v28, v29);
    if (!v48)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 1, @"Couldn't find clear asset key for publishing");
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v88 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v114 = v34;
        _os_log_error_impl(&dword_1C4CFF000, v88, OS_LOG_TYPE_ERROR, "Error find clear asset key: %@", buf, 0xCu);
      }
      goto LABEL_69;
    }
    uint64_t v37 = v48;
    id v34 = 0;
    objc_msgSend_CKBase64URLSafeString(v48, v49, v50);
    goto LABEL_28;
  }
  uint64_t v103 = v18;
  if (a9) {
    goto LABEL_26;
  }
  uint64_t v38 = objc_msgSend_deviceContext(v18, v28, v29);
  uint64_t v41 = objc_msgSend_accountDataSecurityObserver(v38, v39, v40);
  uint64_t v44 = objc_msgSend_account(v18, v42, v43);
  int v46 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v41, v45, (uint64_t)v44, 1);

  if (!v46)
  {
LABEL_26:
    long long v51 = [CKDWrappingContext alloc];
    long long v54 = objc_msgSend_recordID(a1, v52, v53);
    uint64_t v57 = objc_msgSend_signature(a1, v55, v56);
    uint64_t v60 = objc_msgSend_referenceSignature(a1, v58, v59);
    __int16 v62 = objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v51, v61, (uint64_t)v54, v105, 0, v57, v60);

    uint64_t v65 = objc_msgSend_wrappedAssetKey(a1, v63, v64);
    id v106 = 0;
    uint64_t v37 = objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v103, v66, (uint64_t)v65, a5, v62, &v106);
    id v34 = v106;

    if (!v37)
    {
      if (!v34)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v67, *MEMORY[0x1E4F19DD8], 5004, @"Couldn't unwrap asset key for publishing");
        id v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v87 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v114 = v34;
        _os_log_error_impl(&dword_1C4CFF000, v87, OS_LOG_TYPE_ERROR, "Error unwrapping asset key: %@", buf, 0xCu);
      }

      goto LABEL_44;
    }

    id v18 = v103;
    objc_msgSend_CKBase64URLSafeString(v37, v68, v69);
    uint64_t v70 = LABEL_28:;
    v104 = (void *)v70;
    if (v17)
    {
      v111[0] = @"f";
      v111[1] = @"uk";
      v112[0] = v17;
      v112[1] = v70;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v112, v111, 2);
    }
    else
    {
      uint64_t v109 = @"uk";
      uint64_t v110 = v70;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)&v110, &v109, 1);
    uint64_t v75 = };
    if (v21)
    {
      uint64_t v76 = objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E4F19E50], v74, (uint64_t)v21, v75);
      objc_msgSend_setDownloadURLTemplate_(a1, v77, (uint64_t)v76);
    }
    if (v30)
    {
      uint64_t v102 = objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E4F19E50], v74, (uint64_t)v30, v75);
      uint64_t v79 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v78, v102);
      objc_msgSend_setConstructedAssetDownloadURL_(a1, v80, (uint64_t)v79);

      long long v83 = objc_msgSend_constructedAssetDownloadURL(a1, v81, v82);

      if (v83)
      {
        uint64_t v85 = (uint64_t)v34;
        v86 = (void *)v102;
      }
      else
      {
        uint64_t v85 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v84, *MEMORY[0x1E4F19DD8], 1, @"Couldn't create url from template");

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v86 = (void *)v102;
        uint64_t v89 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v114 = v30;
          _os_log_error_impl(&dword_1C4CFF000, v89, OS_LOG_TYPE_ERROR, "Couldn't create url from template %@", buf, 0xCu);
        }
      }

      id v34 = (id)v85;
    }

    goto LABEL_68;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v47, *MEMORY[0x1E4F19DD8], 5013, @"Cannot fill in derivative template due to walrus enabled");
  id v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
  id v18 = v103;
LABEL_69:
  if (a10 && v34)
  {
    id v34 = v34;
    *a10 = v34;
  }
LABEL_72:

  return v34 == 0;
}

uint64_t sub_1C5047FF8(void *a1, const char *a2)
{
  objc_msgSend_setAssetKey_(a1, a2, 0);
  objc_msgSend_setReferenceSignature_(a1, v3, 0);
  objc_msgSend_setDownloadToken_(a1, v4, 0);
  return objc_msgSend_setDownloadTokenExpiration_(a1, v5, 0);
}

uint64_t sub_1C5048050(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = objc_msgSend_contentBaseURL(v4, v5, v6);
  uint64_t v10 = objc_msgSend_owner(v4, v8, v9);
  uint64_t v13 = objc_msgSend_requestor(v4, v11, v12);
  uint64_t v16 = objc_msgSend_signature(v4, v14, v15);
  uint64_t v19 = objc_msgSend_referenceSignature(v4, v17, v18);
  uint64_t v22 = objc_msgSend_authToken(v4, v20, v21);
  uint64_t v25 = objc_msgSend_assetKey(v4, v23, v24);
  uint64_t v60 = objc_msgSend_clearAssetKey(v4, v26, v27);
  if (!v4)
  {
    unint64_t v35 = v16;
    uint64_t v36 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v28, *MEMORY[0x1E4F19DD8], 3011, @"Re-referenced asset not found");
    objc_msgSend_setError_(a1, v37, (uint64_t)v36);

    goto LABEL_31;
  }
  if (v7) {
    BOOL v30 = v10 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  int v34 = !v30 && v13 != 0 && v16 != 0 && v22 != 0;
  if (!v19)
  {
    if (v34) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  if (!v34 || !(v25 | v60))
  {
LABEL_23:
    uint64_t v38 = objc_msgSend_zeroSizeFileSignature(CKDMMCS, v28, v29);
    if (!objc_msgSend_size(v4, v39, v40) && objc_msgSend_isEqualToData_(v16, v41, (uint64_t)v38))
    {

      goto LABEL_26;
    }
    __int16 v58 = v38;
    unint64_t v35 = v16;
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v41, *MEMORY[0x1E4F19DD8], 3011, @"Re-referenced asset missing expected values", v58);
    uint64_t v52 = v13;
    uint64_t v53 = v10;
    v55 = long long v54 = v7;
    objc_msgSend_setError_(a1, v56, (uint64_t)v55);

    id v7 = v54;
    uint64_t v10 = v53;
    uint64_t v13 = v52;

LABEL_31:
    uint64_t v51 = 0;
    goto LABEL_32;
  }
LABEL_26:
  unint64_t v35 = v16;
  objc_msgSend_setContentBaseURL_(a1, v28, (uint64_t)v7);
  objc_msgSend_setOwner_(a1, v42, (uint64_t)v10);
  objc_msgSend_setRequestor_(a1, v43, (uint64_t)v13);
  if (v25) {
    objc_msgSend_setAssetKey_(a1, v44, v25);
  }
  else {
    objc_msgSend_setAssetKey_(a1, v44, v60);
  }
  objc_msgSend_setReferenceSignature_(a1, v45, (uint64_t)v19);
  objc_msgSend_setDownloadToken_(a1, v46, (uint64_t)v22);
  uint64_t v49 = objc_msgSend_downloadTokenExpiration(v4, v47, v48);
  objc_msgSend_setDownloadTokenExpiration_(a1, v50, v49);
  uint64_t v51 = 1;
LABEL_32:

  return v51;
}

uint64_t sub_1C5048700(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          id v17 = objc_alloc_init(CKDPSubscriptionNotificationAlert);
          objc_storeStrong((id *)(a1 + 16), v17);
          if (PBReaderPlaceMark() && sub_1C4EBC570((char *)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_33;
          }

          return 0;
        case 2u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_50;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              uint64_t v21 = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_52:
          BOOL v40 = v21 != 0;
          uint64_t v41 = 32;
          goto LABEL_61;
        case 3u:
          PBReaderReadString();
          id v17 = (CKDPSubscriptionNotificationAlert *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            objc_msgSend_addAdditionalFields_((void *)a1, v25, (uint64_t)v17);
          }
LABEL_33:

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v29 = *v3;
            unint64_t v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_56:
          BOOL v40 = v28 != 0;
          uint64_t v41 = 33;
          goto LABEL_61;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        case 6u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v38;

          continue;
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
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_58;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          uint64_t v34 = 0;
          goto LABEL_60;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v34 = 0;
      }
LABEL_60:
      BOOL v40 = v34 != 0;
      uint64_t v41 = 34;
LABEL_61:
      *(unsigned char *)(a1 + v41) = v40;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C50497E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C5049808(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend_error(WeakRetained, v3, v4);

  if (v5)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v8 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      unsigned int v27 = v8;
      unint64_t v30 = objc_msgSend_error(WeakRetained, v28, v29);
      int v36 = 138412290;
      char v37 = v30;
      _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Error fetching server certificates: %@", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v11 = objc_msgSend_error(WeakRetained, v9, v10);
    objc_msgSend_setError_(*(void **)(a1 + 32), v12, (uint64_t)v11);
LABEL_13:

    goto LABEL_14;
  }
  char v13 = objc_msgSend_validatedTrusts(WeakRetained, v6, v7);
  uint64_t v16 = objc_msgSend_count(v13, v14, v15);

  if (v16)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    char v19 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      char v31 = *(void **)(a1 + 32);
      char v32 = v19;
      uint64_t v35 = objc_msgSend_validatedTrusts(v31, v33, v34);
      int v36 = 138412290;
      char v37 = v35;
      _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Fetched validated trusts: %@", (uint8_t *)&v36, 0xCu);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v11 = objc_msgSend_validatedTrusts(WeakRetained, v21, v22);
    char v24 = objc_msgSend_initWithArray_(v20, v23, (uint64_t)v11);
    objc_msgSend_setValidatedTrusts_(*(void **)(a1 + 32), v25, (uint64_t)v24);

    goto LABEL_13;
  }
LABEL_14:
  char v26 = objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v17, v18);
  dispatch_group_leave(v26);
}

BOOL CKDPRecordStableUrlReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_24:
          char v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C504A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1C504A708(uint64_t a1, void *a2)
{
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_DEBUG, "Manatee state may have changed. Fetching new state from CoreCDP", v6, 2u);
  }
  return objc_msgSend_handleManateeStatusUpdateNotificationWithAvailability_(a2, v4, 0);
}

void sub_1C504A7B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_msgSend_handleWalrusStateChanged(WeakRetained, v2, v3);
    id WeakRetained = v4;
  }
}

void sub_1C504AAD4(uint64_t a1, const char *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int isEqualToNumber = objc_msgSend_isEqualToNumber_(*(void **)(a1 + 32), a2, (uint64_t)&unk_1F20AD050);
  id v5 = *(void **)(a1 + 40);
  if (isEqualToNumber)
  {
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(v5, v3, 1);
    objc_msgSend_setLastCDPErrorForManateeStatus_(*(void **)(a1 + 40), v6, 0);
  }
  else
  {
    id v26 = 0;
    uint64_t ManateeAvailability = objc_msgSend__fetchManateeAvailability_(v5, v3, (uint64_t)&v26);
    id v8 = v26;
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(*(void **)(a1 + 40), v9, ManateeAvailability);
    objc_msgSend_setLastCDPErrorForManateeStatus_(*(void **)(a1 + 40), v10, (uint64_t)v8);
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v11 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    unint64_t v12 = *(void **)(a1 + 40);
    char v13 = v11;
    if (objc_msgSend_manateeAvailableForLoggedInAccount(v12, v14, v15) == 1) {
      uint64_t v18 = &stru_1F2044F30;
    }
    else {
      uint64_t v18 = @" not";
    }
    uint64_t v21 = objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 40), v16, v17);
    if (v21) {
      uint64_t v22 = @"Error: ";
    }
    else {
      uint64_t v22 = &stru_1F2044F30;
    }
    uint64_t v23 = objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 40), v19, v20);
    char v24 = (void *)v23;
    *(_DWORD *)buf = 138543874;
    if (v23) {
      uint64_t v25 = (__CFString *)v23;
    }
    else {
      uint64_t v25 = &stru_1F2044F30;
    }
    uint64_t v28 = v18;
    __int16 v29 = 2114;
    unint64_t v30 = v22;
    __int16 v31 = 2112;
    char v32 = v25;
    _os_log_debug_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_DEBUG, "CoreCDP is now reporting that manatee is%{public}@ available for the logged in account.%{public}@%@", buf, 0x20u);
  }
}

void sub_1C504B43C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__lockedFetchAndUpdateManateeAvailability(*(void **)(a1 + 32), a2, a3);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    BOOL v7 = objc_msgSend_manateeAvailableForLoggedInAccount(*(void **)(a1 + 32), v4, v5) == 1;
    objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 32), v8, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v7, v10);
  }
}

void sub_1C504B65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C504B680(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C504B690(uint64_t a1)
{
}

void sub_1C504B698(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1C504B84C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_contextForPrimaryAccount(MEMORY[0x1E4F5B2E0], a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(MEMORY[0x1E4F5B2F8]);
  uint64_t v5 = objc_msgSend_initWithContext_(v3, v4, (uint64_t)v7);
  uint64_t v6 = (void *)qword_1EBBD0170;
  qword_1EBBD0170 = v5;
}

void sub_1C504BB10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  switch(a2)
  {
    case 0:
      goto LABEL_4;
    case 1:
      int v6 = 1;
      break;
    case 2:
LABEL_4:
      int v6 = 0;
      break;
    default:
      int v6 = 0;
      a2 = 0;
      break;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v11 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (!WeakRetained) {
    goto LABEL_26;
  }
  unint64_t v12 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v7, v8);
  if ((objc_msgSend_isAppleInternalInstall(v12, v13, v14) & 1) == 0)
  {

LABEL_13:
    if (!v6)
    {
LABEL_24:
      objc_msgSend_setCachedWalrusStatusForLoggedInAccount_(WeakRetained, v22, a2);
      goto LABEL_25;
    }
LABEL_14:
    if (objc_msgSend_cachedWalrusStatusForLoggedInAccount(WeakRetained, v22, v23) != 1)
    {
      if (*v10 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      os_log_t v29 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        char v32 = v29;
        unint64_t v35 = objc_msgSend_cachedWalrusStatusForLoggedInAccount(WeakRetained, v33, v34);
        if (v35 > 2) {
          int v36 = @"unknown";
        }
        else {
          int v36 = off_1E64F8E10[v35];
        }
        int v46 = 138543362;
        uint64_t v47 = v36;
        _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, "CoreCDP reports that walrus is changing from %{public}@ to enabled. Clearing out PCS memory caches.", (uint8_t *)&v46, 0xCu);
      }
      char v37 = objc_msgSend_deviceContext(*(void **)(a1 + 32), v30, v31);
      objc_msgSend_clearPCSMemoryCaches(v37, v38, v39);
    }
    a2 = 1;
    goto LABEL_24;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v15, v16);
  v18 = uint64_t v17 = v11;
  int v21 = objc_msgSend_CDPWalrusOverride(v18, v19, v20);

  uint64_t v11 = v17;
  id v10 = (void *)MEMORY[0x1E4F1A550];

  if (!v21) {
    goto LABEL_13;
  }
  char v24 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v22, v23);
  char v27 = objc_msgSend_CDPWalrusEnabled(v24, v25, v26);

  if (v27) {
    goto LABEL_14;
  }
  a2 = 2;
  objc_msgSend_setCachedWalrusStatusForLoggedInAccount_(WeakRetained, v22, 2);
LABEL_25:
  objc_msgSend_setLastCDPErrorForWalrusStatus_(WeakRetained, v28, (uint64_t)v5);
LABEL_26:
  if (*v10 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v40 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v41 = off_1E64F8E10[a2];
    int v46 = 138543874;
    uint64_t v47 = v41;
    if (v5) {
      uint64_t v42 = @" Error: ";
    }
    else {
      uint64_t v42 = &stru_1F2044F30;
    }
    if (v5) {
      uint64_t v43 = v5;
    }
    else {
      uint64_t v43 = &stru_1F2044F30;
    }
    __int16 v48 = 2114;
    uint64_t v49 = v42;
    __int16 v50 = 2112;
    uint64_t v51 = v43;
    uint64_t v44 = v40;
    _os_log_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_INFO, "CoreCDP reports that walrus is %{public}@ for the logged in account.%{public}@%@", (uint8_t *)&v46, 0x20u);
  }
  uint64_t v45 = *(void *)(a1 + 40);
  if (v45) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v45 + 16))(v45, a2, v5);
  }
}

uint64_t sub_1C504C168(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        uint64_t v18 = (CKDPZoneCapabilities *)objc_alloc_init(MEMORY[0x1E4F19EF8]);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 == 3)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            uint64_t v22 = *v3;
            unint64_t v23 = *(void *)(a2 + v22);
            if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_37;
            }
            v19 += 7;
            BOOL v14 = v20++ >= 9;
            if (v14)
            {
              uint64_t v21 = 0;
              goto LABEL_39;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v21 = 0;
          }
LABEL_39:
          *(unsigned char *)(a1 + 24) = v21 != 0;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v18 = objc_alloc_init(CKDPZoneCapabilities);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || (sub_1C4F8113C((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void *sub_1C504C93C()
{
  uint64_t v0 = ccrng();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = (unsigned int (**)(void, uint64_t, void *))v0;
  uint64_t v2 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v2 && (*v1)(v1, 32, v2))
  {
    free(v2);
    return 0;
  }
  return v2;
}

void *sub_1C504C9B0()
{
  uint64_t v0 = ccecies_encrypt_gcm_ciphertext_size();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  uint64_t v2 = malloc_type_malloc(v0 + 16, 0x5D7E4D2DuLL);
  id v3 = v2;
  if (v2)
  {
    v2[1] = v1;
    void *v2 = v2 + 2;
    if (ccecies_encrypt_gcm())
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

__n128 sub_1C504CA60(uint64_t a1, uint64_t a2)
{
  if (ccrng() && !sub_1C504CB28(a1, (void *)(a2 + 40)))
  {
    ccsha256_di();
    ccaes_gcm_encrypt_mode();
    if (ccecies_encrypt_gcm_setup())
    {
      sub_1C504CC04(*(void **)(a2 + 40));
      cc_clear();
    }
    else
    {
      long long v5 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(a2 + 64) = v5;
      long long v7 = *(_OWORD *)(a1 + 96);
      long long v6 = *(_OWORD *)(a1 + 112);
      long long v8 = *(_OWORD *)(a1 + 80);
      *(unsigned char *)(a2 + 144) = *(unsigned char *)(a1 + 128);
      *(_OWORD *)(a2 + 112) = v7;
      *(_OWORD *)(a2 + 128) = v6;
      *(_OWORD *)(a2 + 96) = v8;
      __n128 result = *(__n128 *)(a1 + 64);
      *(__n128 *)(a2 + 80) = result;
    }
  }
  return result;
}

uint64_t sub_1C504CB28(uint64_t a1, void *a2)
{
  size_t v3 = 24 * *(void *)MEMORY[0x1C87897F0]() + 16;
  if (v3 < 0x20) {
    return 0xFFFFFFFFLL;
  }
  long long v5 = malloc_type_calloc(1uLL, v3, 0xCEF84BE1uLL);
  if (!v5) {
    return 4294967294;
  }
  long long v6 = v5;
  if (ccec_compact_import_pub())
  {
    free(v6);
    return 4294967290;
  }
  else if (ccec_validate_pub())
  {
    uint64_t result = 0;
    *a2 = v6;
  }
  else
  {
    cc_clear();
    free(v6);
    return 4294967289;
  }
  return result;
}

void sub_1C504CC04(void *a1)
{
  MEMORY[0x1C87897F0]();
  cc_clear();
  free(a1);
}

uint64_t sub_1C504CC54(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    MEMORY[0x1C87897F0]();
    cc_clear();
  }
  cc_clear();
  cc_clear();
  return cc_clear();
}

void sub_1C504CCC8(uint64_t a1)
{
  sub_1C504CC54(a1);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    sub_1C504CC04(v2);
  }
}

uint64_t sub_1C504CD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = ccaes_gcm_encrypt_mode();
  MEMORY[0x1F4188790](v8);
  if (*a5 < (unint64_t)(a3 + 32)) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v10 = (unsigned int (**)(void, uint64_t, uint64_t))ccrng();
  if (!v10) {
    return 4294967291;
  }
  if ((*v10)(v10, 16, a4)) {
    return 4294967293;
  }
  ccgcm_init();
  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  ccgcm_context_size();
  cc_clear();
  uint64_t result = 0;
  *a5 = a3 + 32;
  return result;
}

uint64_t sub_1C504CE78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v7 = ccaes_gcm_decrypt_mode();
  if (a3 >= 0x20) {
    unint64_t v8 = a3 - 32;
  }
  else {
    unint64_t v8 = 0;
  }
  MEMORY[0x1F4188790](v7);
  if (a3 < 0x21 || *a5 < v8) {
    return 0xFFFFFFFFLL;
  }
  ccgcm_init();
  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  int v10 = cc_cmp_safe();
  ccgcm_context_size();
  cc_clear();
  if (v10) {
    return 4294967292;
  }
  uint64_t result = 0;
  *a5 = v8;
  return result;
}

__n128 sub_1C504CFE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *a1;
    if (*a1)
    {
      uint64_t v4 = a1[2];
      if (v4)
      {
        if (a2)
        {
          if (a3)
          {
            if (a1[1] == 472 && *(void *)(v3 + 384) <= 0x49uLL && a1[3] == 472 && *(void *)(v4 + 384) <= 0x49uLL)
            {
              memset(v11, 0, 24);
              if (!sub_1C504CB28(v4 + 320, v11))
              {
                if (*(void *)(v3 + 384) >= 0x4AuLL) {
                  __assert_rtn("pcc_opaque_quote_get_signature", "CProtectedCloudComputeQuote.c", 226, "*signature_len <= MAX_SIGNATURE_LEN");
                }
                unint64_t v8 = (void *)v11[0];
                ccsha256_di();
                if (ccec_verify_msg() || cc_cmp_safe())
                {
                  free(v8);
                }
                else
                {
                  free(v8);
                  if (!sub_1C504D190(v3, v4, a2))
                  {
                    long long v9 = *(_OWORD *)(v4 + 336);
                    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v4 + 320);
                    *(_OWORD *)(a3 + 48) = v9;
                    *(_OWORD *)(a3 + 64) = 0u;
                    *(_OWORD *)(a3 + 80) = 0u;
                    *(_OWORD *)(a3 + 96) = 0u;
                    *(_OWORD *)(a3 + 112) = 0u;
                    *(unsigned char *)(a3 + 128) = 0;
                    __n128 result = *(__n128 *)(v3 + 320);
                    long long v10 = *(_OWORD *)(v3 + 336);
                    *(__n128 *)a3 = result;
                    *(_OWORD *)(a3 + 16) = v10;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C504D190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    __assert_rtn("authorise_quote", "CProtectedCloudComputeCore.c", 417, "app_quote != NULL");
  }
  if (!a2) {
    __assert_rtn("authorise_quote", "CProtectedCloudComputeCore.c", 418, "aqe_quote != NULL");
  }
  if (!*(unsigned char *)(a3 + 43) && (*(unsigned char *)(a1 + 48) & 2) != 0) {
    return 4294967281;
  }
  if (*(void *)a3 != *(void *)(a1 + 64)
    || *(void *)(a3 + 8) != *(void *)(a1 + 72)
    || *(void *)(a3 + 16) != *(void *)(a1 + 80)
    || *(void *)(a3 + 24) != *(void *)(a1 + 88))
  {
    return 4294967286;
  }
  if (*(unsigned char *)(a3 + 42)) {
    return 0;
  }
  if (sub_1C504D258(a2, a3)) {
    return 0;
  }
  return 4294967284;
}

BOOL sub_1C504D258(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = ccsha256_di();
  MEMORY[0x1F4188790](v3);
  long long v5 = (char *)&v18 - v4;
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t *))(v3 + 56))(v3, v5, &v19);
  unint64_t v6 = *(unsigned __int16 *)(a2 + 40);
  if (!*(_WORD *)(a2 + 40)) {
    return 0;
  }
  uint64_t v7 = *(void **)(a2 + 32);
  if (*v7 == v19 && v7[1] == v20 && v7[2] == v21 && v7[3] == v22) {
    return 1;
  }
  uint64_t v11 = v7 + 4;
  uint64_t v12 = 1;
  do
  {
    unint64_t v13 = v12;
    if (v6 == v12) {
      break;
    }
    BOOL v14 = *v11 == v19 && v11[1] == v20;
    BOOL v15 = v14 && v11[2] == v21;
    BOOL v16 = v15 && v11[3] == v22;
    ++v12;
    v11 += 4;
  }
  while (!v16);
  return v13 < v6;
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return MEMORY[0x1F40E2EB8]();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t type metadata accessor for URLRequest()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x1F40E4CF8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1F40E50E0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1F40E5188]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t static TimeZone.== infix(_:_:)()
{
  return MEMORY[0x1F40E5D48]();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t static __CKLogSubsystem.name.getter()
{
  return MEMORY[0x1F40D6178]();
}

uint64_t CKLogTrafficCompressed.getter()
{
  return MEMORY[0x1F40D6180]();
}

uint64_t CKCheckedUnsafeObjectTransfer.extractValue()()
{
  return MEMORY[0x1F40D6188]();
}

uint64_t CKCheckedUnsafeObjectTransfer.init(_:)()
{
  return MEMORY[0x1F40D6190]();
}

uint64_t CKLog.getter()
{
  return MEMORY[0x1F40D6198]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t static DispatchTime.distantFuture.getter()
{
  return MEMORY[0x1F4186E00]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t related decl 'e' for CKErrorCode.init(_:description:)()
{
  return MEMORY[0x1F40D61B8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1F4183318]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1F4183358]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1F4183730]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1F4183838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1F4183958]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1F41839F0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x1F4183A78]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t CheckedContinuation.init(continuation:function:)()
{
  return MEMORY[0x1F4187BF8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t static TaskPriority.utility.getter()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t Collection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1F4188440]();
}

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t NSPredicate.init(format:_:)()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1F4187110]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x1F4187268]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x1F4187288]();
}

uint64_t NSData.startIndex.getter()
{
  return MEMORY[0x1F40E6800]();
}

uint64_t NSData.endIndex.getter()
{
  return MEMORY[0x1F40E6808]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t NSCoder.decodeDictionary<A, B>(withKeyClass:objectClass:forKey:)()
{
  return MEMORY[0x1F40E6868]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1F4188758]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1F4184B28]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F4184C18](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1F4184C38]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1F41851A0](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x1F4185238]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x1F4185270]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

{
  return MEMORY[0x1F4185570]();
}

{
  return MEMORY[0x1F4185588]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1F4185598]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1F4185608]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F4185628]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

{
  return MEMORY[0x1F4185698]();
}

{
  return MEMORY[0x1F41856B0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4185730]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1F4185740](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x1F4188170]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1F414B088]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CKAddResponseHeaderValuesToUserInfoDictionary()
{
  return MEMORY[0x1F40D6240]();
}

uint64_t CKApplicationBundleIDForPush()
{
  return MEMORY[0x1F40D6248]();
}

uint64_t CKBoolFromCKTernary()
{
  return MEMORY[0x1F40D6250]();
}

uint64_t CKBoolFromCKTernaryWithDefault()
{
  return MEMORY[0x1F40D6258]();
}

uint64_t CKBuildVersion()
{
  return MEMORY[0x1F40D6260]();
}

uint64_t CKCFArrayForEach()
{
  return MEMORY[0x1F40D6268]();
}

uint64_t CKCanRetryForError()
{
  return MEMORY[0x1F40D6270]();
}

uint64_t CKCodeRecordTransportReadFrom()
{
  return MEMORY[0x1F40D6278]();
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1F40D6288]();
}

uint64_t CKCreateDirectoryAtPath()
{
  return MEMORY[0x1F40D6290]();
}

uint64_t CKCreateDirectoryAtPathWithAttributes()
{
  return MEMORY[0x1F40D6298]();
}

uint64_t CKCreateDirectoryAtURL()
{
  return MEMORY[0x1F40D62A0]();
}

uint64_t CKCreateGUID()
{
  return MEMORY[0x1F40D62A8]();
}

uint64_t CKCurrentThreadQualityOfService()
{
  return MEMORY[0x1F40D62B0]();
}

uint64_t CKDPDateReadFrom()
{
  return MEMORY[0x1F40D62B8]();
}

uint64_t CKDPDistributedTimestampsReadFrom()
{
  return MEMORY[0x1F40D62C0]();
}

uint64_t CKDPIdentifierReadFrom()
{
  return MEMORY[0x1F40D62C8]();
}

uint64_t CKDPLocationCoordinateReadFrom()
{
  return MEMORY[0x1F40D62D0]();
}

uint64_t CKDPRecordIdentifierReadFrom()
{
  return MEMORY[0x1F40D62D8]();
}

uint64_t CKDPRecordReferenceReadFrom()
{
  return MEMORY[0x1F40D62E0]();
}

uint64_t CKDPRecordZoneIdentifierReadFrom()
{
  return MEMORY[0x1F40D62E8]();
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1F40D62F0]();
}

uint64_t CKDescriptionForTimeInterval()
{
  return MEMORY[0x1F40D62F8]();
}

uint64_t CKDeviceClass()
{
  return MEMORY[0x1F40D6300]();
}

uint64_t CKDeviceSerialNumber()
{
  return MEMORY[0x1F40D6308]();
}

uint64_t CKDeviceUDID()
{
  return MEMORY[0x1F40D6310]();
}

uint64_t CKErrorChainStringFromError()
{
  return MEMORY[0x1F40D6318]();
}

uint64_t CKErrorFromHTTPResponse()
{
  return MEMORY[0x1F40D6328]();
}

uint64_t CKExtendedMethodSignatureForProtocolSelector()
{
  return MEMORY[0x1F40D6340]();
}

uint64_t CKGetGlobalQueue()
{
  return MEMORY[0x1F40D6348]();
}

uint64_t CKGetHomeDir()
{
  return MEMORY[0x1F40D6350]();
}

uint64_t CKGetRealPath()
{
  return MEMORY[0x1F40D6358]();
}

uint64_t CKHandleSignificantIssueBehavior()
{
  return MEMORY[0x1F40D6360]();
}

uint64_t CKHexCharFromBytes()
{
  return MEMORY[0x1F40D6368]();
}

uint64_t CKIsIndexedArrayKey()
{
  return MEMORY[0x1F40D6370]();
}

uint64_t CKIsPCSError()
{
  return MEMORY[0x1F40D6378]();
}

uint64_t CKIsRunningInSyncBubble()
{
  return MEMORY[0x1F40D6380]();
}

uint64_t CKIsRunningInTestHost()
{
  return MEMORY[0x1F40D6388]();
}

uint64_t CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24()
{
  return MEMORY[0x1F40D6390]();
}

uint64_t CKLinkCheck48d9728e8c354416a38f82379cbb35e3()
{
  return MEMORY[0x1F40D6398]();
}

uint64_t CKLinkCheckc809671068f5f334951d6b3e996f193c()
{
  return MEMORY[0x1F40D63A0]();
}

uint64_t CKLocalizedString()
{
  return MEMORY[0x1F40D63A8]();
}

uint64_t CKMainBundleIsAppleExecutable()
{
  return MEMORY[0x1F40D63B0]();
}

uint64_t CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock()
{
  return MEMORY[0x1F40D63B8]();
}

uint64_t CKObjectsAreBothNilOrEqual()
{
  return MEMORY[0x1F40D63C0]();
}

uint64_t CKOncePerBoot()
{
  return MEMORY[0x1F40D63C8]();
}

uint64_t CKOperationProgressCallbackClasses()
{
  return MEMORY[0x1F40D63F8]();
}

uint64_t CKPIDForProcessNamed()
{
  return MEMORY[0x1F40D6400]();
}

uint64_t CKProcessIndexedArrayKey()
{
  return MEMORY[0x1F40D6410]();
}

uint64_t CKProductType()
{
  return MEMORY[0x1F40D6418]();
}

uint64_t CKProductVersion()
{
  return MEMORY[0x1F40D6420]();
}

uint64_t CKPushTopicForPushBehavior()
{
  return MEMORY[0x1F40D6428]();
}

uint64_t CKQoSClassFromNSQualityOfService()
{
  return MEMORY[0x1F40D6430]();
}

uint64_t CKQualityOfServiceOrdering()
{
  return MEMORY[0x1F40D6438]();
}

uint64_t CKRandomDataWithLength()
{
  return MEMORY[0x1F40D6440]();
}

uint64_t CKRetryAfterSecondsForError()
{
  return MEMORY[0x1F40D6448]();
}

uint64_t CKRunningInClientProcess()
{
  return MEMORY[0x1F40D6450]();
}

uint64_t CKShortRandomID()
{
  return MEMORY[0x1F40D6458]();
}

uint64_t CKShouldWrapErrorFetchingRecords()
{
  return MEMORY[0x1F40D6460]();
}

uint64_t CKStringForDiscretionaryNetworkBehavior()
{
  return MEMORY[0x1F40D6468]();
}

uint64_t CKStringForDuetPreClearedMode()
{
  return MEMORY[0x1F40D6470]();
}

uint64_t CKStringForNetworkServiceType()
{
  return MEMORY[0x1F40D6478]();
}

uint64_t CKStringForQOS()
{
  return MEMORY[0x1F40D6480]();
}

uint64_t CKStringFromAccountChangeType()
{
  return MEMORY[0x1F40D6488]();
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1F40D6490]();
}

uint64_t CKStringFromParticipantPermission()
{
  return MEMORY[0x1F40D64A0]();
}

uint64_t CKStringFromParticipantRole()
{
  return MEMORY[0x1F40D64A8]();
}

uint64_t CKStringFromServerEnvironment()
{
  return MEMORY[0x1F40D64B8]();
}

uint64_t CKStringWithData()
{
  return MEMORY[0x1F40D64C8]();
}

uint64_t CKTabIndentAtDepth()
{
  return MEMORY[0x1F40D64D0]();
}

uint64_t CKTernaryFromBOOL()
{
  return MEMORY[0x1F40D64D8]();
}

uint64_t CKTestNotificationPrefix()
{
  return MEMORY[0x1F40D64E0]();
}

uint64_t CKValidateKeyName()
{
  return MEMORY[0x1F40D64E8]();
}

uint64_t CKValueIsAcceptablePredicateClass()
{
  return MEMORY[0x1F40D64F0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1F4122BE0]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

uint64_t MKBBackupClose()
{
  return MEMORY[0x1F412F8F8]();
}

uint64_t MKBBackupCreateFromFileDescriptors()
{
  return MEMORY[0x1F412F900]();
}

uint64_t MKBBackupPread()
{
  return MEMORY[0x1F412F918]();
}

uint64_t MKBBackupSize()
{
  return MEMORY[0x1F412F920]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MMCSDuplicateRegisteredfile()
{
  return MEMORY[0x1F412C340]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x1F412C348]();
}

uint64_t MMCSEngineCopyStatusReport()
{
  return MEMORY[0x1F412C350]();
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x1F412C360]();
}

uint64_t MMCSEngineDestroy()
{
  return MEMORY[0x1F412C368]();
}

uint64_t MMCSEngineSetMetricsEnabled()
{
  return MEMORY[0x1F412C380]();
}

uint64_t MMCSGetChunks()
{
  return MEMORY[0x1F412C388]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x1F412C390]();
}

uint64_t MMCSGetItemsWithSection()
{
  return MEMORY[0x1F412C398]();
}

uint64_t MMCSGetMaxChunkCountForSection()
{
  return MEMORY[0x1F412C3A0]();
}

uint64_t MMCSGetRegisteredItems()
{
  return MEMORY[0x1F412C3A8]();
}

uint64_t MMCSICloudAuthGetRequestOptions()
{
  return MEMORY[0x1F412C3B0]();
}

uint64_t MMCSICloudRequestHeadersCopy()
{
  return MEMORY[0x1F412C3B8]();
}

uint64_t MMCSItemReaderWriterCreate()
{
  return MEMORY[0x1F412C3C0]();
}

uint64_t MMCSItemReaderWriterCreateWithData()
{
  return MEMORY[0x1F412C3C8]();
}

uint64_t MMCSItemReaderWriterCreateWithMutableData()
{
  return MEMORY[0x1F412C3D0]();
}

uint64_t MMCSOperationMetricCombineMetrics()
{
  return MEMORY[0x1F412C3E0]();
}

uint64_t MMCSPackageSectionSignatureGeneratorCreate()
{
  return MEMORY[0x1F412C3E8]();
}

uint64_t MMCSPackageSectionSignatureGeneratorCreateWithBoundaryKey()
{
  return MEMORY[0x1F412C3F0]();
}

uint64_t MMCSPackageSectionSignatureGeneratorFinishWithResults()
{
  return MEMORY[0x1F412C3F8]();
}

uint64_t MMCSPackageSectionSignatureGeneratorUpdate()
{
  return MEMORY[0x1F412C400]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x1F412C408]();
}

uint64_t MMCSPutSection()
{
  return MEMORY[0x1F412C410]();
}

uint64_t MMCSReferenceObjectCreateWithType()
{
  return MEMORY[0x1F412C418]();
}

uint64_t MMCSReferenceSignatureCreateWithReferenceObject()
{
  return MEMORY[0x1F412C420]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x1F412C430]();
}

uint64_t MMCSRegisteredItemCount()
{
  return MEMORY[0x1F412C438]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1F412C440]();
}

uint64_t MMCSSignatureGeneratorCreate()
{
  return MEMORY[0x1F412C458]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1F412C478]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1F412C488]();
}

uint64_t MMCSUnregisterFiles()
{
  return MEMORY[0x1F412C4A8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1F40E71E8](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSTimeIntervalToClosestXPCActivityInterval()
{
  return MEMORY[0x1F40D6500]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1F41471A0]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1F4147290]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1F4147378]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1F4147388]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1F4147398]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1F41473A0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1F41473A8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1F41473B0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1F41473B8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1F41473C0]();
}

uint64_t PCSFPAddEncryptedSharePCS()
{
  return MEMORY[0x1F4146E38]();
}

uint64_t PCSFPAddPrivateKey()
{
  return MEMORY[0x1F4146E40]();
}

uint64_t PCSFPAddPublicIdentity()
{
  return MEMORY[0x1F4146E48]();
}

uint64_t PCSFPAddPublicIdentityWithShareFlags()
{
  return MEMORY[0x1F4146E50]();
}

uint64_t PCSFPAddSharePCS()
{
  return MEMORY[0x1F4146E58]();
}

uint64_t PCSFPCopyAvailableMasterKeyIDs()
{
  return MEMORY[0x1F4146E60]();
}

uint64_t PCSFPCopyCurrentPrivateKey()
{
  return MEMORY[0x1F4146E68]();
}

uint64_t PCSFPCopyDecryptedData()
{
  return MEMORY[0x1F4146E70]();
}

uint64_t PCSFPCopyDiagnostic()
{
  return MEMORY[0x1F4146E78]();
}

uint64_t PCSFPCopyEncryptedData()
{
  return MEMORY[0x1F4146E80]();
}

uint64_t PCSFPCopyExported()
{
  return MEMORY[0x1F4146E88]();
}

uint64_t PCSFPCopyKeyIDs()
{
  return MEMORY[0x1F4146E90]();
}

uint64_t PCSFPCopyObject()
{
  return MEMORY[0x1F4146E98]();
}

uint64_t PCSFPCopyPrivateKey()
{
  return MEMORY[0x1F4146EA0]();
}

uint64_t PCSFPCopyPublicIdentities()
{
  return MEMORY[0x1F4146EA8]();
}

uint64_t PCSFPCopyRecoverPCS()
{
  return MEMORY[0x1F4146EB0]();
}

uint64_t PCSFPCopyTruncatedKeyIDFromEncryptedData()
{
  return MEMORY[0x1F4146EB8]();
}

uint64_t PCSFPCopyUnwrappedKey()
{
  return MEMORY[0x1F4146EC0]();
}

uint64_t PCSFPCopyWrappedKey()
{
  return MEMORY[0x1F4146EC8]();
}

uint64_t PCSFPCreate()
{
  return MEMORY[0x1F4146ED0]();
}

uint64_t PCSFPCreateDerivedDataFromMasterKey()
{
  return MEMORY[0x1F4146ED8]();
}

uint64_t PCSFPCreatePEMData()
{
  return MEMORY[0x1F4146EE0]();
}

uint64_t PCSFPCreatePrivateKey()
{
  return MEMORY[0x1F4146EE8]();
}

uint64_t PCSFPCreateUniqueID()
{
  return MEMORY[0x1F4146EF0]();
}

uint64_t PCSFPCreateWithExported()
{
  return MEMORY[0x1F4146EF8]();
}

uint64_t PCSFPGetAuthorshipIdentity()
{
  return MEMORY[0x1F4146F00]();
}

uint64_t PCSFPGetCurrentMasterKey()
{
  return MEMORY[0x1F4146F08]();
}

uint64_t PCSFPGetCurrentMasterKeyID()
{
  return MEMORY[0x1F4146F10]();
}

uint64_t PCSFPGetOwnerIdentity()
{
  return MEMORY[0x1F4146F18]();
}

uint64_t PCSFPGetUnwrapPublicIdentity()
{
  return MEMORY[0x1F4146F20]();
}

uint64_t PCSFPRemoveMasterKey()
{
  return MEMORY[0x1F4146F28]();
}

uint64_t PCSFPRemovePrivateKey()
{
  return MEMORY[0x1F4146F30]();
}

uint64_t PCSFPRemovePublicIdentity()
{
  return MEMORY[0x1F4146F38]();
}

uint64_t PCSFPRemoveSharePCS()
{
  return MEMORY[0x1F4146F40]();
}

uint64_t PCSFPRollMasterKey()
{
  return MEMORY[0x1F4146F48]();
}

uint64_t PCSFPSetCurrentPrivateKey()
{
  return MEMORY[0x1F4146F58]();
}

uint64_t PCSFPShouldRoll()
{
  return MEMORY[0x1F4146F68]();
}

uint64_t PCSFPSupportFeature()
{
  return MEMORY[0x1F4146F70]();
}

uint64_t PCSFPUpdateIdentityAndRollZoneKey()
{
  return MEMORY[0x1F4146F78]();
}

uint64_t PCSFPUpdateZoneKey()
{
  return MEMORY[0x1F4146F80]();
}

uint64_t PCSGetBoundaryKey()
{
  return MEMORY[0x1F4146F88]();
}

uint64_t PCSGetPublicIdentitites()
{
  return MEMORY[0x1F4146F90]();
}

uint64_t PCSIdentityCopyCurrentKeyFingerprint()
{
  return MEMORY[0x1F4146F98]();
}

uint64_t PCSIdentityCopyExportedPrivateKey()
{
  return MEMORY[0x1F4146FA0]();
}

uint64_t PCSIdentityCopyExportedPublicKey()
{
  return MEMORY[0x1F4146FA8]();
}

uint64_t PCSIdentityCopyExternalForm()
{
  return MEMORY[0x1F4146FB0]();
}

uint64_t PCSIdentityCopyPublicIdentity()
{
  return MEMORY[0x1F4146FB8]();
}

uint64_t PCSIdentityCreateDiversifiedIdentityOptions()
{
  return MEMORY[0x1F4146FC0]();
}

uint64_t PCSIdentityCreateExportedRawCompact()
{
  return MEMORY[0x1F4146FC8]();
}

uint64_t PCSIdentityCreateFromRaw()
{
  return MEMORY[0x1F4146FD0]();
}

uint64_t PCSIdentityCreateMaster()
{
  return MEMORY[0x1F4146FD8]();
}

uint64_t PCSIdentityCreateRandomCompactRaw()
{
  return MEMORY[0x1F4146FE0]();
}

uint64_t PCSIdentityCreateService()
{
  return MEMORY[0x1F4146FE8]();
}

uint64_t PCSIdentityCreateSignature()
{
  return MEMORY[0x1F4146FF0]();
}

uint64_t PCSIdentityGetKeyID()
{
  return MEMORY[0x1F4146FF8]();
}

uint64_t PCSIdentityGetPublicKey()
{
  return MEMORY[0x1F4147000]();
}

uint64_t PCSIdentityGetServiceName()
{
  return MEMORY[0x1F4147008]();
}

uint64_t PCSIdentityIsFullManatee()
{
  return MEMORY[0x1F4147010]();
}

uint64_t PCSIdentityRecoverFDE()
{
  return MEMORY[0x1F4147018]();
}

uint64_t PCSIdentityRollIdentity()
{
  return MEMORY[0x1F4147020]();
}

uint64_t PCSIdentitySetAddIdentity()
{
  return MEMORY[0x1F4147028]();
}

uint64_t PCSIdentitySetAddIdentityWithError()
{
  return MEMORY[0x1F4147030]();
}

uint64_t PCSIdentitySetCopyCurrentIdentityWithError()
{
  return MEMORY[0x1F4147038]();
}

uint64_t PCSIdentitySetCopyCurrentPublicIdentityWithError()
{
  return MEMORY[0x1F4147040]();
}

uint64_t PCSIdentitySetCopyIdentities()
{
  return MEMORY[0x1F4147048]();
}

uint64_t PCSIdentitySetCopyIdentity()
{
  return MEMORY[0x1F4147050]();
}

uint64_t PCSIdentitySetCopyService()
{
  return MEMORY[0x1F4147058]();
}

uint64_t PCSIdentitySetCopySet()
{
  return MEMORY[0x1F4147060]();
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x1F4147068]();
}

uint64_t PCSIdentitySetCreateExternalForm()
{
  return MEMORY[0x1F4147070]();
}

uint64_t PCSIdentitySetCreateFromExternalForm()
{
  return MEMORY[0x1F4147078]();
}

uint64_t PCSIdentitySetCreateMutable()
{
  return MEMORY[0x1F4147080]();
}

uint64_t PCSIdentitySetCreateNamed()
{
  return MEMORY[0x1F4147088]();
}

uint64_t PCSIdentitySetEnumeratePublicKeys()
{
  return MEMORY[0x1F4147090]();
}

uint64_t PCSIdentitySetSetCurrentIdentity()
{
  return MEMORY[0x1F4147098]();
}

uint64_t PCSIdentitySetup()
{
  return MEMORY[0x1F41470A0]();
}

uint64_t PCSKeyEnvelopeAuthenticate()
{
  return MEMORY[0x1F41470A8]();
}

uint64_t PCSKeyEnvelopeCreate()
{
  return MEMORY[0x1F41470B0]();
}

uint64_t PCSKeyEnvelopeCreateWithValues()
{
  return MEMORY[0x1F41470B8]();
}

uint64_t PCSKeyEnvelopeDecrypt()
{
  return MEMORY[0x1F41470C0]();
}

uint64_t PCSKeyEnvelopeEncrypt()
{
  return MEMORY[0x1F41470C8]();
}

uint64_t PCSKeyEnvelopeGetEnvelope()
{
  return MEMORY[0x1F41470D0]();
}

uint64_t PCSKeyEnvelopeVerify()
{
  return MEMORY[0x1F41470D8]();
}

uint64_t PCSObjectCreateFromExportedWithIdentitiesAndOptions()
{
  return MEMORY[0x1F41470F0]();
}

uint64_t PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync()
{
  return MEMORY[0x1F41470F8]();
}

uint64_t PCSObjectCreateFromExportedWithKeyedPCSAndOptions()
{
  return MEMORY[0x1F4147100]();
}

uint64_t PCSPublicIdentityCopyCurrentKeyFingerprint()
{
  return MEMORY[0x1F4147108]();
}

uint64_t PCSPublicIdentityCopyPublicKey()
{
  return MEMORY[0x1F4147110]();
}

uint64_t PCSPublicIdentityCreateFromKeyData()
{
  return MEMORY[0x1F4147118]();
}

uint64_t PCSPublicIdentityGetPublicID()
{
  return MEMORY[0x1F4147120]();
}

uint64_t PCSPublicIdentityGetServiceName()
{
  return MEMORY[0x1F4147128]();
}

uint64_t PCSServiceItemGetNameByIndex()
{
  return MEMORY[0x1F4147138]();
}

uint64_t PCSServiceItemGetNumberByName()
{
  return MEMORY[0x1F4147140]();
}

uint64_t PCSServiceItemTypeIsManatee()
{
  return MEMORY[0x1F4147148]();
}

uint64_t PCSShareProtectionCopyPublicKeys()
{
  return MEMORY[0x1F4147150]();
}

uint64_t PCSSignatureCopyKeyID()
{
  return MEMORY[0x1F4147158]();
}

uint64_t PCSSyncKeyRegistryWithOptions()
{
  return MEMORY[0x1F4147160]();
}

uint64_t PCSValidateSignature()
{
  return MEMORY[0x1F4147168]();
}

uint64_t PCSValidateSignatureWithSet()
{
  return MEMORY[0x1F4147170]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1F4145DA8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1F40F6BD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x1F40F6EB8]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1F40F7028]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t SecTaskEntitlementsValidated()
{
  return MEMORY[0x1F40F7178]();
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1F40F7190](trust);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1F40F71B8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1F415CBF0]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1F415CC30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _CKCheckArgument()
{
  return MEMORY[0x1F40D6508]();
}

uint64_t _CKUseSystemInstalledBinaries()
{
  return MEMORY[0x1F40D6510]();
}

uint64_t _PCSFPSetShouldRoll()
{
  return MEMORY[0x1F4147178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t ba_is_process_extension()
{
  return MEMORY[0x1F4179F68]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1F40CA6A8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1F40CA6E8]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1F40CA6F0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1F40CA9B8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1F40CA9C0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1F40CA9F8]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_validate_pub()
{
  return MEMORY[0x1F40CAB70]();
}

uint64_t ccec_verify_msg()
{
  return MEMORY[0x1F40CAB88]();
}

uint64_t ccecies_encrypt_gcm()
{
  return MEMORY[0x1F40CABF8]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1F40CAC00]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1F40CAC10]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1F40CAC80]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1F40CAC88]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1F40CAC98]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1F40CACB8]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1F40CACC0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t ck_call_or_dispatch_async_if_not_key()
{
  return MEMORY[0x1F40D6518]();
}

uint64_t ck_call_or_dispatch_sync_if_not_key()
{
  return MEMORY[0x1F40D6520]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1F41814E8](cls, outCount);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1F40CB550]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1F40CB650]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1F40CB740]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1F40CB770]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

void exit(int a1)
{
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1F40CC048](*(void *)&a1, *(void *)&a2, a3, *(void *)&a4);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1F40CC448](a1, *(void *)&a2);
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1F40CC478](*(void *)&a1, a2, a3, a4, a5);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint64_t net_qos_guideline()
{
  return MEMORY[0x1F40CCFE0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x1F40F2E48]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2EA8](hostname, port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1F4181798])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1F4181A78](a1, a2);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1F4181A90](a1, a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x1F4188290]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1F415CC80]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_events_filter_create_with_criteria()
{
  return MEMORY[0x1F415CCD0]();
}

uint64_t tcc_events_subscribe()
{
  return MEMORY[0x1F415CCD8]();
}

uint64_t tcc_events_unsubscribe()
{
  return MEMORY[0x1F415CCE0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x1F415CDD8]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1F40CE720]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}