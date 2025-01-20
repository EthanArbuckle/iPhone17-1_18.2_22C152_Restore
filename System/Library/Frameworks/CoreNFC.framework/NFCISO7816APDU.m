@interface NFCISO7816APDU
- (NFCISO7816APDU)initWithData:(NSData *)data;
- (NFCISO7816APDU)initWithInstructionClass:(uint8_t)instructionClass instructionCode:(uint8_t)instructionCode p1Parameter:(uint8_t)p1Parameter p2Parameter:(uint8_t)p2Parameter data:(NSData *)data expectedResponseLength:(NSInteger)expectedResponseLength;
- (NSData)data;
- (NSInteger)expectedResponseLength;
- (id)asData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint8_t)instructionClass;
- (uint8_t)instructionCode;
- (uint8_t)p1Parameter;
- (uint8_t)p2Parameter;
@end

@implementation NFCISO7816APDU

- (NFCISO7816APDU)initWithInstructionClass:(uint8_t)instructionClass instructionCode:(uint8_t)instructionCode p1Parameter:(uint8_t)p1Parameter p2Parameter:(uint8_t)p2Parameter data:(NSData *)data expectedResponseLength:(NSInteger)expectedResponseLength
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v15 = data;
  if (!expectedResponseLength || (unint64_t)(expectedResponseLength - 65537) <= 0xFFFFFFFFFFFEFFFDLL)
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Invalid expectedResponseLength value; should be from 1 to 65536 or -1",
        v27,
        ClassName,
        Name,
        33);
    }
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v44 = v30;
      __int16 v45 = 2082;
      v46 = object_getClassName(self);
      __int16 v47 = 2082;
      v48 = sel_getName(a2);
      __int16 v49 = 1024;
      int v50 = 33;
      _os_log_impl(&dword_2214B8000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid expectedResponseLength value; should be from 1 to 65536 or -1",
        buf,
        0x22u);
    }

    v31 = 0;
    goto LABEL_32;
  }
  v42.receiver = self;
  v42.super_class = (Class)NFCISO7816APDU;
  v16 = [(NFCISO7816APDU *)&v42 init];
  if (v16)
  {
    v17 = v16;
    v18 = (NSData *)objc_opt_new();
    buf[0] = instructionClass;
    buf[1] = instructionCode;
    buf[2] = p1Parameter;
    buf[3] = p2Parameter;
    [(NSData *)v18 appendBytes:buf length:4];
    unint64_t v19 = [(NSData *)v15 length];
    if ([(NSData *)v15 length])
    {
      if (expectedResponseLength > 256 || v19 >= 0x100)
      {
        LOBYTE(v40) = 0;
        HIBYTE(v40) = (unsigned __int16)[(NSData *)v15 length] >> 8;
        char v41 = [(NSData *)v15 length];
        v20 = v18;
        uint64_t v21 = 3;
      }
      else
      {
        LOBYTE(v40) = [(NSData *)v15 length];
        v20 = v18;
        uint64_t v21 = 1;
      }
      [(NSData *)v20 appendBytes:&v40 length:v21];
      uint64_t v32 = [(NSData *)v18 length];
      uint64_t v33 = [(NSData *)v15 length];
      v17->_payloadOffset.location = v32;
      v17->_payloadOffset.length = v33;
      [(NSData *)v18 appendData:v15];
    }
    else
    {
      v17->_payloadOffset = (_NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
    v17->_le = expectedResponseLength;
    if (expectedResponseLength >= 1)
    {
      uint64_t v34 = [(NSData *)v15 length];
      if (expectedResponseLength < 257 || v34)
      {
        if (expectedResponseLength > 256 || v19 >= 0x100)
        {
          __int16 v40 = bswap32(expectedResponseLength) >> 16;
          v35 = v18;
          uint64_t v36 = 2;
        }
        else
        {
          LOBYTE(v40) = expectedResponseLength;
          v35 = v18;
          uint64_t v36 = 1;
        }
      }
      else
      {
        LOBYTE(v40) = 0;
        HIBYTE(v40) = BYTE1(expectedResponseLength);
        char v41 = expectedResponseLength;
        v35 = v18;
        uint64_t v36 = 3;
      }
      [(NSData *)v35 appendBytes:&v40 length:v36];
    }
    fullPacket = v17->_fullPacket;
    v17->_fullPacket = v18;

    self = v17;
    v31 = self;
LABEL_32:

    goto LABEL_33;
  }
  v31 = 0;
LABEL_33:

  return v31;
}

- (NFCISO7816APDU)initWithData:(NSData *)data
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  v5 = data;
  v107.receiver = self;
  v107.super_class = (Class)NFCISO7816APDU;
  v6 = [(NFCISO7816APDU *)&v107 init];
  if (!v6) {
    goto LABEL_14;
  }
  v7 = v5;
  uint64_t v8 = [(NSData *)v7 bytes];
  *(int64x2_t *)(v6 + 8) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((void *)v6 + 3) = -1;
  if ([(NSData *)v7 length] > 3)
  {
    if ([(NSData *)v7 length] == 4) {
      goto LABEL_16;
    }
    v25 = (unsigned __int8 *)(v8 + 4);
    uint64_t v26 = [(NSData *)v7 length];
    uint64_t v27 = (unsigned __int8 *)(v8 + v26);
    if (v26 < 5)
    {
      int v42 = 0;
      BOOL v29 = 0;
      BOOL v31 = 0;
      unsigned int v30 = -1;
    }
    else
    {
      unsigned int v28 = *v25;
      BOOL v29 = *v25 == 0;
      if (*v25)
      {
        v25 = (unsigned __int8 *)(v8 + 5);
        unsigned int v30 = v28;
LABEL_22:
        BOOL v31 = v28 != 0;
        if (v27 - v25 >= v30)
        {
          *((void *)v6 + 1) = &v25[-v8];
          *((void *)v6 + 2) = v30;
          v25 += v30;
        }
        else if (v27 - v25 >= 1)
        {
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            uint64_t v33 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v6);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v6);
            Name = sel_getName(a2);
            uint64_t v37 = 45;
            if (isMetaClass) {
              uint64_t v37 = 43;
            }
            v33(3, "%c[%{public}s %{public}s]:%i Missing data specified by Lc", v37, ClassName, Name, 148);
          }
          v15 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          v38 = object_getClass(v6);
          if (class_isMetaClass(v38)) {
            int v39 = 43;
          }
          else {
            int v39 = 45;
          }
          __int16 v40 = object_getClassName(v6);
          char v41 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v109 = v39;
          __int16 v110 = 2082;
          v111 = v40;
          __int16 v112 = 2082;
          v113 = v41;
          __int16 v114 = 1024;
          int v115 = 148;
          v20 = "%c[%{public}s %{public}s]:%i Missing data specified by Lc";
          goto LABEL_12;
        }
        int v42 = 1;
        goto LABEL_38;
      }
      if (v26 == 5)
      {
        int v42 = 0;
        BOOL v29 = 0;
        unsigned int v30 = 0;
        v25 = (unsigned __int8 *)(v8 + 5);
        BOOL v31 = 1;
      }
      else
      {
        if ((unint64_t)v26 <= 6)
        {
          uint64_t v90 = NFLogGetLogger();
          if (v90)
          {
            v91 = (void (*)(uint64_t, const char *, ...))v90;
            v92 = object_getClass(v6);
            BOOL v93 = class_isMetaClass(v92);
            v94 = object_getClassName(v6);
            v106 = sel_getName(a2);
            uint64_t v95 = 45;
            if (v93) {
              uint64_t v95 = 43;
            }
            v91(3, "%c[%{public}s %{public}s]:%i Unexpected Lc & Le field combination", v95, v94, v106, 133);
          }
          v15 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          v96 = object_getClass(v6);
          if (class_isMetaClass(v96)) {
            int v97 = 43;
          }
          else {
            int v97 = 45;
          }
          v98 = object_getClassName(v6);
          v99 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v109 = v97;
          __int16 v110 = 2082;
          v111 = v98;
          __int16 v112 = 2082;
          v113 = v99;
          __int16 v114 = 1024;
          int v115 = 133;
          v20 = "%c[%{public}s %{public}s]:%i Unexpected Lc & Le field combination";
          goto LABEL_12;
        }
        v25 = (unsigned __int8 *)(v8 + 7);
        unsigned int v30 = __rev16(*(unsigned __int16 *)(v8 + 5));
        if (v30) {
          goto LABEL_22;
        }
        int v42 = 0;
        BOOL v31 = 0;
        BOOL v29 = 1;
      }
    }
LABEL_38:
    if (v25 == v27)
    {
      uint64_t v54 = [(NSData *)v7 copy];
      v55 = (void *)*((void *)v6 + 4);
      *((void *)v6 + 4) = v54;

      if (*((void *)v6 + 1) == 0x7FFFFFFFFFFFFFFFLL && (v31 || v29))
      {
        if (v31) {
          int v56 = 256;
        }
        else {
          int v56 = 0x10000;
        }
        if (v30) {
          int v56 = v30;
        }
        *((void *)v6 + 3) = v56;
      }
      goto LABEL_17;
    }
    int64_t v43 = v27 - v25;
    if (v43 == 2)
    {
      if (v31)
      {
        uint64_t v57 = NFLogGetLogger();
        if (v57)
        {
          v58 = (void (*)(uint64_t, const char *, ...))v57;
          v59 = object_getClass(v6);
          BOOL v60 = class_isMetaClass(v59);
          v61 = object_getClassName(v6);
          v103 = sel_getName(a2);
          uint64_t v62 = 45;
          if (v60) {
            uint64_t v62 = 43;
          }
          v58(3, "%c[%{public}s %{public}s]:%i Unexpected short Lc & extended Le combination", v62, v61, v103, 176);
        }
        v15 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        v63 = object_getClass(v6);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        v65 = object_getClassName(v6);
        v66 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v109 = v64;
        __int16 v110 = 2082;
        v111 = v65;
        __int16 v112 = 2082;
        v113 = v66;
        __int16 v114 = 1024;
        int v115 = 176;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected short Lc & extended Le combination";
        goto LABEL_12;
      }
      uint64_t v78 = *v25;
      *((void *)v6 + 3) = v78 << 8;
      unint64_t v79 = v25[1] | ((unint64_t)v78 << 8);
      uint64_t v77 = 0x10000;
      if (v79) {
        uint64_t v77 = v79;
      }
    }
    else
    {
      if (v43 != 1)
      {
        uint64_t v67 = NFLogGetLogger();
        if (v67)
        {
          v68 = (void (*)(uint64_t, const char *, ...))v67;
          v69 = object_getClass(v6);
          BOOL v70 = class_isMetaClass(v69);
          v71 = object_getClassName(v6);
          v104 = sel_getName(a2);
          uint64_t v72 = 45;
          if (v70) {
            uint64_t v72 = 43;
          }
          v68(3, "%c[%{public}s %{public}s]:%i Unexpected lc & le field combination", v72, v71, v104, 184);
        }
        v15 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        v73 = object_getClass(v6);
        if (class_isMetaClass(v73)) {
          int v74 = 43;
        }
        else {
          int v74 = 45;
        }
        v75 = object_getClassName(v6);
        v76 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v109 = v74;
        __int16 v110 = 2082;
        v111 = v75;
        __int16 v112 = 2082;
        v113 = v76;
        __int16 v114 = 1024;
        int v115 = 184;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected lc & le field combination";
        goto LABEL_12;
      }
      if (v29)
      {
        uint64_t v44 = NFLogGetLogger();
        if (v44)
        {
          __int16 v45 = (void (*)(uint64_t, const char *, ...))v44;
          v46 = object_getClass(v6);
          BOOL v47 = class_isMetaClass(v46);
          v48 = object_getClassName(v6);
          v102 = sel_getName(a2);
          uint64_t v49 = 45;
          if (v47) {
            uint64_t v49 = 43;
          }
          v45(3, "%c[%{public}s %{public}s]:%i Unexpected extended Lc & short Le combination", v49, v48, v102, 170);
        }
        v15 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        int v50 = object_getClass(v6);
        if (class_isMetaClass(v50)) {
          int v51 = 43;
        }
        else {
          int v51 = 45;
        }
        v52 = object_getClassName(v6);
        v53 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v109 = v51;
        __int16 v110 = 2082;
        v111 = v52;
        __int16 v112 = 2082;
        v113 = v53;
        __int16 v114 = 1024;
        int v115 = 170;
        v20 = "%c[%{public}s %{public}s]:%i Unexpected extended Lc & short Le combination";
        goto LABEL_12;
      }
      uint64_t v77 = *v25;
    }
    *((void *)v6 + 3) = v77;
    if (v42 && *((void *)v6 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v80 = NFLogGetLogger();
      if (v80)
      {
        v81 = (void (*)(uint64_t, const char *, ...))v80;
        v82 = object_getClass(v6);
        BOOL v83 = class_isMetaClass(v82);
        v84 = object_getClassName(v6);
        v105 = sel_getName(a2);
        uint64_t v85 = 45;
        if (v83) {
          uint64_t v85 = 43;
        }
        v81(3, "%c[%{public}s %{public}s]:%i Missing data when Lc is > 0", v85, v84, v105, 189);
      }
      v15 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      v86 = object_getClass(v6);
      if (class_isMetaClass(v86)) {
        int v87 = 43;
      }
      else {
        int v87 = 45;
      }
      v88 = object_getClassName(v6);
      v89 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v109 = v87;
      __int16 v110 = 2082;
      v111 = v88;
      __int16 v112 = 2082;
      v113 = v89;
      __int16 v114 = 1024;
      int v115 = 189;
      v20 = "%c[%{public}s %{public}s]:%i Missing data when Lc is > 0";
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v22 = [(NSData *)v7 copy];
    v23 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v22;

LABEL_17:
    uint64_t v21 = v6;
    goto LABEL_18;
  }
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    v11 = object_getClass(v6);
    BOOL v12 = class_isMetaClass(v11);
    v13 = object_getClassName(v6);
    v100 = sel_getName(a2);
    uint64_t v14 = 45;
    if (v12) {
      uint64_t v14 = 43;
    }
    v10(3, "%c[%{public}s %{public}s]:%i Invalid APDU format", v14, v13, v100, 106);
  }
  v15 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    goto LABEL_13;
  }
  v16 = object_getClass(v6);
  if (class_isMetaClass(v16)) {
    int v17 = 43;
  }
  else {
    int v17 = 45;
  }
  v18 = object_getClassName(v6);
  unint64_t v19 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  int v109 = v17;
  __int16 v110 = 2082;
  v111 = v18;
  __int16 v112 = 2082;
  v113 = v19;
  __int16 v114 = 1024;
  int v115 = 106;
  v20 = "%c[%{public}s %{public}s]:%i Invalid APDU format";
LABEL_12:
  _os_log_impl(&dword_2214B8000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_13:

LABEL_14:
  uint64_t v21 = 0;
LABEL_18:

  return v21;
}

- (uint8_t)instructionClass
{
  return *(unsigned char *)[(NSData *)self->_fullPacket bytes];
}

- (uint8_t)instructionCode
{
  return *(unsigned char *)([(NSData *)self->_fullPacket bytes] + 1);
}

- (uint8_t)p1Parameter
{
  return *(unsigned char *)([(NSData *)self->_fullPacket bytes] + 2);
}

- (uint8_t)p2Parameter
{
  return *(unsigned char *)([(NSData *)self->_fullPacket bytes] + 3);
}

- (NSData)data
{
  NSUInteger location = self->_payloadOffset.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[NSData subdataWithRange:](self->_fullPacket, "subdataWithRange:", location, self->_payloadOffset.length);
  }

  return (NSData *)v3;
}

- (NSInteger)expectedResponseLength
{
  return self->_le;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  v6 = (void *)v5;
  if (v5)
  {
    *(_NSRange *)(v5 + 8) = self->_payloadOffset;
    *(void *)(v5 + 24) = self->_le;
    uint64_t v7 = [(NSData *)self->_fullPacket copyWithZone:a3];
    uint64_t v8 = (void *)v6[4];
    v6[4] = v7;
  }
  return v6;
}

- (id)asData
{
  return self->_fullPacket;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"["];
  v4 = [(NSData *)self->_fullPacket bytes];
  if ([(NSData *)self->_fullPacket length])
  {
    unint64_t v5 = 0;
    do
    {
      if ([(NSData *)self->_fullPacket length] - 1 <= v5) {
        v6 = @"0x%02X";
      }
      else {
        v6 = @"0x%02X, ";
      }
      objc_msgSend(v3, "appendFormat:", v6, v4[v5++]);
    }
    while ([(NSData *)self->_fullPacket length] > v5);
  }
  [v3 appendString:@"]"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (void).cxx_destruct
{
}

@end