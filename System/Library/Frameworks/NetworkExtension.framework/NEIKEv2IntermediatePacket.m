@interface NEIKEv2IntermediatePacket
+ (id)copyTypeDescription;
+ (unint64_t)exchangeType;
- (id)authenticatedData;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IntermediatePacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAuthenticatedData, 0);

  objc_storeStrong((id *)&self->_ke, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if (self) {
    self = (NEIKEv2IntermediatePacket *)objc_getProperty(self, a2, 80, 1);
  }
  v3 = self;
  uint64_t v4 = [(NEIKEv2IntermediatePacket *)v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              v13 = objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              goto LABEL_20;
            }
            v24 = v8;
            v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v24, 1, (void)v19);
            if (v2)
            {
LABEL_20:
              v16 = v2;
              v17 = v13;
              ptrdiff_t v18 = 64;
              goto LABEL_23;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_25;
            }
            if (v2 && objc_getProperty(v2, v14, 56, 1))
            {
              v13 = objc_msgSend(objc_getProperty(v2, v15, 56, 1), "arrayByAddingObject:", v8);
            }
            else
            {
              v23 = v8;
              v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v23, 1, (void)v19);
              if (!v2) {
                goto LABEL_24;
              }
            }
            v16 = v2;
            v17 = v13;
            ptrdiff_t v18 = 56;
LABEL_23:
            objc_setProperty_atomic(v16, v12, v17, v18);
          }
LABEL_24:

          goto LABEL_25;
        }
        if (v2) {
          objc_setProperty_atomic(v2, v9, v8, 88);
        }
LABEL_25:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NEIKEv2IntermediatePacket *)v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 56, 1));
    objc_setProperty_atomic(self, v6, newValue, 80);
  }
  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 43;
}

+ (id)copyTypeDescription
{
  return @"IKE_INTERMEDIATE";
}

- (id)authenticatedData
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 96, 1))
    {
LABEL_3:
      a1 = objc_getProperty(v2, v3, 96, 1);
      goto LABEL_24;
    }
    if (objc_getProperty(v2, v3, 48, 1))
    {
      id Property = objc_getProperty(v2, v4, 48, 1);
      if (Property && objc_getProperty(Property, v6, 24, 1))
      {
        id v8 = objc_getProperty(v2, v7, 48, 1);
        if (v8 && objc_getProperty(v8, v9, 16, 1))
        {
          id v11 = objc_getProperty(v2, v10, 48, 1);
          if (v11) {
            id v11 = objc_getProperty(v11, v12, 24, 1);
          }
          id v13 = v11;
          id v15 = objc_getProperty(v2, v14, 48, 1);
          if (v15) {
            id v15 = objc_getProperty(v15, v16, 16, 1);
          }
          id v17 = v15;
          long long buf = 0uLL;
          unsigned int v33 = 0;
          uint64_t v32 = 0;
          int v26 = 0;
          if ((unint64_t)[v13 length] > 0x1F)
          {
            objc_msgSend(v13, "getBytes:range:", &buf, 0, 28);
            objc_msgSend(v13, "getBytes:range:", &v26, 28, 4);
            int v18 = [v17 length];
            HIWORD(v26) = bswap32(v18 + 4) >> 16;
            uint64_t v19 = (unsigned __int16)(v18 + 4) + 28;
            unsigned int v33 = bswap32(v19);
            LOBYTE(v32) = 46;
            long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v19];
            [v20 appendBytes:&buf length:28];
            [v20 appendBytes:&v26 length:4];
            [v20 appendData:v17];
            objc_setProperty_atomic(v2, v21, v20, 96);

            goto LABEL_3;
          }
          v25 = ne_log_obj();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v27 = 134218240;
            uint64_t v28 = [v13 length];
            __int16 v29 = 2048;
            uint64_t v30 = 32;
            _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, "Authenticated header length %zu < minimum length %zu", v27, 0x16u);
          }

          goto LABEL_23;
        }
        long long v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
          v23 = "%s called with null self.encryptedPayload.payloadData";
          goto LABEL_21;
        }
LABEL_22:

LABEL_23:
        a1 = 0;
        goto LABEL_24;
      }
      long long v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_22;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
      v23 = "%s called with null self.encryptedPayload.authenticatedHeaders";
    }
    else
    {
      long long v22 = ne_log_obj();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_22;
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NEIKEv2IntermediatePacket authenticatedData]";
      v23 = "%s called with null self.encryptedPayload";
    }
LABEL_21:
    _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&buf, 0xCu);
    goto LABEL_22;
  }
LABEL_24:

  return a1;
}

@end