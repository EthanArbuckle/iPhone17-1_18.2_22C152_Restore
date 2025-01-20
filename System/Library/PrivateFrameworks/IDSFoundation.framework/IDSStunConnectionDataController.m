@interface IDSStunConnectionDataController
+ (id)sharedInstance;
- (id)candidatesFromData:(id)a3 token:(id)a4;
- (id)dataFromCandidates:(id)a3 token:(id)a4 remoteDeviceVersion:(unsigned int)a5;
- (unint64_t)deliveryStatus:(id)a3;
- (void)removeData:(id)a3;
- (void)setDeliveryStatus:(id)a3 status:(unint64_t)a4;
@end

@implementation IDSStunConnectionDataController

+ (id)sharedInstance
{
  if (qword_1EB2BB748 != -1) {
    dispatch_once(&qword_1EB2BB748, &unk_1EEFCD7D8);
  }
  v2 = (void *)qword_1EB2BB798;
  return v2;
}

- (id)dataFromCandidates:(id)a3 token:(id)a4 remoteDeviceVersion:(unsigned int)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  id key = a4;
  v88 = self;
  if (key)
  {
    tokenToConnectionData = self->_tokenToConnectionData;
    if (tokenToConnectionData)
    {
      v8 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToConnectionData, key);
      if (v8)
      {
        id v9 = v8;
        goto LABEL_121;
      }
    }
  }
  CFMutableArrayRef theArray = (CFMutableArrayRef)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v116[31] = v10;
  v116[30] = v10;
  v116[29] = v10;
  v116[28] = v10;
  v116[27] = v10;
  v116[26] = v10;
  v116[25] = v10;
  v116[24] = v10;
  v116[23] = v10;
  v116[22] = v10;
  v116[21] = v10;
  v116[20] = v10;
  v116[19] = v10;
  v116[18] = v10;
  v116[17] = v10;
  v116[16] = v10;
  v116[15] = v10;
  v116[14] = v10;
  v116[13] = v10;
  v116[12] = v10;
  v116[11] = v10;
  v116[10] = v10;
  v116[9] = v10;
  v116[8] = v10;
  v116[7] = v10;
  v116[6] = v10;
  v116[5] = v10;
  v116[4] = v10;
  v116[3] = v10;
  v116[2] = v10;
  v116[1] = v10;
  v116[0] = v10;
  __src[31] = v10;
  __src[30] = v10;
  __src[29] = v10;
  __src[28] = v10;
  __src[27] = v10;
  __src[26] = v10;
  __src[25] = v10;
  __src[24] = v10;
  __src[23] = v10;
  __src[22] = v10;
  __src[21] = v10;
  __src[20] = v10;
  __src[19] = v10;
  __src[18] = v10;
  __src[17] = v10;
  __src[16] = v10;
  __src[15] = v10;
  __src[14] = v10;
  __src[13] = v10;
  __src[12] = v10;
  __src[11] = v10;
  __src[10] = v10;
  __src[9] = v10;
  __src[8] = v10;
  __src[7] = v10;
  __src[6] = v10;
  __src[5] = v10;
  __src[4] = v10;
  __src[3] = v10;
  __src[2] = v10;
  __src[1] = v10;
  __src[0] = v10;
  memset(__b, 170, sizeof(__b));
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v90;
  unint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v102, v12, v113, 16);
  v101 = (char *)__src;
  v97 = v116;
  if (!v100)
  {
    LODWORD(v99) = 0;
    int v91 = 0;
    goto LABEL_84;
  }
  uint64_t v99 = 0;
  uint64_t v15 = 0;
  int v91 = 0;
  uint64_t v16 = 138412290;
  uint64_t v94 = *(void *)v103;
  for (uint64_t i = *(void *)v103; ; uint64_t i = *(void *)v103)
  {
    if (i != v94)
    {
      uint64_t v18 = v15;
      objc_enumerationMutation(obj);
      uint64_t v15 = v18;
    }
    uint64_t v98 = v15;
    v19 = *(void **)(*((void *)&v102 + 1) + 8 * v15);
    unint64_t v22 = objc_msgSend_type(v19, v13, v14, *(double *)&v16, v86);
    if (v22)
    {
      uint64_t v24 = objc_msgSend_external(v19, v20, v21, v23);
      if (v22 >= 3)
      {
        v27 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v107 = v19;
          _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "skip candidate %@ due to invalid type.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v86 = v19;
            _IDSLogTransport(@"GL", @"IDS", @"skip candidate %@ due to invalid type.");
            if (_IDSShouldLog())
            {
              v86 = v19;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"skip candidate %@ due to invalid type.");
            }
          }
        }
LABEL_64:
        uint64_t v63 = v99;
        v64 = v101;
        goto LABEL_65;
      }
      uint64_t v28 = v24;
      int v29 = *(unsigned __int8 *)(v24 + 1);
      if (v22 == 1 && !IsValidSA(v24))
      {
        v65 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v107 = v19;
          _os_log_impl(&dword_19D9BE000, v65, OS_LOG_TYPE_DEFAULT, "skip candidate %@ with invalid external address.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v86 = v19;
            _IDSLogTransport(@"GL", @"IDS", @"skip candidate %@ with invalid external address.");
            if (_IDSShouldLog())
            {
              v86 = v19;
              _IDSLogV(0, @"IDSFoundation", @"GL", @"skip candidate %@ with invalid external address.");
            }
          }
        }
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v28 = objc_msgSend_address(v19, v20, v21, v23);
      int v29 = *(unsigned __int8 *)(v28 + 1);
    }
    if (v29 == 2)
    {
      v32 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, *(unsigned int *)(v28 + 4), v26);
      int v93 = 0;
    }
    else
    {
      v32 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v25, v28 + 8, v26, 16);
      int v93 = 0x8000;
    }
    __int16 v34 = *(_WORD *)(v28 + 2);
    if (objc_msgSend_active(v19, v30, v31, v33)) {
      int v38 = 0x4000;
    }
    else {
      int v38 = 0;
    }
    int v39 = objc_msgSend_radioAccessTechnology(v19, v35, v36, v37);
    char v43 = v39;
    if (v39 == 9 && a5 < 3)
    {
      v45 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v45, OS_LOG_TYPE_DEFAULT, "RATType Wired -> NonCell due to remote version", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"RATType Wired -> NonCell due to remote version");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"RATType Wired -> NonCell due to remote version");
          }
        }
      }
      char v43 = 0;
    }
    int v46 = objc_msgSend_linkFlags(v19, v40, v41, v42);
    uint64_t v51 = objc_msgSend_indexOfObject_(theArray, v47, (uint64_t)v32, v48);
    if (v51 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_50:
    if ((char *)v116 - v101 <= 3)
    {
      v66 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v107 = v19;
        _os_log_impl(&dword_19D9BE000, v66, OS_LOG_TYPE_DEFAULT, "candidate buffer full, candidate: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"candidate buffer full, candidate: %@");
          if (_IDSShouldLog())
          {
            v67 = @"candidate buffer full, candidate: %@";
LABEL_82:
            _IDSLogV(0, @"IDSFoundation", @"GL", v67);
            goto LABEL_83;
          }
        }
      }
      goto LABEL_83;
    }
    v59 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v107 = v19;
      *(_WORD *)&v107[8] = 2048;
      *(void *)v108 = v51;
      _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, "candidate %@, ip_index [%lu]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v86 = v19;
        uint64_t v87 = v51;
        _IDSLogTransport(@"GL", @"IDS", @"candidate %@, ip_index [%lu]");
        if (_IDSShouldLog())
        {
          v86 = v19;
          uint64_t v87 = v51;
          _IDSLogV(0, @"IDSFoundation", @"GL", @"candidate %@, ip_index [%lu]");
        }
      }
    }
    *(_WORD *)v101 = bswap32(v51 & 0x1F | (32 * (objc_msgSend_transport(v19, v60, v61, v62, v86, v87) & 7)) | (v22 << 12)) >> 16;
    *((_WORD *)v101 + 1) = v34;

    uint64_t v63 = (v99 + 1);
    v64 = v101 + 4;
LABEL_65:
    uint64_t v15 = v98 + 1;
    uint64_t v99 = v63;
    v101 = v64;
    if (v98 + 1 >= v100)
    {
      unint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v102, *(double *)&v16, v113, 16);
      if (!v100) {
        goto LABEL_84;
      }
      uint64_t v15 = 0;
    }
  }
  uint64_t v53 = 18;
  if (v29 == 2) {
    uint64_t v53 = 6;
  }
  if ((char *)&v117 - (char *)v97 >= v53)
  {
    uint64_t v51 = objc_msgSend_count(theArray, v49, v50, v52);
    if (v32) {
      BOOL v56 = theArray != 0;
    }
    else {
      BOOL v56 = 0;
    }
    if (v56) {
      CFArrayAppendValue(theArray, v32);
    }
    ++v91;
    *(_WORD *)v97 = ((v46 << 7) & 0x200 | ((v43 & 0xF) << 10) | v38 | v93) >> 8;
    uint64_t v57 = (uint64_t)v97 + 2;
    if (v29 == 2)
    {
      *(_DWORD *)((char *)v97 + 2) = objc_msgSend_unsignedIntValue(v32, v54, v57, v55);
      v58 = (char *)v97 + 6;
    }
    else
    {
      objc_msgSend_getBytes_length_(v32, v54, v57, v55, 16);
      v58 = (char *)v97 + 18;
    }
    v97 = v58;
    goto LABEL_50;
  }
  v68 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v107 = v19;
    _os_log_impl(&dword_19D9BE000, v68, OS_LOG_TYPE_DEFAULT, "IP buffer full, candidate: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"IP buffer full, candidate: %@");
      if (_IDSShouldLog())
      {
        v67 = @"IP buffer full, candidate: %@";
        goto LABEL_82;
      }
    }
  }
LABEL_83:

LABEL_84:
  if (((char *)v97 - (char *)v116) - 1451 <= 0xFFFFFA55)
  {
    v69 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = (char *)v97 - (char *)v116;
      _os_log_impl(&dword_19D9BE000, v69, OS_LOG_TYPE_DEFAULT, "invalid buffer length for IP list (%d).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"invalid buffer length for IP list (%d).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid buffer length for IP list (%d).");
        }
      }
    }
    goto LABEL_119;
  }
  if ((v101 - (char *)__src) - 1451 <= 0xFFFFFA55)
  {
    v70 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v101 - (char *)__src;
      _os_log_impl(&dword_19D9BE000, v70, OS_LOG_TYPE_DEFAULT, "invalid buffer length for candidate list (%d).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"invalid buffer length for candidate list (%d).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid buffer length for candidate list (%d).");
        }
      }
    }
    goto LABEL_119;
  }
  size_t v71 = (v101 - (char *)__src);
  if (v71 + ((char *)v97 - (char *)v116) + 2 >= 0x5AB)
  {
    v72 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v107 = (char *)v97 - (char *)v116;
      *(_WORD *)&v107[4] = 1024;
      *(_DWORD *)&v107[6] = v101 - (char *)__src;
      _os_log_impl(&dword_19D9BE000, v72, OS_LOG_TYPE_DEFAULT, "invalid total buffer length: %d %d", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"invalid total buffer length: %d %d");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid total buffer length: %d %d");
        }
      }
    }
    goto LABEL_119;
  }
  if (v91 >= 32)
  {
    v73 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v91;
      _os_log_impl(&dword_19D9BE000, v73, OS_LOG_TYPE_DEFAULT, "IP list reached max number (%u).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"IP list reached max number (%u).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"IP list reached max number (%u).");
        }
      }
    }
    goto LABEL_119;
  }
  if ((int)v99 < 64)
  {
    __b[0] = bswap32(v99 | (v91 << 6) | 0x2000) >> 16;
    __memcpy_chk();
    v76 = (char *)&__b[1] + ((char *)v97 - (char *)v116);
    memcpy(v76, __src, v71);
    int64_t v77 = &v76[v71] - (char *)__b;
    v80 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v78, (uint64_t)__b, v79, (int)v77);
    v81 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(void *)v107 = key;
      *(_WORD *)&v107[8] = 1024;
      *(_DWORD *)v108 = 1;
      *(_WORD *)&v108[4] = 1024;
      *(_DWORD *)&v108[6] = v91;
      __int16 v109 = 1024;
      int v110 = v99;
      __int16 v111 = 1024;
      int v112 = v77;
      _os_log_impl(&dword_19D9BE000, v81, OS_LOG_TYPE_DEFAULT, "new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB).", buf, 0x24u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB).");
        }
      }
    }
    v82 = v88;
    if (!v88->_tokenToConnectionData)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v84 = v88->_tokenToConnectionData;
      v88->_tokenToConnectionData = (NSMutableDictionary *)Mutable;

      v82 = v88;
    }
    id v85 = v80;
    if (v85)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v82->_tokenToConnectionData, key, v85);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_19DB81878();
    }

    id v9 = v85;
  }
  else
  {
    v74 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v99;
      _os_log_impl(&dword_19D9BE000, v74, OS_LOG_TYPE_DEFAULT, "reached max number of candidate: %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"reached max number of candidate: %u.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"reached max number of candidate: %u.");
        }
      }
    }
LABEL_119:
    id v9 = 0;
  }

LABEL_121:
  return v9;
}

- (id)candidatesFromData:(id)a3 token:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v99 = a4;
  int v9 = objc_msgSend_length(v5, v6, v7, v8);
  id v10 = v5;
  uint64_t v14 = (unsigned __int16 *)objc_msgSend_bytes(v10, v11, v12, v13);
  id v100 = v10;
  unint64_t v18 = objc_msgSend_length(v10, v15, v16, v17);
  if (v18 > 1)
  {
    unint64_t v21 = v18;
    unsigned int v23 = *v14;
    unint64_t v22 = v14 + 1;
    unsigned int v24 = bswap32(v23);
    unsigned int v25 = v24 >> 29;
    unsigned int v26 = HIWORD(v24) & 0x1000;
    unsigned int v104 = (v24 >> 22) & 0x1F;
    int v101 = HIWORD(v24) & 0x3F;
    int v97 = v9;
    v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v26 >> 12;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v104;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v101;
      *(_WORD *)&buf[26] = 2112;
      *(void *)&buf[28] = v100;
      _os_log_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_DEFAULT, "receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@.", buf, 0x24u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@.");
        }
      }
    }
    CFMutableArrayRef theArray = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v102 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v30 = v21 - 2;
    if (v104)
    {
      uint64_t v31 = 0;
      int v32 = 0;
      while (1)
      {
        double v33 = v31;
        if (v30 <= 1) {
          break;
        }
        __int16 v34 = (unsigned int *)(v22 + 1);
        int v35 = (int)bswap32(*v22) >> 16;
        unint64_t v36 = v30 - 2;
        if (v35 < 0)
        {
          if (v36 <= 0xF)
          {
            uint64_t v94 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v32;
              _os_log_impl(&dword_19D9BE000, v94, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for IPv6 address, uint64_t i = %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for IPv6 address, uint64_t i = %d");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for IPv6 address, uint64_t i = %d");
                }
              }
            }
            goto LABEL_142;
          }
          uint64_t v31 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v28, (uint64_t)v34, v29, 16);
          uint64_t v37 = -18;
          uint64_t v38 = 18;
        }
        else
        {
          if (v36 <= 3)
          {
            v86 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v32;
              _os_log_impl(&dword_19D9BE000, v86, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for IPv4 address, uint64_t i = %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for IPv4 address, uint64_t i = %d");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for IPv4 address, uint64_t i = %d");
                }
              }
            }
            goto LABEL_142;
          }
          uint64_t v31 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v28, *v34, v29);
          uint64_t v37 = -6;
          uint64_t v38 = 6;
        }

        if (v31) {
          BOOL v39 = theArray != 0;
        }
        else {
          BOOL v39 = 0;
        }
        if (v39) {
          CFArrayAppendValue(theArray, v31);
        }
        if (v102)
        {
          v40 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, (unsigned __int16)v35, v29);
          BOOL v41 = v40 == 0;

          if (!v41)
          {
            double v42 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, (unsigned __int16)v35, v29);
            CFArrayAppendValue(v102, v42);
          }
        }
        unint64_t v22 = (unsigned __int16 *)((char *)v22 + v38);
        v30 += v37;
        if (v104 == ++v32) {
          goto LABEL_34;
        }
      }
      id v85 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v32;
        _os_log_impl(&dword_19D9BE000, v85, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for header, uint64_t i = %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for header, uint64_t i = %d");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for header, uint64_t i = %d");
          }
        }
      }
LABEL_142:
      v20 = 0;
      goto LABEL_143;
    }
    uint64_t v31 = 0;
LABEL_34:
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v110 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v98 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v101)
    {
      int v44 = 0;
      uint64_t v45 = 134218240;
      while (v30 > 1)
      {
        if ((v30 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          v88 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v105 = 67109120;
            LODWORD(v106) = v44;
            _os_log_impl(&dword_19D9BE000, v88, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for port, uint64_t i = %d", v105, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for port, uint64_t i = %d");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for port, uint64_t i = %d");
              }
            }
          }
          goto LABEL_134;
        }
        int v46 = v22;
        unsigned int v47 = bswap32(*v22) >> 16;
        if ((v47 & 0x1F) >= v104)
        {
          v54 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v105 = 134218240;
            unint64_t v106 = v47 & 0x1F;
            __int16 v107 = 1024;
            unsigned int v108 = v104;
            _os_log_impl(&dword_19D9BE000, v54, OS_LOG_TYPE_DEFAULT, "invalid ip_index (%lu >= %d).", v105, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"invalid ip_index (%lu >= %d).");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid ip_index (%lu >= %d).");
              }
            }
          }
        }
        else
        {
          unsigned __int16 v48 = v22[1];
          v49 = objc_msgSend_objectAtIndex_(theArray, v43, v47 & 0x1F, *(double *)&v45);

          if (v49)
          {
            uint64_t v52 = v47 >> 12;
            if (v47 < 0x4000)
            {
              uint64_t v56 = v47 >> 5;
              if (v56 < 5)
              {
                v58 = objc_msgSend_objectAtIndex_(v102, v50, v47 & 0x1F, v51);
                unsigned __int16 v62 = objc_msgSend_unsignedShortValue(v58, v59, v60, v61);

                if ((__int16)v62 < 0)
                {
                  memset(&buf[8], 0, 20);
                  *(void *)buf = 7708;
                  *(_WORD *)&buf[2] = v48;
                  if ((unint64_t)objc_msgSend_length(v49, v63, v64, v65) <= 0xF)
                  {
                    v96 = OSLogHandleForTransportCategory();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long v105 = 67109120;
                      LODWORD(v106) = v44;
                      _os_log_impl(&dword_19D9BE000, v96, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for sin6_addr.s6_addr, uint64_t i = %d", v105, 8u);
                    }

                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for sin6_addr.s6_addr, uint64_t i = %d");
                        if (_IDSShouldLog()) {
                          _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for sin6_addr.s6_addr, uint64_t i = %d");
                        }
                      }
                    }
                    v20 = 0;
                    uint64_t v31 = v49;
                    goto LABEL_135;
                  }
                  id v67 = v49;
                  *(_OWORD *)&buf[8] = *(_OWORD *)objc_msgSend_bytes(v67, v68, v69, v70);
                  unsigned int v66 = 1280;
                }
                else
                {
                  *(void *)&buf[8] = 0;
                  *(void *)buf = 528;
                  *(_WORD *)&buf[2] = v48;
                  *(_DWORD *)&uint8_t buf[4] = objc_msgSend_unsignedLongValue(v49, v63, v64, v65);
                  unsigned int v66 = 1450;
                }
                uint64_t v71 = ((__int16)v62 >> 10) & 0xF;
                if (v66 >= 0x578) {
                  __int16 v72 = 1400;
                }
                else {
                  __int16 v72 = v66;
                }
                if (v71 == 9) {
                  __int16 v72 = v66;
                }
                if (v71) {
                  __int16 v73 = v72;
                }
                else {
                  __int16 v73 = v66;
                }
                if (v56 == 3) {
                  int v74 = 896;
                }
                else {
                  int v74 = 0;
                }
                if (v56 == 2) {
                  int v74 = 4;
                }
                if ((v62 & 0x8000u) == 0) {
                  int v75 = 1;
                }
                else {
                  int v75 = 2;
                }
                __int16 LinkOverhead = GLUtilGetLinkOverhead(v75 | v74);
                double v79 = objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v77, v52, v78, v56, v71, (unsigned __int16)(v73 - LinkOverhead), 0xFFFFFFFFLL, buf, buf);
                objc_msgSend_setActive_(v79, v80, (v62 >> 14) & 1, v81);
                if ((v62 & 0x200) != 0) {
                  objc_msgSend_setLinkFlags_(v79, v82, 4, v83);
                }
                if (v98 && v79) {
                  CFArrayAppendValue(v98, v79);
                }
                v84 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long v105 = 138412290;
                  unint64_t v106 = (unint64_t)v79;
                  _os_log_impl(&dword_19D9BE000, v84, OS_LOG_TYPE_DEFAULT, "receive remote candidate %@.", v105, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport(@"GL", @"IDS", @"receive remote candidate %@.");
                    if (_IDSShouldLog()) {
                      _IDSLogV(0, @"IDSFoundation", @"GL", @"receive remote candidate %@.");
                    }
                  }
                }
              }
              else
              {
                uint64_t v57 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long v105 = 134217984;
                  unint64_t v106 = v47 >> 5;
                  _os_log_impl(&dword_19D9BE000, v57, OS_LOG_TYPE_DEFAULT, "candidatesFromData: transport is invalid: %lu.", v105, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport(@"GL", @"IDS", @"candidatesFromData: transport is invalid: %lu.");
                    if (_IDSShouldLog()) {
                      _IDSLogV(0, @"IDSFoundation", @"GL", @"candidatesFromData: transport is invalid: %lu.");
                    }
                  }
                }
              }
            }
            else
            {
              uint64_t v53 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long v105 = 134217984;
                unint64_t v106 = v47 >> 12;
                _os_log_impl(&dword_19D9BE000, v53, OS_LOG_TYPE_DEFAULT, "candidatesFromData: IDSStunCandidateType is invalid: %lu.", v105, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(@"GL", @"IDS", @"candidatesFromData: IDSStunCandidateType is invalid: %lu.");
                  if (_IDSShouldLog()) {
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"candidatesFromData: IDSStunCandidateType is invalid: %lu.");
                  }
                }
              }
            }
            uint64_t v31 = v49;
          }
          else
          {
            double v55 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long v105 = 134217984;
              unint64_t v106 = v47 & 0x1F;
              _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "found no ipAdderss at index %lu.", v105, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"found no ipAdderss at index %lu.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"found no ipAdderss at index %lu.");
                }
              }
            }
            uint64_t v31 = 0;
          }
        }
        ++v44;
        v30 -= 4;
        unint64_t v22 = v46 + 2;
        if (v101 == v44)
        {
          LODWORD(v22) = v46 + 4;
          goto LABEL_126;
        }
      }
      uint64_t v87 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 67109120;
        LODWORD(v106) = v44;
        _os_log_impl(&dword_19D9BE000, v87, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for candidateHeader, uint64_t i = %d", v105, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for candidateHeader, uint64_t i = %d");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for candidateHeader, uint64_t i = %d");
          }
        }
      }
    }
    else
    {
LABEL_126:
      id v89 = v100;
      if (v22 - objc_msgSend_bytes(v89, v90, v91, v92) == v97)
      {
        v20 = v98;
LABEL_135:

        double v33 = v31;
LABEL_143:

        goto LABEL_144;
      }
      int v93 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v105 = 67109120;
        LODWORD(v106) = v97;
        _os_log_impl(&dword_19D9BE000, v93, OS_LOG_TYPE_DEFAULT, "invalid connection data length (%d).", v105, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"invalid connection data length (%d).");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"invalid connection data length (%d).");
          }
        }
      }
    }
LABEL_134:
    v20 = 0;
    goto LABEL_135;
  }
  v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for header", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"Error: connectionData is too short for header");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"Error: connectionData is too short for header");
      }
    }
  }
  v20 = 0;
LABEL_144:

  return v20;
}

- (unint64_t)deliveryStatus:(id)a3
{
  Value = 0;
  if (a3)
  {
    tokenToDeliveryStatus = self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)tokenToDeliveryStatus, a3);
    }
    uint64_t v3 = vars8;
  }
  return objc_msgSend_unsignedIntegerValue(Value, a2, (uint64_t)a3, v4);
}

- (void)setDeliveryStatus:(id)a3 status:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    CFDictionaryRef tokenToDeliveryStatus = (const __CFDictionary *)self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus) {
      CFDictionaryRef tokenToDeliveryStatus = (const __CFDictionary *)CFDictionaryGetValue(tokenToDeliveryStatus, v8);
    }
    uint64_t v11 = objc_msgSend_unsignedIntegerValue(tokenToDeliveryStatus, v6, v7, v9);
    if (v11 != a4)
    {
      uint64_t v14 = v11;
      if (!self->_tokenToDeliveryStatus)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v16 = self->_tokenToDeliveryStatus;
        self->_CFDictionaryRef tokenToDeliveryStatus = Mutable;
      }
      double v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, a4, v13);
      if (v17)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToDeliveryStatus, v8, v17);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_19DB81900();
      }

      v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v8;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        unint64_t v25 = a4;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "set connection data delivery status for %@ (%lu->%lu).", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"set connection data delivery status for %@ (%lu->%lu).");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"set connection data delivery status for %@ (%lu->%lu).");
          }
        }
      }
    }
  }
  else
  {
    unint64_t v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "set connection data delivery status failed due to invalid token.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"LC_GLOBALLINK", @"IDS", @"set connection data delivery status failed due to invalid token.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"LC_GLOBALLINK", @"set connection data delivery status failed due to invalid token.");
        }
      }
    }
  }
}

- (void)removeData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    tokenToConnectionData = self->_tokenToConnectionData;
    if (tokenToConnectionData) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToConnectionData, v4);
    }
    CFDictionaryRef tokenToDeliveryStatus = self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToDeliveryStatus, v4);
    }
    uint64_t v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "removed connection data for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"removed connection data for %@.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"removed connection data for %@.");
        }
      }
    }
  }
  else
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "remove connection data failed due to invalid token.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"LC_GLOBALLINK", @"IDS", @"remove connection data failed due to invalid token.");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"LC_GLOBALLINK", @"remove connection data failed due to invalid token.");
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToDeliveryStatus, 0);
  objc_storeStrong((id *)&self->_tokenToConnectionData, 0);
}

@end