@interface NEPolicySession
+ (uint64_t)copyTLVForBytes:(uint64_t)a1 messageLength:(uint64_t)a2 type:(unint64_t)a3 includeHeaderOffset:(int)a4 n:(int)a5 hasFlags:(int)a6;
+ (void)addTLVToMessage:(char)a3 type:(uint64_t)a4 length:(uint64_t)a5 value:;
- (BOOL)apply;
- (BOOL)lockSessionToCurrentProcess;
- (BOOL)registerServiceUUID:(id)a3;
- (BOOL)removeAllDomainFilters;
- (BOOL)removeAllDomainTries;
- (BOOL)removeAllPolicies;
- (BOOL)removeDomainFilterWithID:(unint64_t)a3;
- (BOOL)removeDomainTrieWithID:(unint64_t)a3;
- (BOOL)removePolicyWithID:(unint64_t)a3;
- (BOOL)unregisterServiceUUID:(id)a3;
- (NEPolicySession)init;
- (NEPolicySession)initWithSessionName:(id)a3;
- (NEPolicySession)initWithSocket:(int)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)dumpDomainTries;
- (id)dumpKernelPolicies;
- (id)initFromPrivilegedProcess;
- (id)policyWithID:(unint64_t)a3;
- (int)dupSocket;
- (int64_t)priority;
- (unint64_t)addDomainFilterWithData:(id)a3;
- (unint64_t)addDomainTrieWithData:(id)a3;
- (unint64_t)addPolicy:(id)a3;
- (unint64_t)addPolicy:(id)a3 storeLocally:(BOOL)a4;
- (void)dealloc;
- (void)setPriority:(int64_t)a3;
@end

@implementation NEPolicySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);

  objc_storeStrong((id *)&self->_policies, 0);
}

- (BOOL)removeAllPolicies
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    if (necp_session_action()) {
      goto LABEL_3;
    }
    id Property = 0;
LABEL_9:
    [Property removeAllObjects];
    return 1;
  }
  if (!necp_session_action())
  {
    id Property = objc_getProperty(self, v3, 32, 1);
    goto LABEL_9;
  }
LABEL_3:
  int v4 = *__error();
  if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
    __strerrbuf[0] = 0;
  }
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v8[0] = 67109378;
    v8[1] = v4;
    __int16 v9 = 2080;
    v10 = __strerrbuf;
    _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "Failed to delete all policies: [%d] %s", (uint8_t *)v8, 0x12u);
  }

  return 0;
}

- (BOOL)removePolicyWithID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v13 = a3;
  if (!self)
  {
    if (necp_session_action()) {
      goto LABEL_3;
    }
    id Property = 0;
LABEL_9:
    v10 = NSNumber;
    id v11 = Property;
    uint64_t v12 = [v10 numberWithUnsignedInteger:a3];
    [v11 removeObjectForKey:v12];

    return 1;
  }
  if (!necp_session_action())
  {
    id Property = objc_getProperty(self, v5, 32, 1);
    goto LABEL_9;
  }
LABEL_3:
  int v6 = *__error();
  if (strerror_r(v6, __strerrbuf, 0x80uLL)) {
    __strerrbuf[0] = 0;
  }
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v15 = v13;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 2080;
    v19 = __strerrbuf;
    _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "Failed to delete policy %u: [%d] %s", buf, 0x18u);
  }

  return 0;
}

- (id)policyWithID:(unint64_t)a3
{
  if (self) {
    self = (NEPolicySession *)objc_getProperty(self, a2, 32, 1);
  }
  int v4 = NSNumber;
  v5 = self;
  int v6 = [v4 numberWithUnsignedInteger:a3];
  v7 = [(NEPolicySession *)v5 objectForKey:v6];

  return v7;
}

- (BOOL)apply
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Failed to apply policies: [%d] %s", (uint8_t *)v6, 0x12u);
    }
  }
  return v2 == 0;
}

- (id)dumpDomainTries
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 800;
  int v3 = (unsigned int *)malloc_type_malloc(0x320uLL, 0xC88382CDuLL);
  if (!v3)
  {
    uint64_t v2 = 400;
    int v3 = (unsigned int *)malloc_type_malloc(0x190uLL, 0x38CE8722uLL);
    if (!v3)
    {
      int v13 = *__error();
      if (strerror_r(v13, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)v29 = 400;
        *(_WORD *)&v29[8] = 1024;
        *(_DWORD *)&v29[10] = v13;
        __int16 v30 = 2080;
        v31 = __strerrbuf;
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "Failed to allocate memory for trie dump (%zu bytes): [%d] %s", buf, 0x1Cu);
      }

      goto LABEL_26;
    }
  }
  __memset_chk();
  if (necp_session_action())
  {
    int v4 = __error();
    int v5 = *v4;
    if (*v4 != 12)
    {
      if (v5 != 2)
      {
        if (strerror_r(*v4, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        int v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v29 = v5;
          *(_WORD *)&v29[4] = 2080;
          *(void *)&v29[6] = __strerrbuf;
          _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "Failed to dump all tries: [%d] %s", buf, 0x12u);
        }

        goto LABEL_20;
      }
LABEL_15:
      free(v3);
      uint64_t v12 = @"No domain trie entry";
      goto LABEL_27;
    }
    if (strerror_r(12, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    __int16 v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_19:

LABEL_20:
      free(v3);
LABEL_26:
      uint64_t v12 = 0;
      goto LABEL_27;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v29 = 12;
    *(_WORD *)&v29[4] = 2080;
    *(void *)&v29[6] = __strerrbuf;
    uint64_t v10 = "Failed to dump all tries: [%d] %s";
    id v11 = buf;
LABEL_38:
    _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v10, v11, 0x12u);
    goto LABEL_19;
  }
  uint64_t v7 = *v3;
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = v2 - 4;
  if (40 * v7 > (unint64_t)(v2 - 4))
  {
    __int16 v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)__strerrbuf = 67109376;
    *(_DWORD *)&__strerruint8_t buf[4] = v7;
    *(_WORD *)&__strerrbuf[8] = 2048;
    *(void *)&__strerrbuf[10] = v8;
    uint64_t v10 = "Received trie count <%d> invalid with buffer size <%zu>";
    id v11 = __strerrbuf;
    goto LABEL_38;
  }
  *(void *)&__strerrbuf[16] = 0x1400000014;
  *(_OWORD *)__strerrbuf = xmmword_19DF9D2C8;
  uint64_t v12 = [MEMORY[0x1E4F28E78] string];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:0 content:"ID" appendAsNewLine:0 addNewLine:0];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:1 content:"MEMORY" appendAsNewLine:0 addNewLine:0];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:2 content:"NODES(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:3 content:"MAPS(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:4 content:"BYTES(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
  [(__CFString *)v12 appendToStringAtColumnWithContent:__strerrbuf column:5 content:"FLAGS" appendAsNewLine:0 addNewLine:1];
  uint64_t v16 = 0;
  v27 = v3;
  do
  {
    int v17 = &v3[v16];
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v17[1]);
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 0, [v18 UTF8String], 0, 0);
    id v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u", v17[2]);
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 1, [v19 UTF8String], 0, 0);
    id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u : %u", v17[3], v17[6]);
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 2, [v20 UTF8String], 0, 0);
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u : %u", v17[4], v17[7]);
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 3, [v21 UTF8String], 0, 0);
    id v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u : %u", v17[5], v17[8]);
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 4, [v22 UTF8String], 0, 0);
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"[ "];
    v24 = v23;
    unsigned int v25 = v17[10];
    if (v25)
    {
      [v23 appendFormat:@"R|"];
      unsigned int v25 = v17[10];
    }
    if ((v25 & 2) != 0) {
      [v24 appendFormat:@"P|"];
    }
    [v24 appendFormat:@" ]"];
    id v26 = v24;
    -[__CFString appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:](v12, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 5, [v26 UTF8String], 0, 1);

    v16 += 10;
    int v3 = v27;
  }
  while (10 * v7 != v16);
  free(v27);
LABEL_27:

  return v12;
}

- (id)dumpKernelPolicies
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0x80000;
  int v3 = (unsigned int *)malloc_type_malloc(0x80000uLL, 0x576D4F22uLL);
  if (!v3)
  {
    uint64_t v2 = 0x40000;
    int v3 = (unsigned int *)malloc_type_malloc(0x40000uLL, 0x4E230A9FuLL);
    if (!v3)
    {
      int v15 = *__error();
      if (strerror_r(v15, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = 0x40000;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v15;
        *(_WORD *)&buf[18] = 2080;
        v133 = __strerrbuf;
        _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "Failed to allocate memory for policy dump (%zu bytes): [%d] %s", buf, 0x1Cu);
      }

      goto LABEL_24;
    }
  }
  __memset_chk();
  if (necp_session_action())
  {
    int v4 = __error();
    int v5 = *v4;
    if (*v4 != 12)
    {
      if (strerror_r(*v4, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = __strerrbuf;
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "Failed to dump all policies: [%d] %s", buf, 0x12u);
      }

      goto LABEL_23;
    }
    if (strerror_r(12, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 12;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = __strerrbuf;
      uint64_t v7 = "Failed to dump all policies: [%d] %s";
      uint64_t v8 = buf;
      __int16 v9 = v6;
      uint32_t v10 = 18;
LABEL_21:
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v8, v10);
    }
LABEL_22:

LABEL_23:
    free(v3);
LABEL_24:
    int v13 = 0;
    goto LABEL_25;
  }
  unint64_t v11 = *v3;
  if (v11 <= 3)
  {
    int v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)__strerrbuf = 0;
    uint64_t v7 = "Dump TLV size too small, ignoring";
LABEL_20:
    uint64_t v8 = __strerrbuf;
    __int16 v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_21;
  }
  if (v2 - 4 < v11)
  {
    int v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_WORD *)__strerrbuf = 0;
    uint64_t v7 = "Dump TLV size too large, ignoring";
    goto LABEL_20;
  }
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v3 + 1 length:v11];
  free(v3);
  *(_OWORD *)buf = xmmword_19DF9D2B4;
  *(_DWORD *)&buf[16] = 20;
  id v18 = [MEMORY[0x1E4F28E78] string];
  [v18 appendToStringAtColumnWithContent:buf column:0 content:"PROCESS" appendAsNewLine:0 addNewLine:0];
  [v18 appendToStringAtColumnWithContent:buf column:1 content:"SESSION ORDER" appendAsNewLine:0 addNewLine:0];
  [v18 appendToStringAtColumnWithContent:buf column:2 content:"POLICY ORDER" appendAsNewLine:0 addNewLine:0];
  [v18 appendToStringAtColumnWithContent:buf column:3 content:"CONDITIONS" appendAsNewLine:0 addNewLine:0];
  v119 = v18;
  [v18 appendToStringAtColumnWithContent:buf column:4 content:"RESULTS" appendAsNewLine:0 addNewLine:1];
  id v19 = &off_1E598D000;
  id v20 = v17;
  self;
  v125 = [MEMORY[0x1E4F28E78] string];
  uint64_t v21 = [v20 bytes];
  v118 = v20;
  int v22 = 0;
  unint64_t v123 = [v20 length];
  uint64_t v124 = v21;
  unint64_t v23 = v21 + v123;
  v24 = (unsigned __int8 *)v21;
  for (i = v21 + v123; ; unint64_t v23 = i)
  {
    self;
    self;
    if (v23 <= (unint64_t)v24)
    {
      v111 = ne_log_obj();
      if (!os_log_type_enabled(v111, OS_LOG_TYPE_INFO)) {
        goto LABEL_218;
      }
      *(_WORD *)__strerrbuf = 0;
      v112 = "Reached end of TLV Buffer";
      v113 = v111;
      uint32_t v114 = 2;
      goto LABEL_217;
    }
    uint64_t v25 = *(unsigned int *)(v24 + 1);
    if ((unint64_t)&v24[v25 + 5] > v23) {
      break;
    }
    id v26 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[235], v124, v123, 101, v22, 0);
    if (!v26) {
      goto LABEL_219;
    }
    v27 = v26;
    int v128 = v22;
    v129 = v24;
    uint64_t v127 = [v26 length];
    id v28 = v27;
    self;
    id v126 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v131 = v29;
    if ([v28 length])
    {
      uint64_t v30 = 0;
      v31 = 0;
      int v32 = 0;
      while (1)
      {
        uint64_t v33 = v31;
        v34 = (unsigned __int8 *)([v28 bytes] + v30);
        self;
        if (!v34) {
          goto LABEL_199;
        }
        uint64_t v35 = *v34;
        if (!*v34) {
          goto LABEL_199;
        }
        int v130 = *(_DWORD *)(v34 + 1);
        v31 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[235], [v28 bytes] + v30, objc_msgSend(v28, "length"), v35, 0, 0);

        id v36 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        if (v31 && [v31 bytes])
        {
          if ((int)v35 > 99)
          {
            if (v35 == 100 || v35 == 102)
            {
              objc_msgSend(v36, "appendFormat:", @"%s", objc_msgSend(v31, "bytes"), v117);
            }
            else if (v35 == 103)
            {
              uint64_t v38 = *(int *)[v31 bytes];
              v39 = "unknown";
              if (((int)v38 / 1000) <= 0xA) {
                v39 = off_1E5992810[(int)v38 / 1000];
              }
              objc_msgSend(v36, "appendFormat:", @"%s (%u)", v39, v38);
            }
          }
          else
          {
            switch(v35)
            {
              case 2:
                goto LABEL_47;
              case 3:
                if ([v31 length])
                {
                  uint64_t v40 = 0;
                  unsigned int v41 = 0;
                  do
                  {
                    v42 = (unsigned __int8 *)([v31 bytes] + v40);
                    self;
                    if (v42)
                    {
                      v41 += *(_DWORD *)(v42 + 1) + 6;
                      unsigned __int8 v43 = v42[5];
                      LODWORD(v42) = *v42;
                    }
                    else
                    {
                      unsigned __int8 v43 = 0;
                    }
                    v44 = (void *)+[NEPolicySession copyTLVForBytes:messageLength:type:includeHeaderOffset:n:hasFlags:]((uint64_t)v19[235], [v31 bytes] + v40, objc_msgSend(v31, "length"), (int)v42, 0, 1);
                    id v45 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                    id v46 = [v131 objectForKey:&unk_1EF08D198];
                    if (!v46) {
                      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    switch((int)v42)
                    {
                      case 0:
                        v47 = v45;
                        v48 = @"default ";
                        goto LABEL_127;
                      case 1:
                        memset(__strerrbuf, 0, 37);
                        uuid_unparse((const unsigned __int8 *)[v44 bytes], __strerrbuf);
                        v49 = "!";
                        if ((v43 & 1) == 0) {
                          v49 = "";
                        }
                        v117 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", @"%seffective-application:%s ", v49);
                        break;
                      case 2:
                        memset(__strerrbuf, 0, 37);
                        uuid_unparse((const unsigned __int8 *)[v44 bytes], __strerrbuf);
                        v50 = "!";
                        if ((v43 & 1) == 0) {
                          v50 = "";
                        }
                        v117 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", @"%sreal-application:%s ", v50);
                        break;
                      case 3:
                        if (v43) {
                          v51 = "!";
                        }
                        else {
                          v51 = "";
                        }
                        v117 = (char *)[v44 bytes];
                        objc_msgSend(v45, "appendFormat:", @"%sdomain:%s ", v51);
                        break;
                      case 4:
                        if (v43) {
                          v52 = "!";
                        }
                        else {
                          v52 = "";
                        }
                        v117 = (char *)[v44 bytes];
                        objc_msgSend(v45, "appendFormat:", @"%saccount-identifier:%s ", v52);
                        break;
                      case 5:
                        if (v44 && [v44 length])
                        {
                          if (v43) {
                            v53 = "!";
                          }
                          else {
                            v53 = "";
                          }
                          v117 = (char *)[v44 bytes];
                          objc_msgSend(v45, "appendFormat:", @"%scustom-entitlement:%s ", v53);
                        }
                        else
                        {
                          v72 = "!";
                          if ((v43 & 1) == 0) {
                            v72 = "";
                          }
                          v116 = v72;
                          v47 = v45;
                          v48 = @"%sentitlement ";
LABEL_127:
                          objc_msgSend(v47, "appendFormat:", v48, v116);
                        }
                        break;
                      case 6:
                        if (v43) {
                          v54 = "!";
                        }
                        else {
                          v54 = "";
                        }
                        id v55 = v44;
                        objc_msgSend(v45, "appendFormat:", @"%seffective-pid:%u ", v54, *(unsigned int *)objc_msgSend(v55, "bytes"));
                        if ((unint64_t)[v55 length] >= 8)
                        {
                          v117 = (char *)*(unsigned int *)([v55 bytes] + 4);
                          objc_msgSend(v45, "appendFormat:", @"%sversion:%d ", v54);
                        }
                        break;
                      case 7:
                        if (v43) {
                          v56 = "!";
                        }
                        else {
                          v56 = "";
                        }
                        v117 = (char *)*(unsigned int *)[v44 bytes];
                        objc_msgSend(v45, "appendFormat:", @"%suid:%u ", v56);
                        break;
                      case 8:
                        v57 = "!";
                        if ((v43 & 1) == 0) {
                          v57 = "";
                        }
                        objc_msgSend(v45, "appendFormat:", @"%sall-interfaces ", v57);
                        break;
                      case 9:
                        if (v43) {
                          v58 = "!";
                        }
                        else {
                          v58 = "";
                        }
                        v117 = (char *)[v44 bytes];
                        objc_msgSend(v45, "appendFormat:", @"%sscoped-interface:%s ", v58);
                        break;
                      case 10:
                        v59 = (unsigned int *)[v44 bytes];
                        v60 = "!";
                        if ((v43 & 1) == 0) {
                          v60 = "";
                        }
                        v117 = (char *)*v59;
                        objc_msgSend(v45, "appendFormat:", @"%straffic-class-range:%u-%u ", v60);
                        break;
                      case 11:
                        if (v43) {
                          v61 = "!";
                        }
                        else {
                          v61 = "";
                        }
                        v117 = (char *)*(unsigned __int8 *)[v44 bytes];
                        objc_msgSend(v45, "appendFormat:", @"%sip-protocol:%u ", v61);
                        break;
                      case 16:
                        long long v135 = 0u;
                        memset(__strerrbuf, 0, sizeof(__strerrbuf));
                        v67 = (long long *)[v44 bytes];
                        long long v68 = v67[3];
                        long long v70 = *v67;
                        long long v69 = v67[1];
                        *(_OWORD *)&__strerrbuf[32] = v67[2];
                        long long v135 = v68;
                        *(_OWORD *)__strerrbuf = v70;
                        *(_OWORD *)&__strerrbuf[16] = v69;
                        v71 = "!";
                        if ((v43 & 1) == 0) {
                          v71 = "";
                        }
                        v117 = __strerrbuf;
                        objc_msgSend(v45, "appendFormat:", @"%sagent-domain:%s/agent-type:%s", v71);
                        break;
                      default:
                        if ((v42 & 0xFE) == 0xE)
                        {
                          uint64_t v120 = [v44 bytes];
                          v121 = (__CFString *)NECreateAddressString((CFStringRef)v120);
                          CFStringRef v73 = NECreateAddressString((CFStringRef)(v120 + 28));
                          v74 = "!";
                          if ((v43 & 1) == 0) {
                            v74 = "";
                          }
                          if (v121) {
                            v75 = v121;
                          }
                          else {
                            v75 = @"<nil>";
                          }
                          v76 = (__CFString *)v73;
                          if (v42 == 14) {
                            v77 = @"%slocal-address-range:%@-%@";
                          }
                          else {
                            v77 = @"%sremote-address-range:%@-%@";
                          }
                          v117 = (char *)v75;
                          objc_msgSend(v45, "appendFormat:", v77, v74);
                        }
                        else if ((v42 & 0xFE) == 0xC)
                        {
                          v62 = NECreateAddressStringWithPort([v44 bytes] + 1);
                          v63 = "!";
                          if ((v43 & 1) == 0) {
                            v63 = "";
                          }
                          v64 = @"<nil>";
                          if (v62) {
                            v64 = v62;
                          }
                          v65 = v62;
                          if (v42 == 12) {
                            v66 = @"%slocal-address:%@/%u";
                          }
                          else {
                            v66 = @"%sremote-address:%@/%u";
                          }
                          v117 = (char *)v64;
                          objc_msgSend(v45, "appendFormat:", v66, v63);
                        }
                        else
                        {
                          switch((int)v42)
                          {
                            case 17:
                              v78 = "!";
                              if ((v43 & 1) == 0) {
                                v78 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%smodern-network-api", v78);
                              break;
                            case 18:
                              if (v43) {
                                v79 = "!";
                              }
                              else {
                                v79 = "";
                              }
                              v117 = (char *)*(unsigned __int8 *)[v44 bytes];
                              objc_msgSend(v45, "appendFormat:", @"%slocal-networks:%u", v79);
                              break;
                            case 24:
                              if (v43) {
                                v80 = "!";
                              }
                              else {
                                v80 = "";
                              }
                              v117 = (char *)*(unsigned int *)[v44 bytes];
                              objc_msgSend(v45, "appendFormat:", @"%sclient-flags:%u", v80);
                              break;
                            case 25:
                              v81 = "!";
                              if ((v43 & 1) == 0) {
                                v81 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%slocal-address-empty", v81);
                              break;
                            case 26:
                              v82 = "!";
                              if ((v43 & 1) == 0) {
                                v82 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%sremote-address-empty", v82);
                              break;
                            case 27:
                              v83 = "!";
                              if ((v43 & 1) == 0) {
                                v83 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%splatform-binary", v83);
                              break;
                            case 28:
                              v84 = (unsigned int *)[v44 bytes];
                              v85 = "!";
                              if ((v43 & 1) == 0) {
                                v85 = "";
                              }
                              v117 = (char *)*v84;
                              objc_msgSend(v45, "appendFormat:", @"%splatform:%u/sdk-version:%u/min-sdk-version:%u", v85);
                              break;
                            case 29:
                              if (v44 && [v44 length])
                              {
                                if (v43) {
                                  v86 = "!";
                                }
                                else {
                                  v86 = "";
                                }
                                v117 = (char *)[v44 bytes];
                                objc_msgSend(v45, "appendFormat:", @"%ssigning-identifier:%s ", v86);
                              }
                              else
                              {
                                v95 = "!";
                                if ((v43 & 1) == 0) {
                                  v95 = "";
                                }
                                objc_msgSend(v45, "appendFormat:", @"%ssigning-identifier ", v95);
                              }
                              break;
                            case 30:
                              if (v43) {
                                v87 = "!";
                              }
                              else {
                                v87 = "";
                              }
                              v117 = (char *)*(unsigned int *)[v44 bytes];
                              objc_msgSend(v45, "appendFormat:", @"%spacket-filter-tags:%u", v87);
                              break;
                            case 31:
                              v88 = "!";
                              if ((v43 & 1) == 0) {
                                v88 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%sis-loopback", v88);
                              break;
                            case 32:
                              v89 = "!";
                              if ((v43 & 1) == 0) {
                                v89 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%sdelegate-is-platform-binary", v89);
                              break;
                            case 37:
                              if (v43) {
                                v90 = "!";
                              }
                              else {
                                v90 = "";
                              }
                              v117 = (char *)(bswap32(*(unsigned __int16 *)[v44 bytes]) >> 16);
                              objc_msgSend(v45, "appendFormat:", @"%sscheme-port:%u", v90);
                              break;
                            case 38:
                              if (v43) {
                                v91 = "!";
                              }
                              else {
                                v91 = "";
                              }
                              v117 = (char *)*(unsigned int *)[v44 bytes];
                              objc_msgSend(v45, "appendFormat:", @"%sdomain-filter:%u ", v91);
                              break;
                            case 39:
                              v92 = "!";
                              if ((v43 & 1) == 0) {
                                v92 = "";
                              }
                              objc_msgSend(v45, "appendFormat:", @"%ssigned-result", v92);
                              break;
                            case 43:
                              if ((unint64_t)[v44 length] >= 0xC)
                              {
                                v93 = (unsigned int *)[v44 bytes];
                                v94 = "!";
                                if ((v43 & 1) == 0) {
                                  v94 = "";
                                }
                                v117 = (char *)*v93;
                                [v45 appendFormat:@"%sscoped-interface-flags: %X, eflags %X, xflags %X", v94];
                              }
                              break;
                            default:
                              goto LABEL_128;
                          }
                        }
                        break;
                    }
LABEL_128:
                    [v46 addObject:v45];
                    id v29 = v131;
                    [v131 setObject:v46 forKey:&unk_1EF08D198];

                    uint64_t v40 = v41;
                    id v19 = &off_1E598D000;
                  }
                  while ([v31 length] > (unint64_t)v41);
                }
                goto LABEL_50;
              case 5:
LABEL_47:
                objc_msgSend(v36, "appendFormat:", @"%u", *(unsigned int *)objc_msgSend(v31, "bytes"), v117);
                break;
            }
          }
        }
        else
        {
          objc_msgSend(v36, "appendFormat:", @"N/A", v116, v117);
        }
        v37 = [NSNumber numberWithUnsignedChar:v35];
        [v29 setObject:v36 forKey:v37];

LABEL_50:
        uint64_t v30 = (v32 + v130 + 5);

        int v32 = v30;
        if ([v28 length] <= (unint64_t)v30) {
          goto LABEL_199;
        }
      }
    }
    v31 = 0;
LABEL_199:
    if ([v29 count])
    {
      *(_DWORD *)&__strerrbuf[16] = 20;
      *(_OWORD *)__strerrbuf = xmmword_19DF9D2B4;
      id v96 = [v29 objectForKey:&unk_1EF08D1B0];
      v97 = v29;
      v98 = v126;
      objc_msgSend(v126, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 0, objc_msgSend(v96, "UTF8String"), 0, 0);

      id v99 = [v97 objectForKey:&unk_1EF08D1C8];
      objc_msgSend(v126, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 1, objc_msgSend(v99, "UTF8String"), 0, 0);

      id v100 = [v97 objectForKey:&unk_1EF08D1E0];
      objc_msgSend(v126, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 2, objc_msgSend(v100, "UTF8String"), 0, 0);

      v101 = [v97 objectForKey:&unk_1EF08D198];
      if (v101 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (uint64_t v102 = [v101 count]) != 0)
      {
        uint64_t v103 = v102;
        uint64_t v104 = 0;
        uint64_t v105 = v102 - 1;
        do
        {
          id v106 = [v101 objectAtIndex:v104];
          objc_msgSend(v126, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 3, objc_msgSend(v106, "UTF8String"), v104 != 0, v105 != v104);

          ++v104;
        }
        while (v103 != v104);
      }
      else
      {
        [v126 appendToStringAtColumnWithContent:__strerrbuf column:3 content:"--" appendAsNewLine:0 addNewLine:0];
      }
      v107 = v131;
      id v108 = [v131 objectForKey:&unk_1EF08D1F8];
      objc_msgSend(v126, "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:", __strerrbuf, 4, objc_msgSend(v108, "UTF8String"), 0, 1);

      v109 = (__CFString *)v126;
    }
    else
    {
      v109 = [NSString stringWithFormat:@"NO DATA"];
      v107 = v29;
      v98 = v126;
    }
    v24 = &v129[v127 + 5];
    int v22 = v128 + 1;

    if (v109) {
      v110 = v109;
    }
    else {
      v110 = @"nil";
    }
    [v125 appendString:v110];
  }
  int v115 = *v24;
  v111 = ne_log_obj();
  if (!os_log_type_enabled(v111, OS_LOG_TYPE_INFO)) {
    goto LABEL_218;
  }
  *(_DWORD *)__strerrbuf = 134218496;
  *(void *)&__strerruint8_t buf[4] = &v24[-v124];
  *(_WORD *)&__strerrbuf[12] = 1024;
  *(_DWORD *)&__strerrbuf[14] = v115;
  *(_WORD *)&__strerrbuf[18] = 1024;
  *(_DWORD *)&__strerrunsigned char buf[20] = v25;
  v112 = "TLV buffer truncated: cursor - start: %zu, type: %d, length: %u";
  v113 = v111;
  uint32_t v114 = 24;
LABEL_217:
  _os_log_impl(&dword_19DDAF000, v113, OS_LOG_TYPE_INFO, v112, (uint8_t *)__strerrbuf, v114);
LABEL_218:

LABEL_219:
  if (&v24[-v124] != (unsigned __int8 *)v123) {
    [v125 appendString:@"\nMISSING POLICY INFORMATION!\n"];
  }

  int v13 = v119;
  [v119 appendString:v125];

LABEL_25:

  return v13;
}

+ (uint64_t)copyTLVForBytes:(uint64_t)a1 messageLength:(uint64_t)a2 type:(unint64_t)a3 includeHeaderOffset:(int)a4 n:(int)a5 hasFlags:(int)a6
{
  self;
  uint64_t result = 0;
  if (!a2 || !a3) {
    return result;
  }
  unint64_t v12 = 0;
  int v13 = 0;
  while (1)
  {
    uint64_t v14 = a2 + v12;
    if (*(unsigned __int8 *)(a2 + v12) == a4) {
      break;
    }
LABEL_7:
    v12 += *(unsigned int *)(v14 + 1) + 5;
    if (v12 >= a3) {
      return 0;
    }
  }
  if (v13 != a5)
  {
    ++v13;
    goto LABEL_7;
  }
  uint64_t v15 = 5;
  if (a6) {
    uint64_t v15 = 6;
  }
  [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 + v15 length:*(unsigned int *)(v14 + 1)];
  return objc_claimAutoreleasedReturnValue();
}

- (unint64_t)addPolicy:(id)a3
{
  return [(NEPolicySession *)self addPolicy:a3 storeLocally:0];
}

- (unint64_t)addPolicy:(id)a3 storeLocally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  int v6 = (id *)a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_87;
  }
  id v8 = v6[2];
  if (!v8) {
    goto LABEL_87;
  }
  switch(*((void *)v8 + 4))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      goto LABEL_4;
    case 5:
    case 6:
      if (!*((void *)v8 + 6)) {
        goto LABEL_87;
      }
      goto LABEL_4;
    case 8:
    case 0xBLL:
    case 0xFLL:
      if (!*((void *)v8 + 7)) {
        goto LABEL_87;
      }
      goto LABEL_4;
    case 9:
      if (![*((id *)v8 + 8) count]) {
        goto LABEL_87;
      }
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v9 = *((id *)v8 + 8);
      uint64_t v32 = [v9 countByEnumeratingWithState:&v122 objects:__strerrbuf count:16];
      if (!v32) {
        goto LABEL_85;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v123;
      break;
    default:
      goto LABEL_87;
  }
  do
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v123 != v34) {
        objc_enumerationMutation(v9);
      }
      uint64_t v36 = *(void *)(*((void *)&v122 + 1) + 8 * i);
      if (!v36
        || (uint64_t v37 = *(void *)(v36 + 24), (unint64_t)(v37 - 8) < 0xFFFFFFFFFFFFFFF9)
        || (uint64_t v38 = *(void *)(v36 + 48), v38 > 7))
      {
LABEL_86:

LABEL_87:
        unint64_t v28 = 0;
        goto LABEL_204;
      }
      if (*(void *)(v36 + 32))
      {
        if (v38) {
          goto LABEL_86;
        }
      }
      else
      {
        if (v38) {
          BOOL v39 = *(void *)(v36 + 40) == 0;
        }
        else {
          BOOL v39 = 1;
        }
        if (!v39) {
          goto LABEL_86;
        }
      }
      uint64_t v40 = *(void *)(v36 + 16);
      if ((unint64_t)(v37 - 5) > 1)
      {
        if (v40 || v37 == 7 && !*(_DWORD *)(v36 + 8)) {
          goto LABEL_86;
        }
      }
      else if (!v40)
      {
        goto LABEL_86;
      }
    }
    uint64_t v33 = [v9 countByEnumeratingWithState:&v122 objects:__strerrbuf count:16];
  }
  while (v33);
LABEL_85:

LABEL_4:
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v9 = v7[3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v118 objects:buf count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v119;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v119 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v118 + 1) + 8 * v13);
        if (!v14) {
          goto LABEL_86;
        }
        switch(*(void *)(v14 + 72))
        {
          case 1:
          case 2:
            if (!*(void *)(v14 + 80)) {
              goto LABEL_86;
            }
            break;
          case 3:
          case 4:
          case 7:
          case 0xALL:
          case 0xFLL:
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x18:
          case 0x19:
          case 0x1ALL:
          case 0x1BLL:
          case 0x1CLL:
          case 0x1FLL:
          case 0x20:
          case 0x27:
          case 0x28:
            break;
          case 5:
            if (!*(void *)(v14 + 88)) {
              goto LABEL_86;
            }
            break;
          case 6:
            if (!*(void *)(v14 + 96)) {
              goto LABEL_86;
            }
            break;
          case 8:
            if (!*(void *)(v14 + 112)) {
              goto LABEL_86;
            }
            break;
          case 9:
            if (*(_DWORD *)(v14 + 48) > *(_DWORD *)(v14 + 52)) {
              goto LABEL_86;
            }
            break;
          case 0xBLL:
          case 0xDLL:
          case 0x14:
          case 0x16:
            if (!*(void *)(v14 + 120)) {
              goto LABEL_86;
            }
            break;
          case 0xCLL:
          case 0xELL:
          case 0x15:
          case 0x17:
            if (!*(void *)(v14 + 120) || !*(void *)(v14 + 128)) {
              goto LABEL_86;
            }
            break;
          case 0x10:
            if (!*(void *)(v14 + 144) || !*(void *)(v14 + 152)) {
              goto LABEL_86;
            }
            break;
          case 0x1DLL:
            if (!*(void *)(v14 + 160)) {
              goto LABEL_86;
            }
            break;
          case 0x1ELL:
            if (!*(_WORD *)(v14 + 14)) {
              goto LABEL_86;
            }
            break;
          case 0x25:
            if (!*(_WORD *)(v14 + 16)) {
              goto LABEL_86;
            }
            break;
          case 0x26:
            if (!*(_DWORD *)(v14 + 32)) {
              goto LABEL_86;
            }
            break;
          case 0x2ALL:
            if (!*(void *)(v14 + 104)) {
              goto LABEL_86;
            }
            break;
          case 0x2BLL:
            if (!*(_DWORD *)(v14 + 36) && !*(_DWORD *)(v14 + 40) && !*(_DWORD *)(v14 + 44)) {
              goto LABEL_86;
            }
            break;
          default:
            goto LABEL_86;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v15 = [v9 countByEnumeratingWithState:&v118 objects:buf count:16];
      uint64_t v11 = v15;
    }
    while (v15);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  int v17 = v16;
  if (!v16)
  {
    v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_ERROR, "Failed to create add message", (uint8_t *)__strerrbuf, 2u);
    }

    unint64_t v28 = 0;
    goto LABEL_203;
  }
  BOOL v110 = v4;
  id v18 = v16;
  id v19 = &off_1E598D000;
  +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)NEPolicySession, v18, 2, 4, (uint64_t)(v7 + 1));
  id v20 = (char *)v7[2];
  id v21 = v18;
  int v22 = v21;
  if (!v20)
  {
    v112 = v17;
    uint32_t v114 = v7;

LABEL_209:
    v109 = ne_log_obj();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19DDAF000, v109, OS_LOG_TYPE_ERROR, "Failed to add TLVs to message", (uint8_t *)__strerrbuf, 2u);
    }

    unint64_t v28 = 0;
    int v17 = v112;
    uint64_t v7 = v114;
    goto LABEL_203;
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v24 = v23;
  unint64_t v25 = *((void *)v20 + 4) - 1;
  if (v25 > 0xE) {
    unsigned __int8 v26 = 0;
  }
  else {
    unsigned __int8 v26 = byte_19DF9D30B[v25];
  }
  int v115 = self;
  unsigned __int8 v126 = v26;
  [v23 appendBytes:&v126 length:1];
  v117 = v22;
  switch(*((void *)v20 + 4))
  {
    case 1:
      id v29 = (uint64_t *)(v20 + 12);
      goto LABEL_136;
    case 2:
      id v29 = (uint64_t *)(v20 + 8);
      goto LABEL_136;
    case 3:
      int v42 = *((_DWORD *)v20 + 4);
      unsigned int v41 = (uint64_t *)(v20 + 16);
      if (!v42) {
        goto LABEL_139;
      }
      uint64_t v30 = v24;
      id v29 = v41;
      goto LABEL_137;
    case 4:
    case 7:
      id v29 = (uint64_t *)(v20 + 20);
      goto LABEL_136;
    case 5:
      unsigned __int8 v43 = [*((id *)v20 + 6) dataUsingEncoding:1];
      [v24 appendData:v43];
      LOBYTE(v137) = 0;
      v44 = (char *)&v137;
      goto LABEL_207;
    case 6:
      unint64_t v45 = *((void *)v20 + 5) - 1;
      if (v45 > 0xE) {
        int v46 = 0;
      }
      else {
        int v46 = byte_19DF9D30B[v45];
      }
      LODWORD(v137) = v46;
      [v24 appendBytes:&v137 length:4];
      unsigned __int8 v43 = [*((id *)v20 + 6) dataUsingEncoding:1];
      [v24 appendData:v43];
      char v129 = 0;
      v44 = &v129;
LABEL_207:
      [v24 appendBytes:v44 length:1];

      goto LABEL_139;
    case 8:
    case 0xBLL:
    case 0xFLL:
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      [*((id *)v20 + 7) getUUIDBytes:&v137];
      id v29 = &v137;
      uint64_t v30 = v24;
      uint64_t v31 = 16;
      goto LABEL_138;
    case 9:
      v116 = v24;
      v111 = v17;
      v113 = v7;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v47 = *((id *)v20 + 8);
      uint64_t v48 = [v47 countByEnumeratingWithState:&v122 objects:__strerrbuf count:16];
      if (!v48) {
        goto LABEL_134;
      }
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v123;
      break;
    case 0xELL:
      LODWORD(v137) = -1;
      id v29 = &v137;
LABEL_136:
      uint64_t v30 = v24;
LABEL_137:
      uint64_t v31 = 4;
LABEL_138:
      [v30 appendBytes:v29 length:v31];
      goto LABEL_139;
    default:
      goto LABEL_139;
  }
  while (2)
  {
    uint64_t v51 = 0;
    while (2)
    {
      if (*(void *)v123 != v50) {
        objc_enumerationMutation(v47);
      }
      uint64_t v52 = *(void *)(*((void *)&v122 + 1) + 8 * v51);
      if (!v52) {
        goto LABEL_132;
      }
      v53 = (objc_class *)MEMORY[0x1E4F1CA58];
      id v54 = v22;
      id v55 = objc_alloc_init(v53);
      v56 = v55;
      char v57 = 2;
      switch(*(void *)(v52 + 24))
      {
        case 1:
          break;
        case 2:
          if (*(_DWORD *)(v52 + 12)) {
            char v57 = 8;
          }
          else {
            char v57 = 1;
          }
          break;
        case 3:
          char v57 = 3;
          break;
        case 4:
          char v57 = 4;
          break;
        case 5:
          char v57 = 5;
          break;
        case 6:
          char v57 = 6;
          break;
        case 7:
          char v57 = 7;
          break;
        default:
          char v57 = 0;
          break;
      }
      char v129 = v57;
      [v55 appendBytes:&v129 length:1];
      if (*(void *)(v52 + 40))
      {
        LOBYTE(v58) = 0x80;
      }
      else
      {
        unint64_t v59 = *(void *)(v52 + 48);
        BOOL v60 = v59 > 7;
        unint64_t v58 = 0x4020100402010800uLL >> (8 * v59);
        if (v60) {
          LOBYTE(v58) = 0;
        }
      }
      char v128 = v58;
      [v56 appendBytes:&v128 length:1];
      uint64_t v62 = *(void *)(v52 + 24);
      if ((unint64_t)(v62 - 5) < 2)
      {
        uint64_t v137 = 0;
        uint64_t v138 = 0;
        [*(id *)(v52 + 16) getUUIDBytes:&v137];
        v61 = &v137;
        v63 = v56;
        uint64_t v64 = 16;
LABEL_123:
        [v63 appendBytes:v61 length:v64];
        goto LABEL_124;
      }
      if (v62 == 2)
      {
        v61 = (uint64_t *)(v52 + 12);
        if (!*(_DWORD *)(v52 + 12)) {
          goto LABEL_124;
        }
LABEL_122:
        v63 = v56;
        uint64_t v64 = 4;
        goto LABEL_123;
      }
      if (v62 == 7)
      {
        v61 = (uint64_t *)(v52 + 8);
        goto LABEL_122;
      }
LABEL_124:
      v65 = *(void **)(v52 + 40);
      if (*(void *)(v52 + 32))
      {
        if (v65)
        {
          uint64_t v137 = 0;
          uint64_t v138 = 0;
          [v65 getUUIDBytes:&v137];
          [v56 appendBytes:&v137 length:16];
          v66 = [*(id *)(v52 + 32) dataUsingEncoding:1];
          [v56 appendData:v66];
          char v127 = 0;
          v67 = (uint64_t *)&v127;
        }
        else
        {
          v66 = [*(id *)(v52 + 32) dataUsingEncoding:1];
          [v56 appendData:v66];
          LOBYTE(v137) = 0;
          v67 = &v137;
        }
        [v56 appendBytes:v67 length:1];
      }
      else if (v65)
      {
        uint64_t v137 = 0;
        uint64_t v138 = 0;
        [v65 getUUIDBytes:&v137];
        [v56 appendBytes:&v137 length:16];
      }
      uint64_t v68 = (uint64_t)v19[235];
      long long v69 = v19;
      uint64_t v70 = objc_msgSend(v56, "length", v61);
      uint64_t v71 = [v56 bytes];
      uint64_t v72 = v70;
      id v19 = v69;
      +[NEPolicySession addTLVToMessage:type:length:value:](v68, v54, 10, v72, v71);

LABEL_132:
      if (v49 != ++v51) {
        continue;
      }
      break;
    }
    uint64_t v49 = [v47 countByEnumeratingWithState:&v122 objects:__strerrbuf count:16];
    if (v49) {
      continue;
    }
    break;
  }
LABEL_134:

  int v17 = v111;
  uint64_t v7 = v113;
  v24 = v116;
LABEL_139:
  +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[235], v22, 4, [v24 length], objc_msgSend(v24, "bytes"));

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v73 = v7[3];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v118 objects:buf count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    v112 = v17;
    uint32_t v114 = v7;
    uint64_t v76 = *(void *)v119;
    while (2)
    {
      for (uint64_t j = 0; j != v75; ++j)
      {
        if (*(void *)v119 != v76) {
          objc_enumerationMutation(v73);
        }
        uint64_t v78 = *(void *)(*((void *)&v118 + 1) + 8 * j);
        if (!v78)
        {

          goto LABEL_209;
        }
        v79 = (objc_class *)MEMORY[0x1E4F1CA58];
        id v80 = v22;
        id v81 = objc_alloc_init(v79);
        v82 = v81;
        unint64_t v83 = *(void *)(v78 + 72) - 1;
        if (v83 > 0x2A) {
          char v84 = 0;
        }
        else {
          char v84 = byte_19DF9D2E0[v83];
        }
        LOBYTE(v122) = v84;
        [v81 appendBytes:&v122 length:1];
        char v85 = *(unsigned char *)(v78 + 8);
        LOBYTE(v137) = v85;
        if (*(unsigned char *)(v78 + 9)) {
          LOBYTE(v137) = v85 | 2;
        }
        [v82 appendBytes:&v137 length:1];
        switch(*(void *)(v78 + 72))
        {
          case 1:
          case 2:
            *(void *)__strerrbuf = 0;
            *(void *)&__strerrbuf[8] = 0;
            [*(id *)(v78 + 80) getUUIDBytes:__strerrbuf];
            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 16;
            goto LABEL_183;
          case 3:
            uint64_t v96 = *(void *)(v78 + 20);
            goto LABEL_175;
          case 4:
          case 0x28:
            v90 = (char *)(v78 + 28);
            goto LABEL_182;
          case 5:
            v95 = *(void **)(v78 + 88);
            goto LABEL_180;
          case 6:
            v95 = *(void **)(v78 + 96);
            goto LABEL_180;
          case 8:
            v95 = *(void **)(v78 + 112);
            goto LABEL_180;
          case 9:
            uint64_t v96 = *(void *)(v78 + 48);
LABEL_175:
            *(void *)__strerrbuf = v96;
            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 8;
            goto LABEL_183;
          case 0xALL:
          case 0x13:
            v90 = (char *)(v78 + 12);
            goto LABEL_177;
          case 0xBLL:
          case 0xDLL:
          case 0x14:
          case 0x16:
            memset(&__strerrbuf[1], 0, 28);
            __strerrbuf[0] = *(unsigned char *)(v78 + 10);
            v86 = [*(id *)(v78 + 120) addressData];
            [v86 getBytes:&__strerrbuf[1] length:28];

            uint64_t v87 = [*(id *)(v78 + 120) addressFamily];
            if (v87 == 30)
            {
              if (__strerrbuf[0] >= 0x81u) {
                __strerrbuf[0] = 0x80;
              }
            }
            else if (v87 == 2 && __strerrbuf[0] >= 0x21u)
            {
              __strerrbuf[0] = 32;
            }
            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 29;
            goto LABEL_183;
          case 0xCLL:
          case 0xELL:
          case 0x15:
          case 0x17:
            *(void *)&long long v136 = 0;
            long long v135 = 0u;
            memset(__strerrbuf, 0, sizeof(__strerrbuf));
            v88 = [*(id *)(v78 + 120) addressData];
            [v88 getBytes:__strerrbuf length:28];

            v89 = [*(id *)(v78 + 128) addressData];
            [v89 getBytes:&__strerrbuf[28] length:28];

            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 56;
            goto LABEL_183;
          case 0xFLL:
            v95 = *(void **)(v78 + 136);
            if (v95) {
              goto LABEL_180;
            }
            break;
          case 0x10:
            long long v135 = 0u;
            long long v136 = 0u;
            memset(__strerrbuf, 0, sizeof(__strerrbuf));
            [*(id *)(v78 + 144) getCString:__strerrbuf maxLength:32 encoding:4];
            [*(id *)(v78 + 152) getCString:&v135 maxLength:32 encoding:4];
            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 64;
            goto LABEL_183;
          case 0x12:
            v90 = (char *)(v78 + 11);
            v91 = v82;
            uint64_t v92 = 1;
            goto LABEL_183;
          case 0x18:
            v90 = (char *)(v78 + 56);
            goto LABEL_182;
          case 0x1CLL:
            int v94 = *(_DWORD *)(v78 + 64);
            int v93 = *(_DWORD *)(v78 + 68);
            *(_DWORD *)__strerrbuf = *(_DWORD *)(v78 + 60);
            *(_DWORD *)&__strerruint8_t buf[4] = v93;
            *(_DWORD *)&__strerrbuf[8] = v94;
            v90 = __strerrbuf;
            v91 = v82;
            uint64_t v92 = 12;
            goto LABEL_183;
          case 0x1DLL:
            v95 = *(void **)(v78 + 160);
            if (!v95) {
              break;
            }
            goto LABEL_180;
          case 0x1ELL:
            v90 = (char *)(v78 + 14);
            goto LABEL_177;
          case 0x25:
            v90 = (char *)(v78 + 16);
LABEL_177:
            v91 = v82;
            uint64_t v92 = 2;
            goto LABEL_183;
          case 0x26:
            v90 = (char *)(v78 + 32);
            goto LABEL_182;
          case 0x2ALL:
            v95 = *(void **)(v78 + 104);
LABEL_180:
            v97 = [v95 dataUsingEncoding:1];
            [v82 appendData:v97];
            __strerrbuf[0] = 0;
            [v82 appendBytes:__strerrbuf length:1];

            break;
          case 0x2BLL:
            [v82 appendBytes:v78 + 36 length:4];
            [v82 appendBytes:v78 + 40 length:4];
            v90 = (char *)(v78 + 44);
LABEL_182:
            v91 = v82;
            uint64_t v92 = 4;
LABEL_183:
            [v91 appendBytes:v90 length:v92];
            break;
          default:
            break;
        }
        +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[235], v80, 3, [v82 length], objc_msgSend(v82, "bytes"));

        int v22 = v117;
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v118 objects:buf count:16];
      if (v75) {
        continue;
      }
      break;
    }

    int v17 = v112;
    uint64_t v7 = v114;
  }
  else
  {

    *(_WORD *)__strerrbuf = 0;
    +[NEPolicySession addTLVToMessage:type:length:value:]((uint64_t)v19[235], v22, 3, 2, (uint64_t)__strerrbuf);
  }

  [v22 bytes];
  [v22 length];
  LODWORD(v122) = 0;
  if (necp_session_action())
  {
    int v98 = *__error();
    if (strerror_r(v98, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    id v99 = ne_log_obj();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v131 = v98;
      __int16 v132 = 2080;
      v133 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_FAULT, "Failed to add policy: [%d] %s", buf, 0x12u);
    }

    id v100 = ne_log_obj();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v107 = [v117 length];
      *(_DWORD *)__strerrbuf = 134217984;
      *(void *)&__strerruint8_t buf[4] = v107;
      _os_log_debug_impl(&dword_19DDAF000, v100, OS_LOG_TYPE_DEBUG, "Failed to add policy with tlv message of length %zu", (uint8_t *)__strerrbuf, 0xCu);
    }
    unint64_t v28 = 0;
LABEL_202:
  }
  else
  {
    v101 = ne_log_obj();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v108 = [v117 length];
      *(_DWORD *)__strerrbuf = 134217984;
      *(void *)&__strerruint8_t buf[4] = v108;
      _os_log_debug_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_DEBUG, "Added policy with tlv message of length %zu", (uint8_t *)__strerrbuf, 0xCu);
    }

    unint64_t v28 = v122;
    if (v110)
    {
      if (v115) {
        id Property = objc_getProperty(v115, v102, 32, 1);
      }
      else {
        id Property = 0;
      }
      uint64_t v104 = NSNumber;
      id v105 = Property;
      id v100 = [v104 numberWithUnsignedInteger:v28];
      [v105 setObject:v7 forKeyedSubscript:v100];

      goto LABEL_202;
    }
  }
LABEL_203:

LABEL_204:
  return v28;
}

+ (void)addTLVToMessage:(char)a3 type:(uint64_t)a4 length:(uint64_t)a5 value:
{
  char v9 = a3;
  id v7 = a2;
  self;
  [v7 appendBytes:&v9 length:1];
  int v8 = a4;
  [v7 appendBytes:&v8 length:4];
  [v7 appendBytes:a5 length:a4];
}

- (BOOL)removeAllDomainTries
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, (char *)__strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    BOOL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      int v8 = (char *)__strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Failed to remove all domain tries: [%d] %s", (uint8_t *)v6, 0x12u);
    }
  }
  else
  {
    BOOL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "Deleted all domain tries", __strerrbuf, 2u);
    }
  }

  return v2 == 0;
}

- (BOOL)removeDomainTrieWithID:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  if (!necp_session_action())
  {
    int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__strerrbuf = 67109120;
      int v15 = v7;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "Deleted domain trie - ID %u", (uint8_t *)__strerrbuf, 8u);
    }

    return 1;
  }
  if (*__error() == 2) {
    return 1;
  }
  int v3 = *__error();
  if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
    __strerrbuf[0] = 0;
  }
  BOOL v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    __int16 v12 = 2080;
    uint64_t v13 = __strerrbuf;
    _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Failed to remove domain trie %u: [%d] %s", buf, 0x18u);
  }

  return 0;
}

- (unint64_t)addDomainTrieWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (!a3)
  {
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)__strerrbuf = 136315138;
    id v19 = "-[NEPolicySession addDomainTrieWithData:]";
    __int16 v10 = "%s called with null trieData";
    int v11 = (uint8_t *)__strerrbuf;
    __int16 v12 = v7;
    uint32_t v13 = 12;
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v10, v11, v13);
LABEL_6:

    goto LABEL_10;
  }
  [v4 bytes];
  [v5 length];
  if (necp_session_action())
  {
    int v6 = *__error();
    if (strerror_r(v6, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109378;
    int v15 = v6;
    __int16 v16 = 2080;
    int v17 = __strerrbuf;
    __int16 v10 = "Failed to add domain trie: [%d] %s";
    int v11 = buf;
    __int16 v12 = v7;
    uint32_t v13 = 18;
    goto LABEL_12;
  }
  int v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__strerrbuf = 67109120;
    LODWORD(v19) = 0;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "Added domain trie - ID %u", (uint8_t *)__strerrbuf, 8u);
  }

LABEL_10:
  return 0;
}

- (BOOL)removeAllDomainFilters
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      int v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Failed to remove all domain filters: [%d] %s", (uint8_t *)v6, 0x12u);
    }
  }
  return v2 == 0;
}

- (BOOL)removeDomainFilterWithID:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v9 = v7;
      __int16 v10 = 1024;
      int v11 = v4;
      __int16 v12 = 2080;
      uint32_t v13 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "Failed to remove domain filter %u: [%d] %s", buf, 0x18u);
    }
  }
  return v3 == 0;
}

- (unint64_t)addDomainFilterWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (a3)
  {
    [v4 bytes];
    uint64_t v6 = [v5 length];
    if (necp_session_action())
    {
      int v7 = *__error();
      if (strerror_r(v7, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      int v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v14 = v7;
        __int16 v15 = 2080;
        __int16 v16 = __strerrbuf;
        _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "Failed to add domain filter: [%d] %s", buf, 0x12u);
      }

      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        id v18 = (const char *)v6;
        _os_log_debug_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEBUG, "Failed to add domain filter of length %zu", (uint8_t *)__strerrbuf, 0xCu);
      }
    }
    else
    {
      __int16 v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        id v18 = (const char *)v6;
        _os_log_debug_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEBUG, "Added domain filter of length %zu", (uint8_t *)__strerrbuf, 0xCu);
      }
    }
  }
  else
  {
    __int16 v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__strerrbuf = 136315138;
      id v18 = "-[NEPolicySession addDomainFilterWithData:]";
      _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null filterData", (uint8_t *)__strerrbuf, 0xCu);
    }
  }
  return 0;
}

- (BOOL)unregisterServiceUUID:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  v11[1] = 0;
  [a3 getUUIDBytes:v11];
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      __int16 v8 = 2080;
      int v9 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "Failed to unregister service: [%d] %s", (uint8_t *)v7, 0x12u);
    }
  }
  return v3 == 0;
}

- (BOOL)registerServiceUUID:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  v11[1] = 0;
  [a3 getUUIDBytes:v11];
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      __int16 v8 = 2080;
      int v9 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "Failed to register service: [%d] %s", (uint8_t *)v7, 0x12u);
    }
  }
  return v3 == 0;
}

- (BOOL)lockSessionToCurrentProcess
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      __int16 v8 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "Failed to lock session to process: [%d] %s", (uint8_t *)v6, 0x12u);
    }
  }
  return v2 == 0;
}

- (void)setPriority:(int64_t)a3
{
  int64_t v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a3 - 1;
  if (!v4 & v3)
  {
LABEL_4:
    if (a3 > 299)
    {
      switch(a3)
      {
        case 300:
          goto LABEL_6;
        case 301:
          goto LABEL_17;
        case 302:
          goto LABEL_18;
        case 303:
          goto LABEL_19;
        case 304:
          goto LABEL_20;
        default:
          if (a3 == 400) {
            goto LABEL_21;
          }
          if (a3 == 500) {
            goto LABEL_13;
          }
          goto LABEL_22;
      }
    }
    if (a3 > 100)
    {
      if (a3 == 101) {
        goto LABEL_25;
      }
      if (a3 == 200)
      {
LABEL_16:
        int64_t v5 = 200;
        goto LABEL_25;
      }
    }
    else
    {
      if (!a3) {
        goto LABEL_25;
      }
      if (a3 == 100)
      {
LABEL_10:
        int64_t v5 = 100;
        goto LABEL_25;
      }
    }
LABEL_22:
    __int16 v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__strerrbuf = 67109120;
      int v16 = v5;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "Unknown priority level %u", (uint8_t *)__strerrbuf, 8u);
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_16;
      case 3:
LABEL_6:
        int64_t v5 = 300;
        break;
      case 4:
LABEL_17:
        int64_t v5 = 301;
        break;
      case 5:
LABEL_18:
        int64_t v5 = 302;
        break;
      case 6:
LABEL_19:
        int64_t v5 = 303;
        break;
      case 7:
LABEL_20:
        int64_t v5 = 304;
        break;
      case 8:
LABEL_21:
        int64_t v5 = 400;
        break;
      case 9:
LABEL_13:
        int64_t v5 = 500;
        break;
      case 10:
        int64_t v5 = 0xFFFFLL;
        goto LABEL_22;
      default:
        goto LABEL_4;
    }
  }
LABEL_25:
  if (self)
  {
    if (!necp_session_action())
    {
      self->_internalPriority = v5;
      self->_convertToLegacyPriority = v7 < 0xA;
      return;
    }
  }
  else if (!necp_session_action())
  {
    return;
  }
  int v9 = *__error();
  if (strerror_r(v9, __strerrbuf, 0x80uLL)) {
    __strerrbuf[0] = 0;
  }
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v12 = v9;
    __int16 v13 = 2080;
    int v14 = __strerrbuf;
    _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "Failed to set priority: [%d] %s", buf, 0x12u);
  }
}

- (int64_t)priority
{
  if (self)
  {
    char v2 = *(unsigned char *)(self + 8);
    self = *(void *)(self + 24);
    if (v2)
    {
      if (self > 399)
      {
        switch(self)
        {
          case 0x190:
            return 8;
          case 0x1F4:
            return 9;
          case 0xFFFFLL:
            return 10;
        }
      }
      else
      {
        switch(self)
        {
          case 300:
            self = 3;
            break;
          case 301:
            self = 4;
            break;
          case 302:
            self = 5;
            break;
          case 303:
            self = 6;
            break;
          case 304:
            self = 7;
            break;
          default:
            if (self == 100)
            {
              self = 1;
            }
            else if (self == 200)
            {
              self = 2;
            }
            break;
        }
      }
    }
  }
  return self;
}

- (int)dupSocket
{
  if (self && (LODWORD(self) = self->_sessionFD, (self & 0x80000000) != 0)) {
    return -1;
  }
  else {
    return dup((int)self);
  }
}

- (id)description
{
  return [(NEPolicySession *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v7 appendString:@"{"];
  if (self)
  {
    int64_t internalPriority = self->_internalPriority;
    if (internalPriority > 299)
    {
      switch(internalPriority)
      {
        case 300:
          int v9 = @"high";
          break;
        case 301:
          int v9 = @"high1";
          break;
        case 302:
          int v9 = @"high2";
          break;
        case 303:
          int v9 = @"high3";
          break;
        case 304:
          int v9 = @"high4";
          break;
        default:
          if (internalPriority == 400)
          {
            int v9 = @"HighRestricted";
          }
          else
          {
            if (internalPriority != 500) {
              goto LABEL_22;
            }
            int v9 = @"low";
          }
          break;
      }
      goto LABEL_23;
    }
    if (internalPriority > 100)
    {
      if (internalPriority == 101)
      {
        int v9 = @"control1";
        goto LABEL_23;
      }
      if (internalPriority == 200)
      {
        int v9 = @"privileged-tunnel";
        goto LABEL_23;
      }
    }
    else
    {
      if (!internalPriority)
      {
        int v9 = @"default";
        goto LABEL_23;
      }
      if (internalPriority == 100)
      {
        int v9 = @"control";
LABEL_23:
        uint64_t v10 = v9;
        [v7 appendPrettyObject:v10 withName:@"priority" andIndent:v5 options:a4];

        id Property = objc_getProperty(self, v11, 32, 1);
        goto LABEL_24;
      }
    }
LABEL_22:
    int v9 = @"unknown";
    goto LABEL_23;
  }
  [v7 appendPrettyObject:0 withName:@"priority" andIndent:v5 options:a4];
  id Property = 0;
LABEL_24:
  [v7 appendPrettyObject:Property withName:@"policies" andIndent:v5 options:a4];
  [v7 appendString:@"\n}"];

  return v7;
}

- (void)dealloc
{
  char v2 = self;
  if (!self || (LODWORD(self) = self->_sessionFD, (self & 0x80000000) == 0)) {
    close((int)self);
  }
  v3.receiver = v2;
  v3.super_class = (Class)NEPolicySession;
  [(NEPolicySession *)&v3 dealloc];
}

- (NEPolicySession)initWithSessionName:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = -1;
  uint64_t v5 = +[NEFileHandleMaintainer sharedMaintainer];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__NEPolicySession_initWithSessionName___block_invoke;
  v16[3] = &unk_1E5992588;
  id v6 = v4;
  id v17 = v6;
  id v18 = &v19;
  [v5 iterateFileHandlesWithBlock:v16];

  unint64_t v7 = [(NEPolicySession *)self initWithSocket:*((unsigned int *)v20 + 6)];
  __int16 v8 = v7;
  if ((v20[3] & 0x80000000) != 0)
  {
    if (v7)
    {
      int v9 = [[NEPolicySessionFileHandle alloc] initWithPolicySession:v7 name:v6];
      if (v9)
      {
        uint64_t v10 = +[NEFileHandleMaintainer sharedMaintainer];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __39__NEPolicySession_initWithSessionName___block_invoke_2;
        v14[3] = &unk_1E59925B0;
        id v15 = v6;
        [v10 setFileHandle:v9 matchingPredicate:v14];

        SEL v11 = +[NEFileHandleMaintainer sharedMaintainer];
        [v11 commit];
      }
    }
    else
    {
      ne_log_obj();
      int v9 = (NEPolicySessionFileHandle *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_error_impl(&dword_19DDAF000, &v9->super.super, OS_LOG_TYPE_ERROR, "Failed to allocate a NEPolicySession", v13, 2u);
      }
    }
  }
  else
  {
    [(NEPolicySession *)v7 removeAllPolicies];
  }

  _Block_object_dispose(&v19, 8);
  return v8;
}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 name],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*(void *)(a1 + 32)],
        v4,
        v5))
  {
    id v6 = [v3 handle];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dup([v6 fileDescriptor]);

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 name];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NEPolicySession)init
{
  return [(NEPolicySession *)self initWithSocket:0xFFFFFFFFLL];
}

- (id)initFromPrivilegedProcess
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = necp_session_open();
  if ((v3 & 0x80000000) != 0)
  {
    int v5 = *__error();
    if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8[0] = 67109378;
      v8[1] = v5;
      __int16 v9 = 2080;
      uint64_t v10 = __strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "Failed to open NECP session fd: [%d] %s", (uint8_t *)v8, 0x12u);
    }

    id v4 = 0;
  }
  else
  {
    self = [(NEPolicySession *)self initWithSocket:v3];
    id v4 = self;
  }

  return v4;
}

- (NEPolicySession)initWithSocket:(int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NEPolicySession;
  id v4 = [(NEPolicySession *)&v16 init];
  int v5 = v4;
  if (v4)
  {
    v4->_int64_t internalPriority = 0;
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    policies = v5->_policies;
    v5->_policies = v6;

    __int16 v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("NEPolicy Control IO Queue", v8);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v9;

    if ((a3 & 0x80000000) == 0)
    {
      v5->_sessionFD = a3;
LABEL_11:
      uint64_t v12 = v5;
      goto LABEL_12;
    }
    if (getuid()) {
      int NECPSessionFD = NEHelperGetNECPSessionFD();
    }
    else {
      int NECPSessionFD = necp_session_open();
    }
    v5->_sessionFD = NECPSessionFD;
    if ((NECPSessionFD & 0x80000000) == 0) {
      goto LABEL_11;
    }
    int v15 = *__error();
    if (strerror_r(v15, (char *)__strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    SEL v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = v15;
      __int16 v19 = 2080;
      uint64_t v20 = (char *)__strerrbuf;
      _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, "Failed to open NECP session fd: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    SEL v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Failed to init NEPolicySession", __strerrbuf, 2u);
    }
  }

  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

@end