@interface IDSSocketPairResourceTransferReceiver
+ (id)incomingFilePath;
+ (id)incomingFilePathForMessageUUID:(id)a3;
+ (id)modernIncomingFilePath;
- (BOOL)appendMessage:(id)a3 receiverError:(unsigned __int8 *)a4;
- (BOOL)writeResourceData:(id)a3;
- (BOOL)writeResourceData:(id)a3 resourceByteOffset:(unint64_t)a4;
- (IDSSocketPairResourceTransferReceiver)initWithMessage:(id)a3 resumeResourceTransfers:(BOOL)a4 receiverError:(unsigned __int8 *)a5;
- (NSDate)expiryDate;
- (NSString)messageUUID;
- (id)finalizedMessageDictionaryIfDone;
- (unint64_t)totalBytesReceived;
- (void)abortTransfer;
- (void)dealloc;
- (void)setExpiryDate:(id)a3;
@end

@implementation IDSSocketPairResourceTransferReceiver

+ (id)incomingFilePathForMessageUUID:(id)a3
{
  if (a3)
  {
    v4 = sub_19DAD191C(a3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)incomingFilePath
{
  return sub_19DAD191C(0);
}

+ (id)modernIncomingFilePath
{
  v2 = sub_19DAD700C(0);
  uint64_t v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F1C978];
  v5 = NSHomeDirectory();
  v8 = objc_msgSend_arrayWithObjects_(v4, v6, (uint64_t)v5, v7, @"/Library/IdentityServices/files/", v2, 0);
  v11 = objc_msgSend_pathWithComponents_(v3, v9, (uint64_t)v8, v10);

  return v11;
}

- (IDSSocketPairResourceTransferReceiver)initWithMessage:(id)a3 resumeResourceTransfers:(BOOL)a4 receiverError:(unsigned __int8 *)a5
{
  BOOL v5 = a4;
  v200[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v194.receiver = self;
  v194.super_class = (Class)IDSSocketPairResourceTransferReceiver;
  v8 = [(IDSSocketPairResourceTransferReceiver *)&v194 init];
  v12 = v8;
  if (!v8) {
    goto LABEL_147;
  }
  v8->_fileDescriptor = -1;
  if (v5)
  {
    v13 = objc_msgSend_data(v7, v9, v10, v11);
    uint64_t v17 = objc_msgSend_length(v13, v14, v15, v16);
    v20 = objc_msgSend_subdataWithRangeNoCopy_(v13, v18, 1, v19, v17 - 1);
    if (objc_msgSend_compressed(v7, v21, v22, v23))
    {
      uint64_t v27 = objc_msgSend__FTDecompressData(v20, v24, v25, v26);

      v20 = (void *)v27;
    }
    goto LABEL_7;
  }
  int v28 = objc_msgSend_compressed(v7, v9, v10, v11);
  v32 = objc_msgSend_data(v7, v29, v30, v31);
  v13 = v32;
  if (v28)
  {
    v20 = objc_msgSend__FTDecompressData(v32, v33, v34, v35);
LABEL_7:

    goto LABEL_9;
  }
  v20 = v32;
LABEL_9:
  v36 = JWDecodeDictionary();
  uint64_t v37 = objc_opt_class();
  v191 = sub_19DAD2ED8(v37, v36, @"ids-message-resource-transfer-url");
  uint64_t v38 = objc_opt_class();
  v192 = sub_19DAD2ED8(v38, v36, @"ids-message-resource-transfer-total-bytes");
  uint64_t v39 = objc_opt_class();
  v40 = sub_19DAD2ED8(v39, v36, @"ids-message-resource-transfer-expiry-date");
  v44 = v40;
  if (v40)
  {
    v45 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v40, v41, v42, v43);
    v49 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v45, v46, v47, v48);
    v51 = v49;
    if (v191 && v192)
    {
      if (v49)
      {
        objc_msgSend_timeIntervalSinceNow(v49, v41, v42, v50);
        if (v54 <= 3600.0)
        {
          objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v52, v53, 3600.0);
        }
        else
        {
          objc_msgSend_timeIntervalSinceNow(v51, v52, v53, 3600.0);
          objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v56, v57, v55 * 1.1 + 60.0);
        uint64_t v58 = };

        v51 = (void *)v58;
LABEL_29:
        p_expiryDate = &v12->_expiryDate;
        objc_storeStrong((id *)&v12->_expiryDate, v51);
        v12->_unint64_t totalBytesExpected = objc_msgSend_unsignedLongLongValue(v192, v61, v62, v63);
        v189 = sub_19DAD191C(0);
        v67 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v64, v65, v66);
        id v193 = 0;
        v188 = objc_msgSend_attributesOfFileSystemForPath_error_(v67, v68, (uint64_t)v189, v69, &v193);
        id v187 = v193;

        if (!v188)
        {
          v80 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v197 = v5;
            *(_WORD *)&v197[4] = 2112;
            *(void *)&v197[6] = v189;
            _os_log_impl(&dword_19D9BE000, v80, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: cannot get system attributes (%d) for path %@", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog()) {
              MarcoLog();
            }
            if (IMShouldLog()) {
              IMLogString();
            }
          }
          v78 = a5;
          if (!a5) {
            goto LABEL_50;
          }
          char v79 = 2;
          goto LABEL_49;
        }
        v72 = objc_msgSend_objectForKey_(v188, v70, *MEMORY[0x1E4F283A0], v71);
        unint64_t v186 = objc_msgSend_unsignedLongLongValue(v72, v73, v74, v75);

        if (v186 < v12->_totalBytesExpected)
        {
          v76 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t totalBytesExpected = v12->_totalBytesExpected;
            *(_DWORD *)buf = 134218496;
            *(void *)v197 = totalBytesExpected;
            *(_WORD *)&v197[8] = 2048;
            *(void *)&v197[10] = v186;
            __int16 v198 = 1024;
            LODWORD(v199) = v5;
            _os_log_impl(&dword_19D9BE000, v76, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: system space unavailable file %llu system %llu (%d)", buf, 0x1Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog()) {
              MarcoLog();
            }
            if (IMShouldLog()) {
              IMLogString();
            }
          }
          v78 = a5;
          if (!a5) {
            goto LABEL_50;
          }
          char v79 = 4;
LABEL_49:
          unsigned __int8 *v78 = v79;
LABEL_50:
          int v60 = 1;
LABEL_144:

          goto LABEL_145;
        }
        uint64_t v81 = objc_opt_class();
        sub_19DAD2ED8(v81, v36, @"ids-message-resource-transfer-metadata");
        id obj = (id)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend_messageUUID(v7, v82, v83, v84);
        id v181 = v191;
        id v182 = v85;
        v88 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v86, (uint64_t)v181, v87);
        v183 = objc_msgSend_lastPathComponent(v88, v89, v90, v91);

        if (!v183)
        {
          v121 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v197 = v181;
            _os_log_impl(&dword_19D9BE000, v121, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't get last path component from %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              id v170 = v181;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              id v170 = v181;
              IMLogString();
            }
          }
          id v119 = 0;
          LODWORD(v178) = -1;
          goto LABEL_108;
        }
        v180 = sub_19DAD191C(v182);
        v92 = NSString;
        v200[0] = v180;
        v200[1] = v183;
        v95 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v93, (uint64_t)v200, v94, 2);
        objc_msgSend_pathWithComponents_(v92, v96, (uint64_t)v95, v97);
        string = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!string)
        {
          v122 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v197 = v181;
            *(_WORD *)&v197[8] = 2112;
            *(void *)&v197[10] = v180;
            _os_log_impl(&dword_19D9BE000, v122, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't get new path from original %@ destination %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              id v170 = v181;
              v172 = v180;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              id v170 = v181;
              v172 = v180;
              IMLogString();
            }
          }
          id v119 = 0;
          LODWORD(v178) = -1;
          goto LABEL_107;
        }
        v101 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v98, v99, v100);
        id v195 = 0;
        char v104 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v101, v102, (uint64_t)v180, v103, 1, 0, &v195);
        id v176 = v195;

        if ((v104 & 1) == 0)
        {
          v105 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v197 = v181;
            *(_WORD *)&v197[8] = 2112;
            *(void *)&v197[10] = v180;
            _os_log_impl(&dword_19D9BE000, v105, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't create new directory from original %@ destination %@ (may be benign)", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              id v170 = v181;
              v172 = v180;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              id v170 = v181;
              v172 = v180;
              IMLogString();
            }
          }
        }
        size_t MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(string);
        v107 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xDB731B8EuLL);
        v110 = v107;
        if (v107)
        {
          objc_msgSend_getFileSystemRepresentation_maxLength_(string, v108, (uint64_t)v107, v109, MaximumSizeOfFileSystemRepresentation);
          if (IMGetDomainBoolForKey()) {
            uint64_t v111 = open(v110, 521, 384, v172);
          }
          else {
            uint64_t v111 = open(v110, 1545, 384, v172);
          }
          uint64_t v178 = v111;
          if (v111 != -1)
          {
            v115 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v112, v113, v114);
            size_t v116 = strlen(v110);
            objc_msgSend_stringWithFileSystemRepresentation_length_(v115, v117, (uint64_t)v110, v118, v116);
            id v119 = (id)objc_claimAutoreleasedReturnValue();

            free(v110);
            v120 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)v197 = v181;
              *(_WORD *)&v197[8] = 2112;
              *(void *)&v197[10] = string;
              __int16 v198 = 1024;
              LODWORD(v199) = v178;
              _os_log_impl(&dword_19D9BE000, v120, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: originalFilePath %@ newFilePath %@ newFileDescriptor %d", buf, 0x1Cu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v172 = string;
                uint64_t v174 = v178;
                id v170 = v181;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                uint64_t v174 = v178;
                id v170 = v181;
                v172 = string;
                IMLogString();
              }
            }
            goto LABEL_106;
          }
          uint64_t v130 = *__error();
          v131 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v197 = v110;
            *(_WORD *)&v197[8] = 1024;
            *(_DWORD *)&v197[10] = v130;
            _os_log_impl(&dword_19D9BE000, v131, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't open file for writing @%s errno %d", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              id v170 = v110;
              v172 = (void *)v130;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              id v170 = v110;
              v172 = (void *)v130;
              IMLogString();
            }
          }
          IDSAssertNonFatalErrnoWithSource(v130, "SocketPairMessage open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2002, v132);
          v136 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v133, v134, v135);
          objc_msgSend_removeItemAtPath_error_(v136, v137, (uint64_t)v180, v138, 0);

          free(v110);
        }
        else
        {
          v123 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v197 = MaximumSizeOfFileSystemRepresentation;
            _os_log_impl(&dword_19D9BE000, v123, OS_LOG_TYPE_DEFAULT, "makeTemporaryFileFromOriginalFilePath: can't allocate %ld bytes for new file path", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              id v170 = (id)MaximumSizeOfFileSystemRepresentation;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              id v170 = (id)MaximumSizeOfFileSystemRepresentation;
              IMLogString();
            }
          }
          v127 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v124, v125, v126, v170, v172);
          objc_msgSend_removeItemAtPath_error_(v127, v128, (uint64_t)v180, v129, 0);
        }
        id v119 = 0;
        LODWORD(v178) = -1;
LABEL_106:

LABEL_107:
LABEL_108:

        id v184 = v119;
        v12->_fileDescriptor = v178;

        objc_storeStrong((id *)&v12->_resourcePath, v119);
        if (v12->_fileDescriptor == -1)
        {
          uint64_t v154 = *__error();
          IDSAssertNonFatalErrnoWithSource(v154, "IDSSocketPairResourceTransferReceiver", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2116, v155);
          v156 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
          {
            v157 = strerror(v154);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v197 = v154;
            *(_WORD *)&v197[4] = 2080;
            *(void *)&v197[6] = v157;
            _os_log_impl(&dword_19D9BE000, v156, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: cannot create file (errno: %d (%s))", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              strerror(v154);
              MarcoLog();
            }
            if (IMShouldLog())
            {
              strerror(v154);
              IMLogString();
            }
          }
          if (a5) {
            *a5 = 2;
          }
          int v60 = 1;
        }
        else
        {
          IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSSocketPairMessage.m", 2122, 0);
          if (fchmod(v12->_fileDescriptor, 0x1B6u) == -1)
          {
            unint64_t v141 = *__error();
            v142 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v197 = v141;
              _os_log_impl(&dword_19D9BE000, v142, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: failed to fchmod the file %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                id v170 = (id)v141;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                id v170 = (id)v141;
                IMLogString();
              }
            }
          }
          v143 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1CA60], v139, (uint64_t)v36, v140, v170, v172, v174);
          objc_msgSend_removeObjectForKey_(v143, v144, @"ids-message-resource-transfer-data", v145);
          v146 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            v147 = *p_expiryDate;
            *(_DWORD *)buf = 134218498;
            *(void *)v197 = v186;
            *(_WORD *)&v197[8] = 2112;
            *(void *)&v197[10] = v143;
            __int16 v198 = 2112;
            v199 = v147;
            _os_log_impl(&dword_19D9BE000, v146, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: init called with filesystem-free-size %llu header %@ expiryDate %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v173 = v143;
              v175 = *p_expiryDate;
              unint64_t v171 = v186;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              v173 = v143;
              v175 = *p_expiryDate;
              unint64_t v171 = v186;
              IMLogString();
            }
          }
          v151 = objc_msgSend_objectForKey_(v36, v148, @"ids-message-resource-transfer-data", v149, v171, v173, v175);
          if (v5) {
            char v153 = objc_msgSend_writeResourceData_resourceByteOffset_(v12, v150, (uint64_t)v151, v152, 0);
          }
          else {
            char v153 = objc_msgSend_writeResourceData_(v12, v150, (uint64_t)v151, v152);
          }
          if (v153)
          {
            objc_storeStrong((id *)&v12->_metadata, obj);
            uint64_t v161 = objc_msgSend_peerResponseIdentifier(v7, v158, v159, v160);
            peerResponseIdentifier = v12->_peerResponseIdentifier;
            v12->_peerResponseIdentifier = (NSString *)v161;

            uint64_t v166 = objc_msgSend_messageUUID(v7, v163, v164, v165);
            messageUUID = v12->_messageUUID;
            v12->_messageUUID = (NSString *)v166;

            int v60 = 0;
            v12->_resumeResourceTransfers = v5;
          }
          else
          {
            if (a5) {
              *a5 = 3;
            }
            int v60 = 1;
          }
        }
        goto LABEL_144;
      }
LABEL_17:
      v51 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v41, v42, 172800.0);
      goto LABEL_29;
    }
  }
  else
  {
    v51 = 0;
    if (v191 && v192) {
      goto LABEL_17;
    }
  }
  v59 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v197 = v5;
    _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: missing header (%d)", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  int v60 = 1;
  if (a5) {
    *a5 = 1;
  }
LABEL_145:

  if (!v60)
  {
LABEL_147:
    v168 = v12;
    goto LABEL_148;
  }
  v168 = 0;
LABEL_148:

  return v168;
}

- (void)abortTransfer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_int fileDescriptor = -1;
    id v7 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, v4, v5, v6);
    if (unlink(v7))
    {
      v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 138412290;
        double v11 = resourcePath;
        _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: failed to unlink aborted transfer @ %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
  }
}

- (void)dealloc
{
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1) {
    close(fileDescriptor);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSSocketPairResourceTransferReceiver;
  [(IDSSocketPairResourceTransferReceiver *)&v4 dealloc];
}

- (BOOL)writeResourceData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v8 = objc_msgSend_length(v4, v5, v6, v7);
  if (v8 <= 7)
  {
    unint64_t v9 = v8;
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = v9;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: incoming chunk does not have sufficient data (%lu)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
LABEL_19:
    close(self->_fileDescriptor);
    char v25 = 0;
    self->_int fileDescriptor = -1;
    self->_done = 1;
    goto LABEL_20;
  }
  id v11 = v4;
  unint64_t v17 = bswap64(*objc_msgSend_bytes(v11, v12, v13, v14));
  if (self->_totalBytesReceived != v17)
  {
    double v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t totalBytesReceived = self->_totalBytesReceived;
      *(_DWORD *)buf = 134218240;
      unint64_t v30 = v17;
      __int16 v31 = 2048;
      unint64_t v32 = totalBytesReceived;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: mismatching incoming resource chunk index: stated %llu != actual %llu", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    goto LABEL_19;
  }
  uint64_t v19 = objc_msgSend_length(v11, v15, v16, v18);
  uint64_t v22 = objc_msgSend_subdataWithRangeNoCopy_(v11, v20, 8, v21, v19 - 8);
  char v25 = objc_msgSend_writeResourceData_resourceByteOffset_(self, v23, (uint64_t)v22, v24, v17);

LABEL_20:
  return v25;
}

- (BOOL)writeResourceData:(id)a3 resourceByteOffset:(unint64_t)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = v6;
  if (v6)
  {
    size_t v11 = objc_msgSend_length(v6, v7, v8, v9);
    id v12 = v10;
    uint64_t v16 = (const void *)objc_msgSend_bytes(v12, v13, v14, v15);
    ssize_t v17 = write(self->_fileDescriptor, v16, v11);
    if (v17 <= 0)
    {
      int v22 = *__error();
      double v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t totalBytesExpected = self->_totalBytesExpected;
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 134219010;
        size_t v41 = v11;
        __int16 v42 = 2048;
        unint64_t v43 = totalBytesExpected;
        __int16 v44 = 2112;
        unint64_t v45 = (unint64_t)resourcePath;
        __int16 v46 = 1024;
        *(_DWORD *)uint64_t v47 = v22;
        *(_WORD *)&v47[4] = 2080;
        *(void *)&v47[6] = strerror(v22);
        _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: error writing %lu (%llu total) to file %@ (errno: %d (%s))", buf, 0x30u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          strerror(v22);
          MarcoLog();
        }
        if (IMShouldLog())
        {
          strerror(v22);
          IMLogString();
        }
      }
      goto LABEL_44;
    }
    ssize_t v18 = v17;
    if (v17 < v11)
    {
      uint64_t v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_resourcePath;
        *(_DWORD *)buf = 134218498;
        size_t v41 = v18;
        __int16 v42 = 2048;
        unint64_t v43 = v11;
        __int16 v44 = 2112;
        unint64_t v45 = (unint64_t)v20;
        _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: only wrote %ld/%lu bytes to file %@", buf, 0x20u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_44;
      }
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (!IMShouldLog()) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    double v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v28 = self->_totalBytesExpected;
      unint64_t totalBytesReceived = self->_totalBytesReceived;
      v29 = self->_resourcePath;
      *(_DWORD *)buf = 134219010;
      size_t v41 = v11;
      __int16 v42 = 2048;
      unint64_t v43 = totalBytesReceived;
      __int16 v44 = 2048;
      unint64_t v45 = v28;
      __int16 v46 = 2112;
      *(void *)uint64_t v47 = v29;
      *(_WORD *)&v47[8] = 2048;
      *(void *)&v47[10] = a4;
      _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: wrote %lu (received %llu out of %llu total) bytes to file %@ at %llu", buf, 0x34u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    unint64_t v21 = self->_totalBytesReceived + v18;
    self->_unint64_t totalBytesReceived = v21;
  }
  else
  {
    unint64_t v21 = self->_totalBytesReceived;
  }
  unint64_t v30 = self->_totalBytesExpected;
  if (v21 == v30)
  {
    __int16 v31 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v32 = self->_totalBytesExpected;
      uint64_t v33 = self->_resourcePath;
      *(_DWORD *)buf = 134218242;
      size_t v41 = v32;
      __int16 v42 = 2112;
      unint64_t v43 = (unint64_t)v33;
      _os_log_impl(&dword_19D9BE000, v31, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: finished writing all %llu  bytes to file %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    close(self->_fileDescriptor);
    self->_int fileDescriptor = -1;
    self->_done = 1;
    unint64_t v30 = self->_totalBytesExpected;
    unint64_t v21 = self->_totalBytesReceived;
  }
  if (v21 <= v30)
  {
    BOOL v38 = 1;
    goto LABEL_46;
  }
  uint64_t v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v36 = self->_totalBytesExpected;
    unint64_t v35 = self->_totalBytesReceived;
    uint64_t v37 = self->_resourcePath;
    *(_DWORD *)buf = 134218498;
    size_t v41 = v35;
    __int16 v42 = 2048;
    unint64_t v43 = v36;
    __int16 v44 = 2112;
    unint64_t v45 = (unint64_t)v37;
    _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: received %llu bytes, more than expected %llu to file %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
LABEL_43:
    }
      IMLogString();
  }
LABEL_44:
  close(self->_fileDescriptor);
  BOOL v38 = 0;
  self->_int fileDescriptor = -1;
  self->_done = 1;
LABEL_46:

  return v38;
}

- (BOOL)appendMessage:(id)a3 receiverError:(unsigned __int8 *)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v9 = v5;
  if (self->_done)
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      messageUUID = self->_messageUUID;
      *(_DWORD *)buf = 138412290;
      unint64_t v156 = (unint64_t)messageUUID;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: already done with this resource! messageUUID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    char v12 = 0;
  }
  else
  {
    uint64_t v13 = self->_messageUUID;
    uint64_t v14 = objc_msgSend_messageUUID(v5, v6, v7, v8);
    LOBYTE(v13) = objc_msgSend_isEqualToString_(v13, v15, (uint64_t)v14, v16);

    if (v13)
    {
      if (self->_resumeResourceTransfers)
      {
        objc_msgSend_data(v9, v17, v18, v19);
        id v20 = objc_claimAutoreleasedReturnValue();
        double v24 = (unsigned __int8 *)objc_msgSend_bytes(v20, v21, v22, v23);
        unint64_t v28 = ((unint64_t)v24[1] << 48) | ((unint64_t)v24[2] << 40) | ((unint64_t)v24[3] << 32) | ((unint64_t)v24[4] << 24) | ((unint64_t)v24[5] << 16) | ((unint64_t)v24[6] << 8) | v24[7];
        if (self->_totalBytesReceived == v28)
        {
          uint64_t v29 = objc_msgSend_length(v20, v25, v26, v27);
          unint64_t v32 = objc_msgSend_subdataWithRangeNoCopy_(v20, v30, 8, v31, v29 - 8);
          if (objc_msgSend_compressed(v9, v33, v34, v35))
          {
            uint64_t v39 = objc_msgSend__FTDecompressData(v32, v36, v37, v38);
            v40 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v44 = self->_messageUUID;
              uint64_t v45 = objc_msgSend_length(v32, v41, v42, v43);
              uint64_t v49 = objc_msgSend_length(v39, v46, v47, v48);
              resourcePath = self->_resourcePath;
              *(_DWORD *)buf = 138413058;
              unint64_t v156 = (unint64_t)v44;
              __int16 v157 = 2048;
              unint64_t v158 = v45;
              __int16 v159 = 2048;
              uint64_t v160 = v49;
              __int16 v161 = 2112;
              v162 = resourcePath;
              _os_log_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu decompressed: %lu) to file %@", buf, 0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                double v54 = self->_messageUUID;
                uint64_t v55 = objc_msgSend_length(v32, v51, v52, v53);
                uint64_t v153 = objc_msgSend_length(v39, v56, v57, v58);
                uint64_t v154 = self->_resourcePath;
                double v149 = v54;
                uint64_t v152 = v55;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                uint64_t v62 = self->_messageUUID;
                uint64_t v63 = objc_msgSend_length(v32, v59, v60, v61);
                uint64_t v153 = objc_msgSend_length(v39, v64, v65, v66);
                uint64_t v154 = self->_resourcePath;
                double v149 = v62;
                uint64_t v152 = v63;
                IMLogString();
              }
            }
          }
          else
          {
            double v135 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              v139 = self->_messageUUID;
              uint64_t v140 = objc_msgSend_length(v32, v136, v137, v138);
              unint64_t v141 = self->_resourcePath;
              *(_DWORD *)buf = 138412802;
              unint64_t v156 = (unint64_t)v139;
              __int16 v157 = 2048;
              unint64_t v158 = v140;
              __int16 v159 = 2112;
              uint64_t v160 = (uint64_t)v141;
              _os_log_impl(&dword_19D9BE000, v135, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu) to file %@", buf, 0x20u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                double v145 = self->_messageUUID;
                uint64_t v152 = objc_msgSend_length(v32, v142, v143, v144);
                uint64_t v153 = (uint64_t)self->_resourcePath;
                double v149 = v145;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v147 = self->_messageUUID;
                uint64_t v152 = objc_msgSend_length(v32, v67, v146, v68);
                uint64_t v153 = (uint64_t)self->_resourcePath;
                double v149 = v147;
                IMLogString();
              }
            }
            uint64_t v39 = v32;
          }
          char v12 = objc_msgSend_writeResourceData_resourceByteOffset_(self, v67, (uint64_t)v39, v68, v28, v149, v152, v153, v154);
        }
        else
        {
          v120 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t totalBytesReceived = self->_totalBytesReceived;
            *(_DWORD *)buf = 134218240;
            unint64_t v156 = v28;
            __int16 v157 = 2048;
            unint64_t v158 = totalBytesReceived;
            _os_log_impl(&dword_19D9BE000, v120, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: mismatching incoming resource chunk index: stated %llu != actual %llu", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog()) {
              MarcoLog();
            }
            if (IMShouldLog()) {
              IMLogString();
            }
          }
          char v12 = 0;
        }
      }
      else
      {
        int v81 = objc_msgSend_compressed(v9, v17, v18, v19);
        v85 = objc_msgSend_data(v9, v82, v83, v84);
        v89 = v85;
        if (v81)
        {
          uint64_t v90 = objc_msgSend__FTDecompressData(v85, v86, v87, v88);
          double v91 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            v95 = self->_messageUUID;
            uint64_t v96 = objc_msgSend_length(v89, v92, v93, v94);
            uint64_t v100 = objc_msgSend_length(v90, v97, v98, v99);
            v101 = self->_resourcePath;
            *(_DWORD *)buf = 138413058;
            unint64_t v156 = (unint64_t)v95;
            __int16 v157 = 2048;
            unint64_t v158 = v96;
            __int16 v159 = 2048;
            uint64_t v160 = v100;
            __int16 v161 = 2112;
            v162 = v101;
            _os_log_impl(&dword_19D9BE000, v91, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu decompressed: %lu) to file %@", buf, 0x2Au);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              v105 = self->_messageUUID;
              uint64_t v106 = objc_msgSend_length(v89, v102, v103, v104);
              uint64_t v153 = objc_msgSend_length(v90, v107, v108, v109);
              uint64_t v154 = self->_resourcePath;
              double v149 = v105;
              uint64_t v152 = v106;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              uint64_t v113 = self->_messageUUID;
              uint64_t v114 = objc_msgSend_length(v89, v110, v111, v112);
              uint64_t v153 = objc_msgSend_length(v90, v115, v116, v117);
              uint64_t v154 = self->_resourcePath;
              double v149 = v113;
              uint64_t v152 = v114;
              IMLogString();
            }
          }
        }
        else
        {
          v122 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            double v126 = self->_messageUUID;
            uint64_t v127 = objc_msgSend_length(v89, v123, v124, v125);
            v128 = self->_resourcePath;
            *(_DWORD *)buf = 138412802;
            unint64_t v156 = (unint64_t)v126;
            __int16 v157 = 2048;
            unint64_t v158 = v127;
            __int16 v159 = 2112;
            uint64_t v160 = (uint64_t)v128;
            _os_log_impl(&dword_19D9BE000, v122, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: appending message %@ (size: %lu) to file %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              double v132 = self->_messageUUID;
              uint64_t v152 = objc_msgSend_length(v89, v129, v130, v131);
              uint64_t v153 = (uint64_t)self->_resourcePath;
              double v149 = v132;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              uint64_t v134 = self->_messageUUID;
              uint64_t v152 = objc_msgSend_length(v89, v118, v133, v119);
              uint64_t v153 = (uint64_t)self->_resourcePath;
              double v149 = v134;
              IMLogString();
            }
          }
          uint64_t v90 = v89;
        }
        char v12 = objc_msgSend_writeResourceData_(self, v118, (uint64_t)v90, v119, v149, v152, v153, v154);
      }
    }
    else
    {
      double v69 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v73 = objc_msgSend_messageUUID(v9, v70, v71, v72);
        uint64_t v74 = self->_messageUUID;
        *(_DWORD *)buf = 138412546;
        unint64_t v156 = (unint64_t)v73;
        __int16 v157 = 2112;
        unint64_t v158 = (unint64_t)v74;
        _os_log_impl(&dword_19D9BE000, v69, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferReceiver: messageUUID %@ does not match original messageUUID %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v150 = objc_msgSend_messageUUID(v9, v75, v76, v77);
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v151 = objc_msgSend_messageUUID(v9, v78, v79, v80);
          IMLogString();
        }
      }
      char v12 = 0;
      self->_done = 1;
    }
  }

  return v12;
}

- (id)finalizedMessageDictionaryIfDone
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_done)
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
    id v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(self->_resourcePath, v6, v7, v8);
    uint64_t v9 = sandbox_extension_issue_file();
    if (v9)
    {
      char v12 = (void *)v9;
      uint64_t v13 = objc_msgSend_stringWithUTF8String_(NSString, v10, v9, v11);
      if (v13) {
        CFDictionarySetValue(v5, @"ids-message-resource-transfer-sandbox-extension", v13);
      }

      free(v12);
    }
    else
    {
      uint64_t v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 138412290;
        id v20 = resourcePath;
        _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for file [%@]", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
    }
    double v16 = self->_resourcePath;
    if (v16) {
      CFDictionarySetValue(v5, @"ids-message-resource-transfer-url", v16);
    }
    metadata = self->_metadata;
    if (metadata) {
      CFDictionarySetValue(v5, @"ids-message-resource-transfer-metadata", metadata);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (unint64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end