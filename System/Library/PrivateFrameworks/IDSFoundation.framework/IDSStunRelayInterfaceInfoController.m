@interface IDSStunRelayInterfaceInfoController
+ (id)sharedInstance;
- (id)candidatePairsFromRelayInterfaceInfo:(char *)a3 bufferLength:(int)a4 token:(id)a5 sessionID:(id)a6 error:(int *)a7;
- (id)createRelayInterfaceInfoFromCandidatePairs:(id)a3 token:(id)a4;
- (unint64_t)relayInterfaceInfoDeliveryStatus:(id)a3;
- (void)removeCache:(id)a3;
- (void)setRelayInterfaceInfoDeliveryStatus:(id)a3 status:(unint64_t)a4;
@end

@implementation IDSStunRelayInterfaceInfoController

+ (id)sharedInstance
{
  if (qword_1EB2BB738 != -1) {
    dispatch_once(&qword_1EB2BB738, &unk_1EEFCD6F8);
  }
  v2 = (void *)qword_1EB2BB788;
  return v2;
}

- (id)createRelayInterfaceInfoFromCandidatePairs:(id)a3 token:(id)a4
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v132 = a4;
  memset(__b, 170, sizeof(__b));
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id obj = v5;
  unint64_t v8 = 0x1E596F000uLL;
  unint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v142, v7, v158, 16);
  if (v139)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v143;
    v13 = &__b[7];
    int v14 = 1;
    uint64_t v15 = 1022;
    uint64_t v16 = 67110656;
    uint64_t v17 = *(void *)v143;
    while (1)
    {
      if (v17 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v141 = v11;
      v18 = *(void **)(*((void *)&v142 + 1) + 8 * v11);
      v19 = objc_msgSend_local(v18, v9, v10, *(double *)&v16);
      uint64_t v23 = objc_msgSend_type(v19, v20, v21, v22);

      v27 = objc_msgSend_local(v18, v24, v25, v26);
      v31 = v27;
      uint64_t v32 = v23 ? objc_msgSend_external(v27, v28, v29, v30) : objc_msgSend_address(v27, v28, v29, v30);
      uint64_t v33 = v32;

      if (v15 <= 11) {
        break;
      }
      uint64_t v140 = v15;
      int v37 = *(unsigned __int8 *)(v33 + 1);
      int v38 = ((v37 != 2) << 15) | (v23 << 11);
      v39 = objc_msgSend_local(v18, v34, v35, v36);
      int v43 = v38 & 0xFFFFF87F | ((objc_msgSend_transport(v39, v40, v41, v42) & 0xF) << 7);

      v47 = objc_msgSend_local(v18, v44, v45, v46);
      unsigned int v51 = v43 & 0xFFFFFF87 | (8 * (objc_msgSend_radioAccessTechnology(v47, v48, v49, v50) & 0xF));

      *(v13 - 6) = bswap32(v51) >> 16;
      *(v13 - 5) = __rev16(objc_msgSend_relayLinkID(v18, v52, v53, v54));
      v58 = objc_msgSend_local(v18, v55, v56, v57);
      unsigned int v62 = bswap32(objc_msgSend_mtu(v58, v59, v60, v61)) >> 16;

      *(v13 - 4) = v62;
      v66 = objc_msgSend_local(v18, v63, v64, v65);
      LOWORD(v62) = __rev16(objc_msgSend_linkFlags(v66, v67, v68, v69));

      *(v13 - 3) = v62;
      v73 = objc_msgSend_sharedInstance(IDSCellularLinkMonitor, v70, v71, v72);
      unsigned int v77 = objc_msgSend_dataSoMaskBits(v73, v74, v75, v76);

      *((_DWORD *)v13 - 1) = bswap32(v77);
      v81 = objc_msgSend_Stun(*(void **)(v8 + 2896), v78, v79, v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v136 = objc_msgSend_local(v18, v82, v83, v84);
        uint64_t v134 = objc_msgSend_transport(v136, v85, v86, v87);
        v135 = objc_msgSend_local(v18, v88, v89, v90);
        int v94 = objc_msgSend_radioAccessTechnology(v135, v91, v92, v93);
        int v133 = objc_msgSend_relayLinkID(v18, v95, v96, v97);
        objc_msgSend_local(v18, v98, v99, v100);
        v101 = int v137 = v14;
        int v105 = objc_msgSend_mtu(v101, v102, v103, v104);
        v109 = objc_msgSend_local(v18, v106, v107, v108);
        uint64_t v113 = v12;
        int v114 = objc_msgSend_linkFlags(v109, v110, v111, v112);
        v118 = objc_msgSend_sharedInstance(IDSCellularLinkMonitor, v115, v116, v117);
        int v122 = objc_msgSend_dataSoMaskBits(v118, v119, v120, v121);
        *(_DWORD *)buf = 67110656;
        *(_DWORD *)v147 = v37;
        *(_WORD *)&v147[4] = 2048;
        *(void *)&v147[6] = v134;
        __int16 v148 = 1024;
        int v149 = v94;
        unint64_t v8 = 0x1E596F000;
        __int16 v150 = 1024;
        int v151 = v133;
        __int16 v152 = 1024;
        int v153 = v105;
        __int16 v154 = 1024;
        int v155 = v114;
        uint64_t v12 = v113;
        __int16 v156 = 1024;
        int v157 = v122;
        _os_log_impl(&dword_19D9BE000, v81, OS_LOG_TYPE_DEFAULT, "createRelayInterfaceInfoFromCandidatePairs: family: %d, transport: %ld, RAT: %u, relay LinkID: %04x, MTU: %u, linkFlags: 0x%x, dataSoMasks: 0x%x", buf, 0x30u);

        int v14 = v137;
      }

      uint64_t v11 = v141 + 1;
      if (v141 + 1 >= v139)
      {
        unint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v142, *(double *)&v16, v158, 16);
        if (!v139) {
          goto LABEL_20;
        }
        uint64_t v11 = 0;
      }
      uint64_t v17 = *(void *)v143;
      v13 += 6;
      ++v14;
      uint64_t v15 = v140 - 12;
    }
    v123 = objc_msgSend_Stun(*(void **)(v8 + 2896), v34, v35, v36);
    v13 -= 6;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v147 = 2;
      _os_log_impl(&dword_19D9BE000, v123, OS_LOG_TYPE_DEFAULT, "createRelayInterfaceInfoFromCandidatePairs: candidatePtrEnd - candidatePtr = %d < 12, break", buf, 8u);
    }

    int v14 = 85;
  }
  else
  {
    int v14 = 0;
    v13 = &__b[1];
  }
LABEL_20:

  __b[0] = bswap32(v14 | 0x2000) >> 16;
  v126 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v124, (uint64_t)__b, v125, (int)(v13 - __b));
  v130 = objc_msgSend_Stun(*(void **)(v8 + 2896), v127, v128, v129);
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)v147 = v132;
    *(_WORD *)&v147[8] = 1024;
    *(_DWORD *)&v147[10] = 1;
    __int16 v148 = 1024;
    int v149 = v14;
    __int16 v150 = 1024;
    int v151 = (char *)v13 - (char *)__b;
    _os_log_impl(&dword_19D9BE000, v130, OS_LOG_TYPE_DEFAULT, "new interfaceInformation for %@ (V:%1d #CAN:%d LEN:%dB).", buf, 0x1Eu);
  }

  return v126;
}

- (id)candidatePairsFromRelayInterfaceInfo:(char *)a3 bufferLength:(int)a4 token:(id)a5 sessionID:(id)a6 error:(int *)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v14 = a6;
  *a7 = 0;
  if (a4 > 1)
  {
    int v18 = a3 + 2;
    unsigned int v19 = bswap32(*(unsigned __int16 *)a3);
    int v20 = HIWORD(v19) & 0x1F;
    uint64_t v21 = objc_msgSend_Stun(IDSFoundationLog, v12, v13, v15);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v68 = v19 >> 29;
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = HIWORD(v19) & 0x1F;
      *(_WORD *)double v69 = 2112;
      *(void *)&v69[2] = v11;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, "receive interfaceInfo (ver:%u numCandidate:%d) for %@", buf, 0x18u);
    }

    theArray = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v20)
    {
      double v61 = a7;
      id v62 = v11;
      int v60 = a4;
      uint64_t v25 = a3;
      unsigned int v26 = a4 - 2;
      int v59 = (int)v25;
      v27 = (unsigned __int16 *)(v25 + 6);
      uint64_t v24 = 138414082;
      id v63 = v14;
      while (1)
      {
        if (v26 <= 1)
        {
          uint64_t v53 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v68 = v26;
          double v54 = "candidatePairsFromInterfaceInfo: remainingInterfaceInfoLength = %d < 2, break";
          goto LABEL_28;
        }
        if (v26 <= 0xB) {
          break;
        }
        unsigned int v28 = bswap32(*(v27 - 2));
        unsigned int v29 = HIWORD(v28);
        uint64_t v30 = (v28 >> 23) & 0xF;
        if (v30 < 5)
        {
          uint64_t v32 = (v28 >> 27) & 0xF;
          uint64_t v33 = bswap32(*(v27 - 1)) >> 16;
          uint64_t v34 = bswap32(*v27) >> 16;
          unsigned int v65 = (v28 >> 19) & 0xF;
          unsigned int v66 = bswap32(v27[1]) >> 16;
          uint64_t v35 = bswap32(*((_DWORD *)v27 + 1));
          double v36 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138414082;
            int v37 = @"YES";
            if ((v29 & 0x8000u) == 0) {
              int v37 = @"NO";
            }
            *(void *)uint64_t v68 = v37;
            *(_WORD *)&v68[8] = 2048;
            *(void *)double v69 = v32;
            *(_WORD *)&v69[8] = 1024;
            unsigned int v70 = v65;
            __int16 v71 = 2048;
            uint64_t v72 = v30;
            __int16 v73 = 1024;
            int v74 = v33;
            __int16 v75 = 1024;
            int v76 = v34;
            __int16 v77 = 1024;
            unsigned int v78 = v66;
            __int16 v79 = 1024;
            int v80 = v35;
            _os_log_impl(&dword_19D9BE000, v36, OS_LOG_TYPE_DEFAULT, "candidatePairsFromRelayInterfaceInfo: isIPv6: %@, type: %lu, RAT: %u, transport: %ld, relayLinkID: %04x, MTU: %u, linkFlags: 0x%x, dataSoMasks: 0x%x", buf, 0x3Eu);
          }
          uint64_t v38 = v33;

          v31 = objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v39, v32, v40, v30, v65, v34, 0xFFFFFFFFLL, 0, 0);
          objc_msgSend_setDataSoMask_(v31, v41, v35, v42);
          objc_msgSend_setLinkFlags_(v31, v43, v66, v44);
          v47 = objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v45, 3, v46, 0, 10, 1280, 0xFFFFFFFFLL, 0, 0);
          id v14 = v63;
          double v50 = objc_msgSend_candidatePairWithLocalCandidate_remoteCandidate_sessionID_delegate_(IDSStunCandidatePair, v48, (uint64_t)v47, v49, v31, v63, 0);
          objc_msgSend_setRelayLinkID_(v50, v51, v38, v52);
          if (theArray && v50) {
            CFArrayAppendValue(theArray, v50);
          }
        }
        else
        {
          v31 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)uint64_t v68 = v30;
            _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "candidatePairsFromRelayInterfaceInfo: transport is invalid: %lu.", buf, 0xCu);
          }
        }

        v27 += 6;
        v26 -= 12;
        if (!--v20)
        {
          int v18 = v27 - 4;
          a7 = v61;
          id v11 = v62;
          a4 = v60;
          LODWORD(a3) = v59;
          goto LABEL_30;
        }
      }
      uint64_t v53 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v68 = v26;
      double v54 = "candidatePairsFromRelayInterfaceInfo: remainingInterfaceInfoLength = %d < 12, return";
LABEL_28:
      _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 8u);
LABEL_29:
      a7 = v61;
      id v11 = v62;
      a4 = v60;
      LODWORD(a3) = v59;

      int v18 = v27 - 4;
    }
LABEL_30:
    int v55 = v18 - a3;
    if (v55 == a4)
    {
      uint64_t v56 = theArray;
      uint64_t v17 = theArray;
    }
    else
    {
      double v57 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v68 = v55;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = a4;
        _os_log_impl(&dword_19D9BE000, v57, OS_LOG_TYPE_DEFAULT, "invalid interfaceInfo data length: %d, not equal to InterfaceInfoLength: %d.", buf, 0xEu);
      }

      uint64_t v17 = 0;
      *a7 = 1;
      uint64_t v56 = theArray;
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_Stun(IDSFoundationLog, v12, v13, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v68 = a4;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "candidatePairsFromInterfaceInfo: remainingInterfaceInfoLength = %d < 2, return nil", buf, 8u);
    }

    uint64_t v17 = 0;
    *a7 = 1;
  }

  return v17;
}

- (unint64_t)relayInterfaceInfoDeliveryStatus:(id)a3
{
  Value = 0;
  if (a3)
  {
    tokenToRelayInterfaceInfoDeliveryStatus = self->_tokenToRelayInterfaceInfoDeliveryStatus;
    if (tokenToRelayInterfaceInfoDeliveryStatus) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)tokenToRelayInterfaceInfoDeliveryStatus, a3);
    }
    uint64_t v3 = vars8;
  }
  return objc_msgSend_unsignedIntegerValue(Value, a2, (uint64_t)a3, v4);
}

- (void)setRelayInterfaceInfoDeliveryStatus:(id)a3 status:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    int v18 = objc_msgSend_Stun(IDSFoundationLog, v6, v7, v9);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_17;
    }
    LOWORD(v25) = 0;
    unsigned int v19 = "setRelayInterfaceInfoDeliveryStatus failed due to invalid token.";
    int v20 = v18;
    uint32_t v21 = 2;
LABEL_15:
    _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
    goto LABEL_16;
  }
  CFDictionaryRef tokenToRelayInterfaceInfoDeliveryStatus = (const __CFDictionary *)self->_tokenToRelayInterfaceInfoDeliveryStatus;
  if (tokenToRelayInterfaceInfoDeliveryStatus) {
    CFDictionaryRef tokenToRelayInterfaceInfoDeliveryStatus = (const __CFDictionary *)CFDictionaryGetValue(tokenToRelayInterfaceInfoDeliveryStatus, v8);
  }
  uint64_t v11 = objc_msgSend_unsignedIntegerValue(tokenToRelayInterfaceInfoDeliveryStatus, v6, v7, v9);
  if (v11 != a4)
  {
    uint64_t v14 = v11;
    if (!self->_tokenToRelayInterfaceInfoDeliveryStatus)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v16 = self->_tokenToRelayInterfaceInfoDeliveryStatus;
      self->_CFDictionaryRef tokenToRelayInterfaceInfoDeliveryStatus = Mutable;
    }
    uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, a4, v13);
    if (v17)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToRelayInterfaceInfoDeliveryStatus, v8, v17);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB801E4((uint64_t)v8);
    }

    int v18 = objc_msgSend_Stun(IDSFoundationLog, v22, v23, v24);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v25 = 138412802;
    id v26 = v8;
    __int16 v27 = 2048;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    unsigned int v19 = "setRelayInterfaceInfoDeliveryStatus for %@ (%lu->%lu).";
    int v20 = v18;
    uint32_t v21 = 32;
    goto LABEL_15;
  }
LABEL_17:
}

- (void)removeCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    CFDictionaryRef tokenToRelayInterfaceInfoDeliveryStatus = self->_tokenToRelayInterfaceInfoDeliveryStatus;
    if (tokenToRelayInterfaceInfoDeliveryStatus) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToRelayInterfaceInfoDeliveryStatus, v6);
    }
    double v9 = objc_msgSend_Stun(IDSFoundationLog, v4, v5, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      uint64_t v10 = "removed relay interface information for %@.";
      uint64_t v11 = v9;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    double v9 = objc_msgSend_Stun(IDSFoundationLog, v4, v5, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "remove relay interface information failed due to invalid token.";
      uint64_t v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_8;
    }
  }
}

- (void).cxx_destruct
{
}

@end