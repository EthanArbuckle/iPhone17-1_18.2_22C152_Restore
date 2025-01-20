@interface NFCNDEFMessage
+ (BOOL)_validateRecords:(id)a3 fromOriginal:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (NFCNDEFMessage)ndefMessageWithData:(NSData *)data;
+ (id)_getPayloadsFromNDEFRecords:(id)a3;
- (NFCNDEFMessage)initWithCoder:(id)a3;
- (NFCNDEFMessage)initWithEmptyNdefMessage;
- (NFCNDEFMessage)initWithNDEFRecords:(NSArray *)records;
- (NFCNDEFMessage)initWithNFNdefMessage:(id)a3;
- (NSArray)records;
- (NSUInteger)length;
- (id)_getURLsFromNDEFMessage:(id)a3;
- (id)_initWithRecords:(id)a3;
- (id)asData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRecords:(NSArray *)records;
@end

@implementation NFCNDEFMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFCNDEFMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFCNDEFMessage;
  v5 = [(NFCNDEFMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F8C688] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"records"];
    records = v5->_records;
    v5->_records = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NFCNDEFMessage)initWithNDEFRecords:(NSArray *)records
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v5 = records;
  if (![(NSArray *)v5 count])
  {
    v30 = [(NFCNDEFMessage *)self initWithEmptyNdefMessage];
LABEL_23:
    self = v30;
    v29 = self;
    goto LABEL_24;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v6 = v5;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (!v7)
  {

LABEL_22:
    v30 = [(NFCNDEFMessage *)self _initWithRecords:v6];
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  v33 = a2;
  v34 = self;
  v35 = v5;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v13 = [v12 type];
      uint64_t v14 = [v13 length];
      v15 = [v12 identifier];
      uint64_t v16 = [v15 length];
      v17 = [v12 payload];
      v9 += v14 + v16 + [v17 length];
    }
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v36 objects:v48 count:16];
  }
  while (v8);

  self = v34;
  v5 = v35;
  if (v9 <= 0x20000) {
    goto LABEL_22;
  }
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(v34);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(v34);
    Name = sel_getName(v33);
    uint64_t v23 = 45;
    if (isMetaClass) {
      uint64_t v23 = 43;
    }
    v19(3, "%c[%{public}s %{public}s]:%i Total size of all NDEF records exceeds the size limit", v23, ClassName, Name, 62);
  }
  v24 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = object_getClass(v34);
    if (class_isMetaClass(v25)) {
      int v26 = 43;
    }
    else {
      int v26 = 45;
    }
    v27 = object_getClassName(v34);
    v28 = sel_getName(v33);
    *(_DWORD *)buf = 67109890;
    int v41 = v26;
    __int16 v42 = 2082;
    v43 = v27;
    __int16 v44 = 2082;
    v45 = v28;
    __int16 v46 = 1024;
    int v47 = 62;
    _os_log_impl(&dword_2214B8000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Total size of all NDEF records exceeds the size limit", buf, 0x22u);
  }

  v29 = 0;
LABEL_24:

  return v29;
}

- (id)_initWithRecords:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFCNDEFMessage;
  v5 = [(NFCNDEFMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    records = v5->_records;
    v5->_records = (NSArray *)v6;
  }
  return v5;
}

- (NFCNDEFMessage)initWithNFNdefMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v21 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = v3;
  id obj = [v3 records];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_super v9 = [NFCNDEFPayload alloc];
        uint64_t v10 = [v8 typeNameFormat];
        v11 = [v8 type];
        v12 = [v8 identifier];
        v13 = [v8 payload];
        uint64_t v14 = [(NFCNDEFPayload *)v9 initWithFormatType:v10 type:v11 identifier:v12 payload:v13 chunkSize:0];

        if (v14) {
          [v21 addObject:v14];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  if ([v21 count])
  {
    v15 = (NFCNDEFMessage *)[(NFCNDEFMessage *)self _initWithRecords:v21];
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    v15 = self;
  }

  return v16;
}

- (NFCNDEFMessage)initWithEmptyNdefMessage
{
  id v3 = [NFCNDEFPayload alloc];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [(NFCNDEFPayload *)v3 initWithFormatType:0 type:v4 identifier:v5 payload:v6 chunkSize:0];

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, 0);
  objc_super v9 = [(NFCNDEFMessage *)self initWithNDEFRecords:v8];

  return v9;
}

+ (NFCNDEFMessage)ndefMessageWithData:(NSData *)data
{
  uint64_t v4 = (void *)MEMORY[0x263F8C698];
  uint64_t v5 = data;
  uint64_t v6 = objc_msgSend(v4, "recordsFromBytes:length:", -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
  char v7 = [a1 _validateRecords:v6 fromOriginal:v5];

  if (v7)
  {
    uint64_t v8 = [a1 _getPayloadsFromNDEFRecords:v6];
    objc_super v9 = [NFCNDEFMessage alloc];
  }
  else
  {
    uint64_t v10 = [NFCNDEFMessage alloc];
    uint64_t v8 = objc_opt_new();
    objc_super v9 = v10;
  }
  v11 = [(NFCNDEFMessage *)v9 initWithNDEFRecords:v8];

  return v11;
}

- (id)description
{
  return [(NSArray *)self->_records description];
}

- (id)asData
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F8C690]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = self->_records;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v18 = 0;
        objc_super v9 = (void *)MEMORY[0x263F8C698];
        uint64_t v10 = [v8 typeNameFormat];
        v11 = [v8 type];
        v12 = [v8 identifier];
        v13 = [v8 payload];
        uint64_t v14 = objc_msgSend(v9, "recordsWithTNF:type:identifier:payload:chunkSize:outError:", v10, v11, v12, v13, objc_msgSend(v8, "chunkSize"), &v18);

        if (v18)
        {

          v15 = 0;
          goto LABEL_11;
        }
        [v3 addRecordArray:v14];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v15 = [v3 asData];
LABEL_11:

  return v15;
}

- (NSUInteger)length
{
  v2 = [(NFCNDEFMessage *)self asData];
  NSUInteger v3 = [v2 length];

  return v3;
}

+ (BOOL)_validateRecords:(id)a3 fromOriginal:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v31 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v30)
  {
    int v6 = 0;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_msgSend(v31, "subdataWithRange:", v6, 2);
        id v9 = objc_claimAutoreleasedReturnValue();
        uint64_t v10 = (char *)[v9 bytes];
        char v11 = *v10;
        int v12 = v10[1];
        uint64_t v13 = v6 + 2;
        if ((*v10 & 0x10) != 0)
        {
          int v18 = objc_msgSend(v31, "subdataWithRange:", v13, 1);

          id v15 = v18;
          unsigned int v16 = *(unsigned __int8 *)[v15 bytes];
          int v17 = 3;
        }
        else
        {
          uint64_t v14 = objc_msgSend(v31, "subdataWithRange:", v13, 4);

          id v15 = v14;
          unsigned int v16 = bswap32(*(_DWORD *)[v15 bytes]);
          int v17 = 6;
        }
        int v19 = v6 + v17;
        if ((v11 & 8) != 0)
        {
          long long v21 = objc_msgSend(v31, "subdataWithRange:", v19, 1);

          id v15 = v21;
          int v20 = *(unsigned __int8 *)[v15 bytes];
          ++v19;
        }
        else
        {
          int v20 = 0;
        }
        long long v22 = [v8 type];
        if ([v22 length] != v12) {
          goto LABEL_19;
        }
        long long v23 = [v8 payload];
        if ([v23 length] != v16)
        {

LABEL_19:
LABEL_20:
          id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:&stru_26D38B2E0 userInfo:0];
          objc_exception_throw(v27);
        }
        uint64_t v24 = [v8 identifier];
        BOOL v25 = [v24 length] == v20;

        if (!v25) {
          goto LABEL_20;
        }

        int v6 = v16 + v12 + v20 + v19;
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v30);
  }

  return 1;
}

+ (id)_getPayloadsFromNDEFRecords:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v37 = (id)objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  uint64_t v4 = 0;
  if (!v40)
  {
    char v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_36;
  }
  unsigned __int8 v36 = 0;
  LOBYTE(v5) = 0;
  char v6 = 0;
  char v7 = 0;
  uint64_t v8 = 0;
  char v9 = 0;
  uint64_t v39 = *(void *)v43;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v43 != v39) {
        objc_enumerationMutation(obj);
      }
      char v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
      if (v5)
      {
        LODWORD(v5) = 1;
        if ((v6 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {
        LODWORD(v5) = [*(id *)(*((void *)&v42 + 1) + 8 * v10) messageBegin];
        if ((v6 & 1) == 0)
        {
LABEL_8:
          char v6 = [v11 messageEnd];
          goto LABEL_11;
        }
      }
      char v6 = 1;
LABEL_11:
      int v12 = [v11 chunked];
      if (v12)
      {
        int v41 = (int)v5;
        id v5 = v7;
        int v13 = [v11 typeNameFormat];
        unsigned __int8 v14 = v13;
        if (v9)
        {
          if (v13 != 6) {
            goto LABEL_21;
          }
          id v15 = [v11 identifier];
          if ([v15 length]) {
            goto LABEL_20;
          }
          unsigned int v16 = [v11 type];
          uint64_t v17 = [v16 length];

          if (v17) {
            goto LABEL_21;
          }
          int v18 = [v11 payload];
          char v7 = v5;
          [(NFCNDEFPayload *)v5 appendData:v18];
        }
        else
        {
          uint64_t v19 = [v11 type];

          uint64_t v20 = [v11 identifier];

          id v21 = objc_alloc(MEMORY[0x263EFF990]);
          int v18 = [v11 payload];
          uint64_t v22 = [v21 initWithData:v18];

          uint64_t v4 = (void *)v19;
          unsigned __int8 v36 = v14;
          long long v23 = (NFCNDEFPayload *)v22;
          uint64_t v8 = (void *)v20;
          char v7 = v23;
        }
      }
      else
      {
        if ((v9 & 1) == 0)
        {

          uint64_t v24 = [NFCNDEFPayload alloc];
          uint64_t v25 = [v11 typeNameFormat];
          int v26 = [v11 type];
          id v27 = [v11 identifier];
          v28 = [v11 payload];
          int v18 = [(NFCNDEFPayload *)v24 initWithFormatType:v25 type:v26 identifier:v27 payload:v28 chunkSize:0];

          [v37 addObject:v18];
          uint64_t v4 = 0;
          char v7 = 0;
          uint64_t v8 = 0;
          goto LABEL_25;
        }
        int v41 = (int)v5;
        id v5 = v7;
        if ([v11 typeNameFormat] != 6) {
          goto LABEL_21;
        }
        id v15 = [v11 identifier];
        if ([v15 length])
        {
LABEL_20:

LABEL_21:
          uint64_t v4 = 0;
          char v7 = 0;
          uint64_t v8 = 0;
          char v9 = 0;
          LOBYTE(v5) = v41;
          goto LABEL_27;
        }
        uint64_t v29 = [v11 type];
        uint64_t v30 = [v29 length];

        if (v30) {
          goto LABEL_21;
        }
        id v31 = [v11 payload];
        [(NFCNDEFPayload *)v5 appendData:v31];

        if ([(NFCNDEFPayload *)v5 length])
        {
          long long v32 = [[NFCNDEFPayload alloc] initWithFormatType:v36 type:v4 identifier:v8 payload:v5 chunkSize:0];
          [v37 addObject:v32];
        }
        uint64_t v4 = 0;
        uint64_t v8 = 0;
        int v18 = v5;
        char v7 = 0;
      }
      LODWORD(v5) = v41;
LABEL_25:

      char v9 = v12;
      if v5 && (v6) {
        goto LABEL_36;
      }
LABEL_27:
      ++v10;
    }
    while (v40 != v10);
    uint64_t v33 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v40 = v33;
  }
  while (v33);
LABEL_36:

  id v34 = v37;
  return v34;
}

- (id)_getURLsFromNDEFMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "records", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) wellKnownTypeURIPayload];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(NSArray *)records
{
}

- (void).cxx_destruct
{
}

@end