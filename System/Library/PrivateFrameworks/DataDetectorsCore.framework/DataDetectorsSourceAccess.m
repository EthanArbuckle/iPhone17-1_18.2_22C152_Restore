@interface DataDetectorsSourceAccess
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)clientCanWriteSource:(int)a3;
- (BOOL)privacySystemWriteEntitled;
- (BOOL)privacyUserReadEntitled;
- (BOOL)privacyUserWriteEntitled;
- (BOOL)pushSourcesContent:(id)a3 forSource:(int)a4 signature:(id)a5;
- (id)fileHandleForSourceRead:(int)a3 resourceType:(unint64_t)a4;
- (int)processIdentifier;
- (unsigned)userIdentifier;
- (void)fileForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5;
- (void)filesForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5;
- (void)setAuditToken:(id *)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setUserIdentifier:(unsigned int)a3;
- (void)writeSourceFromJSONFile:(id)a3 source:(id)a4 withReply:(id)a5;
- (void)writeSourceFromRawData:(id)a3 source:(id)a4 signature:(id)a5 withReply:(id)a6;
@end

@implementation DataDetectorsSourceAccess

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_clientuid = a3;
}

- (unsigned)userIdentifier
{
  return self->_clientuid;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_clientpid = a3;
}

- (int)processIdentifier
{
  return self->_clientpid;
}

- (void)setAuditToken:(id *)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (BOOL)pushSourcesContent:(id)a3 forSource:(int)a4 signature:(id)a5
{
  keys[3] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (__CFString *)a5;
  if ([v8 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v68 = v9;
      int v69 = a4;
      v67[0] = self;
      if ((a4 - 1) > 5) {
        unint64_t v10 = 0;
      }
      else {
        unint64_t v10 = qword_19DCCFA18[a4 - 1];
      }
      StreamCompressor = (void (*)(void, void, void, void))DDLookupTableCreate();
      v67[1] = v67;
      MEMORY[0x1F4188790](StreamCompressor);
      v73 = (const UInt8 *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v8 count])
      {
        uint64_t v14 = 0;
        char v15 = 0;
        v70 = (void *)*MEMORY[0x1E4F1D260];
        do
        {
          v16 = objc_msgSend(v8, "firstObject", v67[0]);
          [v8 removeObjectAtIndex:0];
          if ([v8 count] < v10)
          {
            *(_DWORD *)&v73[4 * v14] = 0;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = v16;
              v18 = [v17 objectForKeyedSubscript:@"threshold"];
              v19 = [v17 objectForKeyedSubscript:@"domain"];
              v20 = [v17 objectForKeyedSubscript:@"entities"];
              v21 = [v17 objectForKeyedSubscript:@"keywords"];
              if (v19) {
                v22 = v19;
              }
              else {
                v22 = v70;
              }
              [v72 addObject:v22];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  DDSourceAddDomainContent(StreamCompressor, v69, v14, v20, v21);
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();
                  int v24 = 0;
                  if (isKindOfClass) {
                    objc_msgSend(v18, "floatValue", 0.0);
                  }
                  *(_DWORD *)&v73[4 * v14] = v24;
                }
              }

              char v15 = 1;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                DDSourceAddDomainContent(StreamCompressor, v69, v14, v16, 0);
              }
            }
            ++v14;
          }
        }
        while ([v8 count]);
        if (v14 >= 1)
        {
          if (v15) {
            DDLookupTableSetContextThresholds((uint64_t)StreamCompressor, v69, (uint64_t)v73, v14);
          }
          CFStringRef v25 = v68;
          if (v68)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              CFStringRef v25 = 0;
            }
          }
          if ([v72 count] || v25) {
            DDSourceAddDomainsNames((uint64_t)StreamCompressor, v69, (CFArrayRef)v72, v25);
          }
        }
      }
      v12 = StreamCompressor;
      if (!StreamCompressor) {
        goto LABEL_67;
      }
      int v26 = *(_DWORD *)(v67[0] + 44);
      FinalizedSourceContent = DDSourceCreateFinalizedSourceContent((uint64_t)StreamCompressor);
      CFRelease(v12);
      if (FinalizedSourceContent)
      {
        int v28 = v69;
        if (_DDTriePathForSource(v69, (const char *)v76, 0, 1, v26))
        {
          size_t Length = CFDataGetLength((CFDataRef)FinalizedSourceContent);
          if (_DDTriePathForSource(v28, (const char *)v75, 0, 0, v26))
          {
            int v30 = mkstemp((char *)v75);
            if (v30 != -1)
            {
              int v31 = v30;
              BytePtr = CFDataGetBytePtr((CFDataRef)FinalizedSourceContent);
              if (Length)
              {
                if (VolumeSupportsCompression())
                {
                  CFAllocatorRef v33 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
                  CFArrayRef v34 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
                  if (v34)
                  {
                    CFArrayRef v35 = v34;
                    v73 = BytePtr;
                    v74[0] = *(const void **)MEMORY[0x1E4F1CFD0];
                    v74[1] = v74[0];
                    v74[2] = v34;
                    v36 = (void *)*MEMORY[0x1E4F4D878];
                    keys[0] = *(void **)MEMORY[0x1E4F4D880];
                    keys[1] = v36;
                    keys[2] = *(void **)MEMORY[0x1E4F4D870];
                    CFDictionaryRef v37 = CFDictionaryCreate(v33, (const void **)keys, v74, 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                    if (v37)
                    {
                      CFDictionaryRef v38 = v37;
                      uint64_t StreamCompressorQueueWithOptions = CreateStreamCompressorQueueWithOptions();
                      CFRelease(v38);
                      CFRelease(v35);
                      BytePtr = v73;
                      if (StreamCompressorQueueWithOptions)
                      {
                        StreamCompressor = (void (*)(void, void, void, void))CreateStreamCompressor();
                        if (StreamCompressor)
                        {
                          ssize_t v40 = Length;
                          if (WriteToStreamCompressor() != Length)
                          {
                            if (DDLogHandle_onceToken != -1) {
                              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                            }
                            v41 = DDLogHandle_error_log_handle;
                            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                            {
                              v65 = __error();
                              v66 = strerror(*v65);
                              LODWORD(v74[0]) = 136315138;
                              *(const void **)((char *)v74 + 4) = v66;
                              _os_log_error_impl(&dword_19DC95000, v41, OS_LOG_TYPE_ERROR, "DD Failed writing stream (error: %s)", (uint8_t *)v74, 0xCu);
                            }
                            ssize_t v40 = 0;
                          }
                          if (!CloseStreamCompressor())
                          {
LABEL_57:
                            if (FinishStreamCompressorQueue())
                            {
                              if (DDLogHandle_onceToken != -1) {
                                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                              }
                              v43 = DDLogHandle_error_log_handle;
                              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                              {
                                v61 = __error();
                                v62 = strerror(*v61);
                                LODWORD(v74[0]) = 136315138;
                                *(const void **)((char *)v74 + 4) = v62;
                                _os_log_error_impl(&dword_19DC95000, v43, OS_LOG_TYPE_ERROR, "DD Failed compressing (error: %s)", (uint8_t *)v74, 0xCu);
                              }
                              ssize_t v40 = 0;
                            }
                            BytePtr = v73;
                            if (StreamCompressor) {
                              goto LABEL_78;
                            }
                            goto LABEL_77;
                          }
                          if (DDLogHandle_onceToken != -1) {
                            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                          }
                          v42 = DDLogHandle_error_log_handle;
                          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                          {
                            v63 = __error();
                            v64 = strerror(*v63);
                            LODWORD(v74[0]) = 136315138;
                            *(const void **)((char *)v74 + 4) = v64;
                            _os_log_error_impl(&dword_19DC95000, v42, OS_LOG_TYPE_ERROR, "DD Failed closing stream (error: %s)", (uint8_t *)v74, 0xCu);
                          }
                        }
                        ssize_t v40 = 0;
                        goto LABEL_57;
                      }
                    }
                    else
                    {
                      CFRelease(v35);
                      BytePtr = v73;
                    }
                  }
                }
              }
LABEL_77:
              ssize_t v40 = write(v31, BytePtr, Length);
LABEL_78:
              if ((v28 & 0xFFFFFFFD) != 4) {
                fchmod(v31, 0x184u);
              }
              close(v31);
              if (v40 != Length)
              {
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                v9 = (__CFString *)v68;
                uint64_t v56 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_97;
                }
                LODWORD(v74[0]) = 136315138;
                *(const void **)((char *)v74 + 4) = v75;
                v53 = "DDCore: Could not write tmp lookup file %s";
                v54 = v56;
                uint32_t v55 = 12;
                goto LABEL_96;
              }
              if (unlink((const char *)v76) && *__error() != 2)
              {
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                v9 = (__CFString *)v68;
                uint64_t v57 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_97;
                }
                v58 = __error();
                v59 = strerror(*v58);
                LODWORD(v74[0]) = 136315394;
                *(const void **)((char *)v74 + 4) = v59;
                WORD2(v74[1]) = 2080;
                *(const void **)((char *)&v74[1] + 6) = v75;
                v53 = "DDCore: Could not unlink lookup file (%s) %s";
                v54 = v57;
                uint32_t v55 = 22;
                goto LABEL_96;
              }
              rename(v75, v76, v48);
              if (v49)
              {
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                v9 = (__CFString *)v68;
                uint64_t v50 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_97;
                }
                v51 = __error();
                v52 = strerror(*v51);
                LODWORD(v74[0]) = 136315650;
                *(const void **)((char *)v74 + 4) = v75;
                WORD2(v74[1]) = 2080;
                *(const void **)((char *)&v74[1] + 6) = v76;
                HIWORD(v74[2]) = 2080;
                v74[3] = v52;
                v53 = "DDCore: Could not move lookup file from %s to %s (error: %s)";
                v54 = v50;
                uint32_t v55 = 32;
LABEL_96:
                _os_log_error_impl(&dword_19DC95000, v54, OS_LOG_TYPE_ERROR, v53, (uint8_t *)v74, v55);
LABEL_97:
                unlink((const char *)v75);
LABEL_98:
                CFRelease(FinalizedSourceContent);
                LOBYTE(v12) = 0;
                goto LABEL_99;
              }
              CFRelease(FinalizedSourceContent);
              LOBYTE(v12) = 1;
              DDSourceRemoveFile(v28, v26, 1);
LABEL_67:
              v9 = (__CFString *)v68;
LABEL_99:

              goto LABEL_100;
            }
          }
          else
          {
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            v9 = (__CFString *)v68;
            v44 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR)) {
              goto LABEL_74;
            }
            LODWORD(v74[0]) = 136315138;
            *(const void **)((char *)v74 + 4) = v76;
            _os_log_error_impl(&dword_19DC95000, v44, OS_LOG_TYPE_ERROR, "DDCore: Could create tmp path file for %s", (uint8_t *)v74, 0xCu);
          }
          v9 = (__CFString *)v68;
          if (DDLogHandle_onceToken != -1) {
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
          }
LABEL_74:
          v45 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            v46 = __error();
            v47 = strerror(*v46);
            LODWORD(v74[0]) = 136315394;
            *(const void **)((char *)v74 + 4) = v47;
            WORD2(v74[1]) = 2080;
            *(const void **)((char *)&v74[1] + 6) = v75;
            _os_log_error_impl(&dword_19DC95000, v45, OS_LOG_TYPE_ERROR, "DDCore: Could not create tmp lookup file (%s) %s", (uint8_t *)v74, 0x16u);
          }
          goto LABEL_98;
        }
        CFRelease(FinalizedSourceContent);
      }
      LOBYTE(v12) = 0;
      goto LABEL_67;
    }
    LOBYTE(v12) = 0;
  }
  else
  {
    LODWORD(v12) = self->_clientuid;
    BOOL v11 = DDSourceRemoveFile(a4, (int)v12, 0);
    DDSourceRemoveFile(a4, (int)v12, 1);
    LOBYTE(v12) = v11;
  }
LABEL_100:

  return (char)v12;
}

- (BOOL)clientCanWriteSource:(int)a3
{
  if (altPath) {
    return 1;
  }
  if ((a3 & 0xFFFFFFFD) == 4) {
    return [(DataDetectorsSourceAccess *)self privacyUserWriteEntitled];
  }
  return [(DataDetectorsSourceAccess *)self privacySystemWriteEntitled];
}

- (id)fileHandleForSourceRead:(int)a3 resourceType:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (altPath) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = (a3 & 0xFFFFFFFD) == 4;
  }
  if ((!v7 || [(DataDetectorsSourceAccess *)self privacyUserReadEntitled])
    && _DDTriePathForSource(a3, v11, a4 == 1, 1, self->_clientuid)
    && (uint64_t v8 = open(v11, 0), (int)v8 >= 3))
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v8 closeOnDealloc:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)privacySystemWriteEntitled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_privacySystemWriteEntitlementChecked)
  {
    [(DataDetectorsSourceAccess *)self auditToken];
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.datadetectors.source-write.system", 0);
      if (v5)
      {
        v6 = v5;
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
          self->_privacySystemWriteEntitled = 1;
        }
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    if (!self->_privacySystemWriteEntitled)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v8 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int clientpid = self->_clientpid;
        *(_DWORD *)buf = 67109378;
        int v13 = clientpid;
        __int16 v14 = 2112;
        char v15 = @"com.apple.datadetectors.source-write.system";
        _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }
    }
    self->_privacySystemWriteEntitlementChecked = 1;
  }
  return self->_privacySystemWriteEntitled;
}

- (BOOL)privacyUserWriteEntitled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_privacyUserWriteEntitlementChecked)
  {
    [(DataDetectorsSourceAccess *)self auditToken];
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.datadetectors.source-write.user", 0);
      if (v5)
      {
        v6 = v5;
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
          self->_privacyUserWriteEntitled = 1;
        }
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    if (!self->_privacyUserWriteEntitled)
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      uint64_t v8 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int clientpid = self->_clientpid;
        *(_DWORD *)buf = 67109378;
        int v13 = clientpid;
        __int16 v14 = 2112;
        char v15 = @"com.apple.datadetectors.source-write.user";
        _os_log_error_impl(&dword_19DC95000, v8, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }
    }
    self->_privacyUserWriteEntitlementChecked = 1;
  }
  return self->_privacyUserWriteEntitled;
}

- (BOOL)privacyUserReadEntitled
{
  if (_dd_dispatch_get_queue_for_read_entitlements_onceToken != -1) {
    dispatch_once(&_dd_dispatch_get_queue_for_read_entitlements_onceToken, &__block_literal_global_90);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__DataDetectorsSourceAccess_privacyUserReadEntitled__block_invoke;
  block[3] = &unk_1E5985760;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_dd_dispatch_get_queue_for_read_entitlements_sQueue, block);
  return self->_privacyUserReadEntitled;
}

void __52__DataDetectorsSourceAccess_privacyUserReadEntitled__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[49])
  {
    [v2 auditToken];
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.datadetectors.source-read.user", 0);
      if (v5)
      {
        v6 = v5;
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
          *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
        }
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v8 + 48))
    {
      if (DDLogHandle_onceToken != -1) {
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
      }
      v9 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 67109378;
        int v13 = v10;
        __int16 v14 = 2112;
        char v15 = @"com.apple.datadetectors.source-read.user";
        _os_log_error_impl(&dword_19DC95000, v9, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }

      uint64_t v8 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v8 + 49) = 1;
  }
}

- (void)writeSourceFromJSONFile:(id)a3 source:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  audit_token_t v11 = _dd_dispatch_get_queue_for_writing();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__DataDetectorsSourceAccess_writeSourceFromJSONFile_source_withReply___block_invoke;
  v15[3] = &unk_1E5985738;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __70__DataDetectorsSourceAccess_writeSourceFromJSONFile_source_withReply___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3B25D0]();
  uint64_t v3 = [*(id *)(a1 + 32) intValue];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = v3;
    if ([*(id *)(a1 + 40) clientCanWriteSource:v3])
    {
      CFTypeRef v5 = *(void **)(a1 + 48);
      if (v5)
      {
        if ((int)[v5 fileDescriptor] >= 3)
        {
          v6 = (void *)MEMORY[0x19F3B25D0]();
          BOOL v7 = [*(id *)(a1 + 48) readDataToEndOfFile];
          id v20 = 0;
          id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:1 error:&v20];
          id v9 = v20;
          if (v9)
          {
            id v10 = 0;
            audit_token_t v11 = 0;
          }
          else
          {
            audit_token_t v11 = [v8 objectForKeyedSubscript:@"domains"];
            if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (DDLogHandle_onceToken != -1) {
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
              }
              char v15 = (id)DDLogHandle_error_log_handle;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                uint64_t v18 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                uint64_t v22 = v18;
                _os_log_error_impl(&dword_19DC95000, v15, OS_LOG_TYPE_ERROR, "Domains is not a NSMutableDictionary (%@)", buf, 0xCu);
              }

              id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DataDetectorsCoreSourceAccess" code:2 userInfo:0];
            }
            else
            {
              id v9 = 0;
            }
            id v10 = [v8 objectForKeyedSubscript:@"signature"];
            if (v10)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                id v16 = (id)DDLogHandle_error_log_handle;
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v19 = objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  uint64_t v22 = v19;
                  __int16 v23 = 2112;
                  int v24 = v10;
                  _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "Signature is not a NSString (%@:%@)", buf, 0x16u);
                }

                uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"DataDetectorsCoreSourceAccess" code:1 userInfo:0];

                id v9 = (id)v17;
              }
            }
          }

          if (v9)
          {
            if (DDLogHandle_onceToken != -1) {
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
            }
            id v12 = (id)DDLogHandle_error_log_handle;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = (uint64_t)v9;
              _os_log_error_impl(&dword_19DC95000, v12, OS_LOG_TYPE_ERROR, "Could not read JSON content (%@)", buf, 0xCu);
            }
          }
          else
          {
            [*(id *)(a1 + 40) pushSourcesContent:v11 forSource:v4 signature:v10];
          }
        }
      }
      else
      {
        int v13 = [*(id *)(a1 + 32) intValue];
        int v14 = *(_DWORD *)(*(void *)(a1 + 40) + 44);
        DDSourceRemoveFile(v13, v14, 0);
        DDSourceRemoveFile(v13, v14, 1);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)writeSourceFromRawData:(id)a3 source:(id)a4 signature:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = _dd_dispatch_get_queue_for_writing();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__DataDetectorsSourceAccess_writeSourceFromRawData_source_signature_withReply___block_invoke;
  block[3] = &unk_1E5985710;
  id v20 = v11;
  v21 = self;
  id v22 = v10;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_sync(v14, block);
}

void __79__DataDetectorsSourceAccess_writeSourceFromRawData_source_signature_withReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3B25D0]();
  uint64_t v3 = [*(id *)(a1 + 32) intValue];
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = v3;
    if ([*(id *)(a1 + 40) clientCanWriteSource:v3]) {
      [*(id *)(a1 + 40) pushSourcesContent:*(void *)(a1 + 48) forSource:v4 signature:*(void *)(a1 + 56)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)filesForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v18 = (void (**)(id, void *))a5;
  context = (void *)MEMORY[0x19F3B25D0]();
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = -[DataDetectorsSourceAccess fileHandleForSourceRead:resourceType:](self, "fileHandleForSourceRead:resourceType:", [*(id *)(*((void *)&v19 + 1) + 8 * i) intValue], a4);
        if (v15)
        {
          [v9 addObject:v15];
        }
        else
        {
          id v16 = [MEMORY[0x1E4F1CA98] null];
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v18[2](v18, v9);
}

- (void)fileForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = (void *)MEMORY[0x19F3B25D0]();
  id v10 = -[DataDetectorsSourceAccess fileHandleForSourceRead:resourceType:](self, "fileHandleForSourceRead:resourceType:", [v11 intValue], a4);
  v8[2](v8, v10);
}

@end