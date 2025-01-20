@interface IDSGlobalLinkMessage
+ (id)messageWithBuffer:(char *)a3 length:(int)a4;
+ (id)messageWithCommand:(int64_t)a3 attributes:(id)a4;
- (BOOL)_addAttribute:(IDSGlobalLinkAttribute *)a3;
- (BOOL)_write:(char *)a3 outputLength:(int *)a4 dropLowerPriorityFields:(BOOL)a5;
- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSGlobalLinkAttribute *)a4;
- (BOOL)read:(char *)a3 inputLength:(int)a4;
- (BOOL)verifyHMacDigestWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5;
- (BOOL)write:(char *)a3 outputLength:(int *)a4;
- (IDSGlobalLinkMessage)initWithCommand:(int64_t)a3;
- (NSData)hmacKeyData;
- (int64_t)command;
- (void)_addAddressAttribute:(int64_t)a3 value:(sockaddr *)a4;
- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4;
- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4;
- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4;
- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4;
- (void)dealloc;
- (void)setAttributes:(id)a3;
@end

@implementation IDSGlobalLinkMessage

- (IDSGlobalLinkMessage)initWithCommand:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSGlobalLinkMessage;
  result = [(IDSGlobalLinkMessage *)&v5 init];
  if (result) {
    result->_command = a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IDSGlobalLinkMessage;
  [(IDSGlobalLinkMessage *)&v2 dealloc];
}

+ (id)messageWithCommand:(int64_t)a3 attributes:(id)a4
{
  id v5 = a4;
  v6 = [IDSGlobalLinkMessage alloc];
  v9 = objc_msgSend_initWithCommand_(v6, v7, a3, v8);
  objc_msgSend_setAttributes_(v9, v10, (uint64_t)v5, v11);

  return v9;
}

+ (id)messageWithBuffer:(char *)a3 length:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_alloc_init(IDSGlobalLinkMessage);
  objc_msgSend_read_inputLength_(v6, v7, (uint64_t)a3, v8, v4);
  return v6;
}

- (BOOL)_addAttribute:(IDSGlobalLinkAttribute *)a3
{
  if (a3)
  {
    p_int numAttribute = &self->_numAttribute;
    int numAttribute = self->_numAttribute;
    if (numAttribute != 20)
    {
      memcpy(&self->_attributes[numAttribute], a3, sizeof(self->_attributes[numAttribute]));
      ++*p_numAttribute;
      LOBYTE(v6) = 1;
      return v6;
    }
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "maximum GL attribute limit reached, skip.", v12, 2u);
    }

    int v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      int v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(@"GL", @"IDS", @"maximum GL attribute limit reached, skip.");
        int v7 = _IDSShouldLog();
        LOBYTE(v6) = 0;
        if (v7)
        {
          double v8 = @"maximum GL attribute limit reached, skip.";
LABEL_15:
          _IDSLogV(0, @"IDSFoundation", @"GL", v8);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  else
  {
    v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "invalid GL attribute.", buf, 2u);
    }

    int v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      int v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(@"GL", @"IDS", @"invalid GL attribute.");
        int v10 = _IDSShouldLog();
        LOBYTE(v6) = 0;
        if (v10)
        {
          double v8 = @"invalid GL attribute.";
          goto LABEL_15;
        }
      }
    }
  }
  return v6;
}

- (void)_addAddressAttribute:(int64_t)a3 value:(sockaddr *)a4
{
  __int16 v4 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  __b[0] = v4;
  __b[1] = 128;
  __memcpy_chk();
  objc_msgSend__addAttribute_(self, v6, (uint64_t)__b, v7);
}

- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4
{
  __int16 v5 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 2;
  __b[4] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4
{
  __int16 v5 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  LOWORD(__b[0]) = v5;
  HIWORD(__b[0]) = 4;
  __b[2] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4
{
  __int16 v5 = a3;
  __b[130] = *MEMORY[0x1E4F143B8];
  memset(__b, 170, 0x410uLL);
  LOWORD(__b[0]) = v5;
  WORD1(__b[0]) = 8;
  __b[1] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4
{
  unsigned __int16 v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 170, sizeof(__b));
      int v10 = objc_msgSend_length(v6, v7, v8, v9);
      int v11 = v10;
      if ((v10 - 1025) > 0xFFFFFBFF)
      {
        LOWORD(__b[0]) = v4;
        HIWORD(__b[0]) = v10;
        __b[2] = v10;
        id v13 = v6;
        objc_msgSend_bytes(v13, v14, v15, v16);
        __memcpy_chk();
        objc_msgSend__addAttribute_(self, v17, (uint64_t)__b, v18);
      }
      else
      {
        v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v20 = v11;
          __int16 v21 = 1024;
          int v22 = v4;
          _os_log_impl(&dword_19D9BE000, v12, OS_LOG_TYPE_DEFAULT, "failed to add %dB for binary attr type %04x.", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"failed to add %dB for binary attr type %04x.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to add %dB for binary attr type %04x.");
            }
          }
        }
      }
    }
  }
}

- (void)setAttributes:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t command = self->_command;
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = command;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage command:%04lx setAttributes: %@]", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      int64_t v114 = self->_command;
      id v115 = v4;
      _IDSLogTransport(@"GL", @"IDS", @"[IDSGlobalLinkMessage command:%04lx setAttributes: %@]");
      if (_IDSShouldLog())
      {
        int64_t v114 = self->_command;
        id v115 = v4;
        _IDSLogV(0, @"IDSFoundation", @"GL", @"[IDSGlobalLinkMessage command:%04lx setAttributes: %@]");
      }
    }
  }
  objc_msgSend_allKeys(v4, v7, v8, v9, v114, v115);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v118, v11, v122, 16);
  if (v12)
  {
    char v116 = 0;
    uint64_t v13 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v119 != v13) {
          objc_enumerationMutation(obj);
        }
        Value = 0;
        double v16 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        if (v4 && v16) {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v4, *(const void **)(*((void *)&v118 + 1) + 8 * i));
        }
        id v17 = Value;
        if (objc_msgSend_isEqualToString_(v16, v18, @"gl-attr-counter", v19))
        {
          unsigned __int16 v23 = objc_msgSend_unsignedIntValue(v17, v20, v21, v22);
          objc_msgSend__addUInt16Attribute_value_(self, v24, 1, v25, v23);
        }
        else if (objc_msgSend_isEqualToString_(v16, v20, @"gl-attr-skedata", v22))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v26, 4, v27, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v26, @"gl-attr-transport", v27))
        {
          unsigned __int16 v31 = objc_msgSend_unsignedIntValue(v17, v28, v29, v30);
          objc_msgSend__addUInt16Attribute_value_(self, v32, 2, v33, v31);
        }
        else if (objc_msgSend_isEqualToString_(v16, v28, @"gl-attr-rat", v30))
        {
          unsigned __int16 v37 = objc_msgSend_unsignedIntValue(v17, v34, v35, v36);
          objc_msgSend__addUInt16Attribute_value_(self, v38, 5, v39, v37);
        }
        else if (objc_msgSend_isEqualToString_(v16, v34, @"gl-attr-mtu", v36))
        {
          unsigned __int16 v43 = objc_msgSend_unsignedIntValue(v17, v40, v41, v42);
          objc_msgSend__addUInt16Attribute_value_(self, v44, 6, v45, v43);
        }
        else if (objc_msgSend_isEqualToString_(v16, v40, @"gl-attr-conndata", v42))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v46, 3, v47, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v46, @"gl-attr-acceptdelay", v47))
        {
          uint64_t v51 = objc_msgSend_unsignedIntValue(v17, v48, v49, v50);
          objc_msgSend__addUInt32Attribute_value_(self, v52, 7, v53, v51);
        }
        else if (objc_msgSend_isEqualToString_(v16, v48, @"gl-attr-relayremoteaddress", v50))
        {
          uint64_t v57 = objc_msgSend_sa(v17, v54, v55, v56);
          objc_msgSend__addAddressAttribute_value_(self, v58, 8, v59, v57);
        }
        else if (objc_msgSend_isEqualToString_(v16, v54, @"gl-attr-hmac", v56))
        {
          objc_storeStrong((id *)&self->_hmacKeyData, Value);
          char v116 = 1;
        }
        else if (objc_msgSend_isEqualToString_(v16, v60, @"gl-attr-rttreport", v61))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v62, 10, v63, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v62, @"gl-attr-linkuuid", v63))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v64, 11, v65, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v64, @"gl-attr-capability", v65))
        {
          unsigned __int16 v69 = objc_msgSend_unsignedIntValue(v17, v66, v67, v68);
          objc_msgSend__addUInt16Attribute_value_(self, v70, 12, v71, v69);
        }
        else if (objc_msgSend_isEqualToString_(v16, v66, @"gl-attr-local-cbuuid", v68))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v72, 13, v73, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v72, @"gl-attr-remote-cbuuid", v73))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v74, 14, v75, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v74, @"gl-attr-generic-data", v75))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v76, 15, v77, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v76, @"gl-attr-error-code-data", v77))
        {
          uint64_t v81 = objc_msgSend_unsignedIntValue(v17, v78, v79, v80);
          objc_msgSend__addUInt32Attribute_value_(self, v82, 17, v83, v81);
        }
        else if (objc_msgSend_isEqualToString_(v16, v78, @"gl-attr-version", v80))
        {
          uint64_t v87 = objc_msgSend_unsignedShortValue(v17, v84, v85, v86);
          objc_msgSend__addUInt16Attribute_value_(self, v88, 18, v89, v87);
        }
        else if (objc_msgSend_isEqualToString_(v16, v84, @"gl-attr-link-flags", v86))
        {
          uint64_t v93 = objc_msgSend_unsignedShortValue(v17, v90, v91, v92);
          objc_msgSend__addUInt16Attribute_value_(self, v94, 19, v95, v93);
        }
        else if (objc_msgSend_isEqualToString_(v16, v90, @"gl-attr-data-so-mask", v92))
        {
          uint64_t v99 = objc_msgSend_unsignedIntValue(v17, v96, v97, v98);
          objc_msgSend__addUInt32Attribute_value_(self, v100, 20, v101, v99);
        }
        else if (objc_msgSend_isEqualToString_(v16, v96, @"gl-attr-relay-link-interface-info", v98))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v102, 21, v103, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v102, @"gl-attr-mkm", v103))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v104, 22, v105, v17);
        }
        else
        {
          v106 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_impl(&dword_19D9BE000, v106, OS_LOG_TYPE_DEFAULT, "receive invalid attribute key %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"receive invalid attribute key %@.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid attribute key %@.");
              }
            }
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v107, (uint64_t)&v118, v108, v122, 16);
    }
    while (v12);

    if (v116)
    {
      memset(buf, 170, 20);
      v111 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v109, (uint64_t)buf, v110, 20);
      objc_msgSend__addBinaryDataAttribute_value_(self, v112, 9, v113, v111);
    }
  }
  else
  {
  }
}

- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSGlobalLinkAttribute *)a4
{
  unint64_t numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1) {
    return 0;
  }
  attributes = self->_attributes;
  if (self->_attributes[0].type != a3)
  {
    unint64_t v7 = 0;
    uint64_t v8 = &self->_attributes[1];
    while (numAttribute - 1 != v7)
    {
      uint64_t type = v8->type;
      ++v8;
      ++v7;
      if (type == a3)
      {
        BOOL v6 = v7 < numAttribute;
        attributes = v8 - 1;
        goto LABEL_8;
      }
    }
    return 0;
  }
  BOOL v6 = 1;
LABEL_8:
  memcpy(a4, attributes, sizeof(IDSGlobalLinkAttribute));
  return v6;
}

- (BOOL)verifyHMacDigestWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5
{
  macOut[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  memset(macOut, 170, 20);
  v84 = v7;
  if (a5 < 44)
  {
    BOOL v23 = 0;
  }
  else
  {
    id v8 = v7;
    uint64_t v12 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11);
    size_t v16 = objc_msgSend_length(v8, v13, v14, v15);
    CCHmac(0, v12, v16, a4, (a5 - 24), macOut);
    id v17 = &a4[a5];
    uint64_t v18 = *(void *)(v17 - 20);
    uint64_t v19 = *(void *)(v17 - 12);
    uint64_t v20 = *((unsigned int *)v17 - 1);
    BOOL v23 = macOut[0] == v18 && macOut[1] == v19 && LODWORD(macOut[2]) == v20;
  }
  uint64_t v24 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = v23;
    if (v23) {
      v28 = @"YES";
    }
    else {
      v28 = @"NO";
    }
    uint64_t v29 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v25, (uint64_t)macOut, v26, 20);
    objc_msgSend___imHexString(v29, v30, v31, v32);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    double v36 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v34, (uint64_t)&a4[a5 - 20], v35, 20);
    objc_msgSend___imHexString(v36, v37, v38, v39);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend___imHexString(v84, v41, v42, v43);
    *(_DWORD *)buf = 138413058;
    double v86 = v28;
    __int16 v87 = 2112;
    id v88 = v33;
    __int16 v89 = 2112;
    id v90 = v40;
    __int16 v91 = 2112;
    double v92 = v44;
    _os_log_impl(&dword_19D9BE000, v24, OS_LOG_TYPE_DEFAULT, "verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@).", buf, 0x2Au);

    BOOL v23 = v27;
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    if (v23) {
      double v47 = @"YES";
    }
    else {
      double v47 = @"NO";
    }
    v48 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v45, (uint64_t)macOut, v46, 20);
    v52 = objc_msgSend___imHexString(v48, v49, v50, v51);
    double v53 = &a4[a5 - 20];
    double v56 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v54, (uint64_t)v53, v55, 20);
    v60 = objc_msgSend___imHexString(v56, v57, v58, v59);
    v82 = objc_msgSend___imHexString(v84, v61, v62, v63);
    _IDSLogTransport(@"GL", @"IDS", @"verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@).");

    if (_IDSShouldLog())
    {
      v66 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v64, (uint64_t)macOut, v65, 20, v47, v52, v60, v82);
      v70 = objc_msgSend___imHexString(v66, v67, v68, v69);
      double v73 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v71, (uint64_t)v53, v72, 20);
      double v77 = objc_msgSend___imHexString(v73, v74, v75, v76);
      double v83 = objc_msgSend___imHexString(v84, v78, v79, v80);
      _IDSLogV(0, @"IDSFoundation", @"GL", @"verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@).");
    }
  }

  return v23;
}

- (BOOL)write:(char *)a3 outputLength:(int *)a4
{
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] attempting with all fields", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"[IDSGlobalLinkMessage write] attempting with all fields");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"[IDSGlobalLinkMessage write] attempting with all fields");
      }
    }
  }
  if (objc_msgSend__write_outputLength_dropLowerPriorityFields_(self, v8, (uint64_t)a3, v9, a4, 0)) {
    goto LABEL_15;
  }
  uint64_t v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields",
      v19,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields");
      }
    }
  }
  if (objc_msgSend__write_outputLength_dropLowerPriorityFields_(self, v11, (uint64_t)a3, v12, a4, 1))
  {
LABEL_15:
    uint64_t v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] success", v17, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v14 = @"[IDSGlobalLinkMessage write] success";
      goto LABEL_25;
    }
  }
  else
  {
    double v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] WARNING: failed even after dropping lower priority fields", v18, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v14 = @"[IDSGlobalLinkMessage write] WARNING: failed even after dropping lower priority fields";
LABEL_25:
      _IDSLogTransport(@"GL", @"IDS", v14);
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", v14);
      }
    }
  }
  return 1;
}

- (BOOL)_write:(char *)a3 outputLength:(int *)a4 dropLowerPriorityFields:(BOOL)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  *(_WORD *)a3 = bswap32(LOWORD(self->_command)) >> 16;
  *(void *)(a3 + 12) = 0;
  *(void *)(a3 + 4) = 0;
  id v8 = a3 + 20;
  p_int numAttribute = &self->_numAttribute;
  int numAttribute = self->_numAttribute;
  if (numAttribute > 0)
  {
    BOOL v11 = a5;
    uint64_t v12 = 0;
    char v13 = 0;
    attributes = self->_attributes;
    while (1)
    {
      if (!v11 || attributes->type != 22)
      {
        uint64_t v15 = attributes->len + 4;
        int v68 = attributes->len + 4;
        if (v8 - a3 + v15 >= 1025)
        {
          uint64_t v19 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "exceed max command buffer length, stop.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(@"GL", @"IDS", @"exceed max command buffer length, stop.");
              if (_IDSShouldLog()) {
                _IDSLogV(0, @"IDSFoundation", @"GL", @"exceed max command buffer length, stop.");
              }
            }
          }
          BOOL v18 = 0;
          goto LABEL_30;
        }
        switch(attributes->type)
        {
          case 1u:
          case 2u:
          case 5u:
          case 6u:
          case 0xCu:
          case 0x12u:
          case 0x13u:
            writeIDSGLAttrU16(&attributes->type, v8, &v68);
            break;
          case 3u:
          case 4u:
          case 0xAu:
          case 0xBu:
          case 0xDu:
          case 0xEu:
          case 0xFu:
          case 0x15u:
          case 0x16u:
            goto LABEL_7;
          case 7u:
          case 0x14u:
            writeIDSGLAttrU32(&attributes->type, (uint64_t)v8, &v68);
            break;
          case 8u:
            writeIDSGLAttrAddress(&attributes->type, (uint64_t)v8, &v68);
            break;
          case 9u:
            char v13 = 1;
LABEL_7:
            writeIDSGLAttrBinaryData(&attributes->type, v8, &v68);
            break;
          default:
            size_t v16 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              int type = attributes->type;
              *(_DWORD *)buf = 67109120;
              LODWORD(v70) = type;
              _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "receive invalid command attribute (%04x), skip.", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(@"GL", @"IDS", @"receive invalid command attribute (%04x), skip.");
                if (_IDSShouldLog()) {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid command attribute (%04x), skip.");
                }
              }
            }
            break;
        }
        v8 += v68;
        int numAttribute = *p_numAttribute;
      }
      ++v12;
      ++attributes;
      if (v12 >= numAttribute) {
        goto LABEL_22;
      }
    }
  }
  char v13 = 0;
LABEL_22:
  BOOL v18 = 1;
LABEL_30:
  *((_WORD *)a3 + 1) = bswap32(v8 - a3 - 20) >> 16;
  if (a4) {
    *a4 = v8 - a3;
  }
  uint64_t v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = @"NO";
    if (v13) {
      double v22 = @"YES";
    }
    else {
      double v22 = @"NO";
    }
    if (self->_hmacKeyData) {
      uint64_t v21 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v70 = v22;
    __int16 v71 = 2112;
    double v72 = v21;
    _os_log_impl(&dword_19D9BE000, v20, OS_LOG_TYPE_DEFAULT, "has hmac? %@; data: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"has hmac? %@; data: %@");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"has hmac? %@; data: %@");
      }
    }
  }
  if (v13)
  {
    hmacKeyData = self->_hmacKeyData;
    if (hmacKeyData)
    {
      uint64_t v27 = *a4;
      v28 = (const void *)objc_msgSend_bytes(hmacKeyData, v23, v24, v25);
      size_t v32 = objc_msgSend_length(self->_hmacKeyData, v29, v30, v31);
      CCHmac(0, v28, v32, a3, v27 - 24, &a3[v27 - 20]);
      id v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        double v36 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v34, (uint64_t)&a3[*a4 - 20], v35, 20);
        objc_msgSend___imHexString(v36, v37, v38, v39);
        id v40 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend___imHexString(self->_hmacKeyData, v41, v42, v43);
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v70 = v40;
        __int16 v71 = 2112;
        double v72 = v44;
        _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "HMac:%@, Key: %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          double v47 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v45, (uint64_t)&a3[*a4 - 20], v46, 20);
          double v51 = objc_msgSend___imHexString(v47, v48, v49, v50);
          v66 = objc_msgSend___imHexString(self->_hmacKeyData, v52, v53, v54);
          _IDSLogTransport(@"GL", @"IDS", @"HMac:%@, Key: %@");

          if (_IDSShouldLog())
          {
            uint64_t v57 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v55, (uint64_t)&a3[*a4 - 20], v56, 20, v51, v66);
            double v61 = objc_msgSend___imHexString(v57, v58, v59, v60);
            uint64_t v67 = objc_msgSend___imHexString(self->_hmacKeyData, v62, v63, v64);
            _IDSLogV(0, @"IDSFoundation", @"GL", @"HMac:%@, Key: %@");
          }
        }
      }
    }
  }
  return v18;
}

- (BOOL)read:(char *)a3 inputLength:(int)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a4 > 19)
  {
    self->_int64_t command = bswap32(*(unsigned __int16 *)a3) >> 16;
    unsigned int v8 = (bswap32(*((unsigned __int16 *)a3 + 1)) >> 16) + 20;
    if (v8 <= a4)
    {
      int v25 = -1431655766;
      if (a4 >= 0x18)
      {
        unint64_t v11 = 0;
        uint64_t v12 = &a3[a4];
        char v13 = (unsigned __int16 *)(a3 + 24);
        uint64_t v14 = a3 + 20;
        attributes = self->_attributes;
        uint64_t v16 = 67109120;
        while (1)
        {
          unsigned int v17 = bswap32(*(unsigned __int16 *)v14) >> 16;
          attributes->int type = v17;
          int64_t v18 = bswap32(*((unsigned __int16 *)v14 + 1)) >> 16;
          attributes->len = v18;
          int v25 = v18;
          if (v12 - (char *)v13 < v18)
          {
            double v22 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              int v27 = v12 - v13;
              __int16 v28 = 1024;
              unsigned int v29 = v25;
              _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_DEFAULT, "Buffer may overflow, %d, %d, return", buf, 0xEu);
            }

            int v6 = os_log_shim_legacy_logging_enabled();
            if (v6)
            {
              int v6 = _IDSShouldLogTransport();
              if (v6)
              {
                _IDSLogTransport(@"GL", @"IDS", @"Buffer may overflow, %d, %d, return");
                int v6 = _IDSShouldLog();
                if (v6)
                {
                  _IDSLogV(0, @"IDSFoundation", @"GL", @"Buffer may overflow, %d, %d, return");
                  goto LABEL_15;
                }
              }
            }
            return v6;
          }
          if (v18 >= 0x401) {
            break;
          }
          switch(v17)
          {
            case 1u:
            case 2u:
            case 5u:
            case 6u:
            case 0xCu:
            case 0x12u:
            case 0x13u:
              readIDSGLAttrU16((uint64_t)attributes, (char *)&v25, v13, v12 - v13, *(double *)&v16);
              break;
            case 3u:
            case 4u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xDu:
            case 0xEu:
            case 0xFu:
            case 0x15u:
            case 0x16u:
              readIDSGLAttrBinaryData((uint64_t)attributes, (const char *)&v25, v13, v12 - v13, *(double *)&v16);
              break;
            case 7u:
            case 0x14u:
              readIDSGLAttrU32((uint64_t)attributes, (char *)&v25, (unsigned int *)v13, v12 - v13, *(double *)&v16);
              break;
            case 8u:
              readIDSGLAttrAddress((uint64_t)attributes, (const char *)&v25, (uint64_t)v13, v12 - v13, *(double *)&v16);
              break;
            default:
              uint64_t v19 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                int type = attributes->type;
                *(_DWORD *)buf = 67109120;
                int v27 = type;
                _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "receive invalid attribute %04x, skip.", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(@"GL", @"IDS", @"receive invalid attribute %04x, skip.");
                  if (_IDSShouldLog()) {
                    _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid attribute %04x, skip.");
                  }
                }
              }
              break;
          }
          uint64_t v14 = (char *)v13 + v25;
          int v10 = v11 + 1;
          char v13 = (unsigned __int16 *)(v14 + 4);
          if (v14 + 4 <= v12)
          {
            ++attributes;
            if (v11++ < 0x13) {
              continue;
            }
          }
          goto LABEL_18;
        }
        BOOL v23 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v27 = v25;
          _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "attrLen %d is greater than kIDSGLAttributeMaxSize, return", buf, 8u);
        }

        int v6 = os_log_shim_legacy_logging_enabled();
        if (v6)
        {
          int v6 = _IDSShouldLogTransport();
          if (v6)
          {
            _IDSLogTransport(@"GL", @"IDS", @"attrLen %d is greater than kIDSGLAttributeMaxSize, return");
            int v6 = _IDSShouldLog();
            if (v6)
            {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"attrLen %d is greater than kIDSGLAttributeMaxSize, return");
              goto LABEL_15;
            }
          }
        }
      }
      else
      {
        int v10 = 0;
LABEL_18:
        self->_int numAttribute = v10;
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      double v9 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v27 = a4;
        __int16 v28 = 1024;
        unsigned int v29 = v8;
        _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "receive incomplete packet (%d < %d), skip.", buf, 0xEu);
      }

      int v6 = os_log_shim_legacy_logging_enabled();
      if (v6)
      {
        int v6 = _IDSShouldLogTransport();
        if (v6)
        {
          _IDSLogTransport(@"GL", @"IDS", @"receive incomplete packet (%d < %d), skip.");
          int v6 = _IDSShouldLog();
          if (v6)
          {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"receive incomplete packet (%d < %d), skip.");
            goto LABEL_15;
          }
        }
      }
    }
  }
  else
  {
    __int16 v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = a4;
      _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "receive invalid command data length %uB, too short.", buf, 8u);
    }

    int v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      int v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(@"GL", @"IDS", @"receive invalid command data length %uB, too short.");
        int v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"receive invalid command data length %uB, too short.");
LABEL_15:
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

- (int64_t)command
{
  return self->_command;
}

- (NSData)hmacKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end