@interface NEDNSPacket
+ (id)createDataWithQuery:(id)a3;
- (BOOL)isAuthoritativeAnswer;
- (BOOL)isRecursionAvailable;
- (BOOL)isRecursionDesired;
- (BOOL)isTruncated;
- (NSArray)additionalRecords;
- (NSArray)answers;
- (NSArray)authorities;
- (NSArray)queries;
- (NSDate)timestamp;
- (NSString)responseCodeString;
- (id)createResponse;
- (id)initFromData:(id)a3;
- (int64_t)identifier;
- (int64_t)messageType;
- (int64_t)opCode;
- (int64_t)responseCode;
@end

@implementation NEDNSPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_authorities, 0);
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_queries, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (NSArray)additionalRecords
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)authorities
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)answers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (BOOL)isRecursionAvailable
{
  return self->_isRecursionAvailable;
}

- (BOOL)isRecursionDesired
{
  return self->_isRecursionDesired;
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (BOOL)isAuthoritativeAnswer
{
  return self->_isAuthoritativeAnswer;
}

- (int64_t)opCode
{
  return self->_opCode;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)createResponse
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (self->_messageType == 1)
  {
    v3 = self->_data;
    goto LABEL_56;
  }
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v43 = self;
  v4 = self->_queries;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v51;
  v45 = v4;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v51 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v50 + 1) + 8 * v8);
      v10 = [(id)v9 answerData];

      if (v10)
      {
        if (v9)
        {
          v11 = *(void **)(v9 + 40);
          if (!v11 || (unint64_t)[v11 length] >= 0x10000)
          {
            v12 = ne_log_obj();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = *(void *)(v9 + 16);
              uint64_t v14 = [*(id *)(v9 + 40) length];
              *(_DWORD *)buf = 138412546;
              uint64_t v65 = v13;
              __int16 v66 = 2048;
              uint64_t v67 = v14;
              v15 = v12;
              v16 = "Failed to create an answer for %@, invalid answer data length (%lu)";
              uint32_t v17 = 22;
              goto LABEL_33;
            }
            goto LABEL_34;
          }
          uint64_t v18 = *(void *)(v9 + 24);
          BOOL v19 = v18 == 28 || v18 == 1;
          if (v19 && *(void *)(v9 + 32) == 1)
          {
            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
            v21 = [*(id *)(v9 + 16) componentsSeparatedByString:@"."];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v63 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v58;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v58 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  if ((unint64_t)[v27 length] > 0x3F)
                  {

                    v29 = 0;
                    goto LABEL_40;
                  }
                  buf[0] = 0;
                  buf[0] = [v27 length];
                  [v20 appendBytes:buf length:1];
                  if (buf[0])
                  {
                    v28 = (const char *)[v27 UTF8String];
                    [v20 appendBytes:v28 length:strlen(v28)];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v57 objects:v63 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            __int16 v56 = bswap32(*(unsigned __int16 *)(v9 + 24)) >> 16;
            [v20 appendBytes:&v56 length:2];
            __int16 v55 = bswap32(*(unsigned __int16 *)(v9 + 32)) >> 16;
            [v20 appendBytes:&v55 length:2];
            *(_DWORD *)buf = bswap32(*(_DWORD *)(v9 + 8));
            [v20 appendBytes:buf length:4];
            __int16 v54 = bswap32([*(id *)(v9 + 40) length]) >> 16;
            [v20 appendBytes:&v54 length:2];
            [v20 appendData:*(void *)(v9 + 40)];
            v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v20];
LABEL_40:

            if (v29) {
              [v44 addObject:v29];
            }
            v4 = v45;
            goto LABEL_36;
          }
          v12 = ne_log_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = *(void *)(v9 + 16);
            uint64_t v31 = *(void *)(v9 + 24);
            uint64_t v32 = *(void *)(v9 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v65 = v30;
            __int16 v66 = 2048;
            uint64_t v67 = v31;
            __int16 v68 = 2048;
            uint64_t v69 = v32;
            v15 = v12;
            v16 = "Failed to create an answer for %@, unsupported record type (%ld) and/or record class (%ld)";
            uint32_t v17 = 32;
LABEL_33:
            _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
          }
LABEL_34:
        }
        v29 = 0;
LABEL_36:
      }
      ++v8;
    }
    while (v8 != v6);
    uint64_t v33 = [(NSArray *)v4 countByEnumeratingWithState:&v50 objects:v62 count:16];
    uint64_t v6 = v33;
  }
  while (v33);
LABEL_44:

  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithBytes:length:", -[NSData bytes](v43->_data, "bytes"), 6);
  v43->_unsigned int flags = v43->_flags & 0x7BF0 | 0x8400;
  uint64_t v35 = [v44 count];
  unsigned int flags = v43->_flags;
  if (!v35)
  {
    flags |= 3u;
    v43->_unsigned int flags = flags;
  }
  LOWORD(v57) = __rev16(flags);
  objc_msgSend(v34, "replaceBytesInRange:withBytes:length:", 2, 2, &v57, 2);
  *(_WORD *)buf = bswap32([v44 count]) >> 16;
  [v34 appendBytes:buf length:2];
  v63[0] = 0;
  [v34 appendBytes:v63 length:4];
  if (v43->_endOfQueriesOffset >= 0xD) {
    objc_msgSend(v34, "appendBytes:length:", -[NSData bytes](v43->_data, "bytes") + 12, v43->_endOfQueriesOffset - 12);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v37 = v44;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v61 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        [v34 appendData:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v61 count:16];
    }
    while (v39);
  }

  v3 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v34];
LABEL_56:

  return v3;
}

- (NSString)responseCodeString
{
  unint64_t v2 = [(NEDNSPacket *)self responseCode];
  if (v2 > 6) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_1E598F870[v2]->isa;
  }
}

- (id)initFromData:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v64 = 1;
  v63.receiver = self;
  v63.super_class = (Class)NEDNSPacket;
  uint64_t v6 = [(NEDNSPacket *)&v63 init];
  if (!v6)
  {
    BOOL v19 = 0;
    v29 = 0;
    uint64_t v33 = 0;
    id v37 = 0;
    uint64_t v9 = 0;
LABEL_33:
    uint64_t v38 = 0;
    char v64 = 0;
    goto LABEL_50;
  }
  uint64_t v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  timestamp = v6->_timestamp;
  v6->_timestamp = v7;

  objc_storeStrong((id *)&v6->_data, a3);
  uint64_t v9 = -[NEByteParser initWithData:]([NEByteParser alloc], v5);
  v6->_identifier = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    uint64_t v40 = "Failed to parse DNS packet identifier";
LABEL_46:
    _os_log_error_impl(&dword_19DDAF000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_47;
  }
  unsigned int v10 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  v6->_unsigned int flags = v10;
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    uint64_t v40 = "Failed to parse DNS packet flags";
    goto LABEL_46;
  }
  v6->_messageType = v10 >> 15;
  v6->_opCode = (v10 >> 11) & 0xF;
  v6->_isAuthoritativeAnswer = (v10 & 0x400) != 0;
  v6->_isTruncated = (v10 & 0x200) != 0;
  v6->_isRecursionDesired = BYTE1(v10) & 1;
  v6->_isRecursionAvailable = (v10 & 0x80) != 0;
  v6->_responseCode = v10 & 0xF;
  unsigned int v11 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    uint64_t v40 = "Failed to parse DNS packet query count";
    goto LABEL_46;
  }
  unsigned int v12 = v11;
  unsigned int v13 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    uint64_t v40 = "Failed to parse DNS packet answer count";
    goto LABEL_46;
  }
  unsigned int v14 = v13;
  unsigned int v15 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    uint64_t v40 = "Failed to parse DNS packet authority count";
    goto LABEL_46;
  }
  unsigned int v16 = v15;
  unsigned int v17 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    uint64_t v39 = ne_log_obj();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v40 = "Failed to parse DNS packet additional record count";
      goto LABEL_46;
    }
LABEL_47:

    BOOL v19 = 0;
    goto LABEL_48;
  }
  unsigned int v61 = v17;
  unsigned int v62 = v16;
  BOOL v19 = 0;
  if (v12)
  {
    int v20 = 0;
    uint64_t v60 = v12;
    while (1)
    {
      uint64_t v21 = [(NEByteParser *)v9 parseDomainName];
      if (!v21)
      {
        v43 = ne_log_obj();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v66 = v20;
          _os_log_error_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_ERROR, "Failed to parse DNS packet query %u name", buf, 8u);
        }

        id v22 = 0;
        goto LABEL_72;
      }
      id v22 = (void *)v21;
      unsigned int v23 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
      if (!v64) {
        break;
      }
      unsigned int v24 = v23;
      unsigned int v25 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
      if (!v64)
      {
        id v44 = ne_log_obj();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 67109120;
        int v66 = v20;
        v45 = "Failed to parse DNS packet query %u class";
        goto LABEL_85;
      }
      v26 = [[NEDNSQuery alloc] initWithName:v22 recordType:v24 recordClass:v25];
      if (!v26)
      {
        long long v49 = ne_log_obj();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v66 = v20;
          _os_log_error_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_ERROR, "Failed to allocate a query object for query %u", buf, 8u);
        }

LABEL_72:
        char v64 = 0;
LABEL_73:

LABEL_48:
        v29 = 0;
        uint64_t v33 = 0;
        id v37 = 0;
LABEL_49:
        uint64_t v38 = 0;
        goto LABEL_50;
      }
      v27 = v26;
      if (!v19) {
        BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v60];
      }
      objc_msgSend(v19, "addObject:", v27, v60);

      if (++v20 >= v12) {
        goto LABEL_17;
      }
    }
    id v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_68:

      goto LABEL_73;
    }
    *(_DWORD *)buf = 67109120;
    int v66 = v20;
    v45 = "Failed to parse DNS packet query %u type";
LABEL_85:
    _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, v45, buf, 8u);
    goto LABEL_68;
  }
LABEL_17:
  if (v9) {
    unint64_t v28 = v9[1];
  }
  else {
    unint64_t v28 = 0;
  }
  v6->_endOfQueriesOffset = v28;
  v29 = 0;
  if (v14)
  {
    int v30 = 0;
    while (1)
    {
      uint64_t v31 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v31) {
        break;
      }
      uint64_t v32 = v31;
      if (!v29) {
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
      }
      [v29 addObject:v32];

      if (++v30 >= v14) {
        goto LABEL_25;
      }
    }
    v42 = ne_log_obj();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v66 = v30;
      _os_log_error_impl(&dword_19DDAF000, v42, OS_LOG_TYPE_ERROR, "Failed to parse answer %u", buf, 8u);
    }

    uint64_t v33 = 0;
    goto LABEL_77;
  }
LABEL_25:
  if (v62)
  {
    uint64_t v33 = 0;
    int v34 = 0;
    while (1)
    {
      uint64_t v35 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v35) {
        break;
      }
      v36 = v35;
      if (!v33) {
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v62];
      }
      [v33 addObject:v36];

      if (++v34 >= v62) {
        goto LABEL_60;
      }
    }
    long long v50 = ne_log_obj();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v66 = v34;
      _os_log_error_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_ERROR, "Failed to parse authority %u", buf, 8u);
    }

LABEL_77:
    id v37 = 0;
    goto LABEL_33;
  }
  uint64_t v33 = 0;
LABEL_60:
  if (v61)
  {
    id v37 = 0;
    int v46 = 0;
    while (1)
    {
      long long v47 = -[NEDNSResourceRecord initFromByteParser:]([NEDNSResourceRecord alloc], v9);
      if (!v47) {
        break;
      }
      long long v48 = v47;
      if (!v37) {
        id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v61];
      }
      [v37 addObject:v48];

      if (++v46 >= v61) {
        goto LABEL_79;
      }
    }
    long long v59 = ne_log_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v66 = v46;
      _os_log_error_impl(&dword_19DDAF000, v59, OS_LOG_TYPE_ERROR, "Failed to parse additional record %u", buf, 8u);
    }

    goto LABEL_33;
  }
  id v37 = 0;
LABEL_79:
  uint64_t v51 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v19];
  queries = v6->_queries;
  v6->_queries = (NSArray *)v51;

  uint64_t v53 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v29];
  answers = v6->_answers;
  v6->_answers = (NSArray *)v53;

  uint64_t v55 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v33];
  authorities = v6->_authorities;
  v6->_authorities = (NSArray *)v55;

  uint64_t v57 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v37];
  additionalRecords = v6->_additionalRecords;
  v6->_additionalRecords = (NSArray *)v57;

  if (!v64) {
    goto LABEL_49;
  }
  uint64_t v38 = v6;
LABEL_50:

  return v38;
}

+ (id)createDataWithQuery:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  __int16 v27 = 2560;
  [v4 appendBytes:&v27 length:2];
  __int16 v26 = 1;
  [v4 appendBytes:&v26 length:2];
  __int16 v25 = 256;
  [v4 appendBytes:&v25 length:2];
  __int16 v24 = 0;
  [v4 appendBytes:&v24 length:2];
  __int16 v23 = 0;
  [v4 appendBytes:&v23 length:2];
  __int16 v22 = 0;
  [v4 appendBytes:&v22 length:2];
  id v5 = [v3 name];
  uint64_t v6 = [v5 componentsSeparatedByString:@"."];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((unint64_t)[v12 length] > 0x3F)
        {

          unsigned int v14 = 0;
          goto LABEL_13;
        }
        LOBYTE(v17) = 0;
        LOBYTE(v17) = [v12 length];
        [v4 appendBytes:&v17 length:1];
        if ((_BYTE)v17)
        {
          unsigned int v13 = (const char *)[v12 UTF8String];
          [v4 appendBytes:v13 length:strlen(v13)];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  __int16 v17 = bswap32([v3 recordType]) >> 16;
  [v4 appendBytes:&v17 length:2];
  __int16 v16 = bswap32([v3 recordClass]) >> 16;
  [v4 appendBytes:&v16 length:2];
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v4];
LABEL_13:

  return v14;
}

@end