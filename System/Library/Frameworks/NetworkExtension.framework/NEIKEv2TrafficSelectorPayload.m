@interface NEIKEv2TrafficSelectorPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2TrafficSelectorPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v42[3] + 4) = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42[0] = "-[NEIKEv2TrafficSelectorPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_44;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42[0] = "-[NEIKEv2TrafficSelectorPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_ts_hdr_t))";
LABEL_44:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v39 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v39, 4);
  uint64_t v8 = v39;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v11 = objc_msgSend(objc_getProperty(self, v10, 16, 1), "length");
  unint64_t v14 = v11;
  if (v11 < 0xCuLL)
  {
    uint64_t v15 = [v9 count];
    goto LABEL_36;
  }
  unsigned int v17 = v11;
  uint64_t v37 = v8;
  v38 = v9;
  uint64_t v18 = 4;
  *(void *)&long long v13 = 67109376;
  long long v36 = v13;
  while (1)
  {
    id v19 = objc_getProperty(self, v12, 16, 1);
    v20 = (unsigned __int8 *)([v19 bytes] + v18);
    unsigned int v21 = *((unsigned __int16 *)v20 + 1);
    unsigned int v22 = __rev16(v21);
    v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *v20;
      *(_DWORD *)buf = v36;
      LODWORD(v42[0]) = v31;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = v22;
      _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "Parsing traffic selector of type %u length %u", buf, 0xEu);
    }

    uint64_t v18 = v18 + v22;
    if (v18 > v17) {
      break;
    }
    v24 = objc_alloc_init(NEIKEv2TrafficSelector);
    [(NEIKEv2TrafficSelector *)v24 setIpProtocol:v20[1]];
    [(NEIKEv2TrafficSelector *)v24 setStartPort:bswap32(*((unsigned __int16 *)v20 + 2)) >> 16];
    [(NEIKEv2TrafficSelector *)v24 setEndPort:bswap32(*((unsigned __int16 *)v20 + 3)) >> 16];
    int v25 = *v20;
    if (v25 == 8)
    {
      if (v21 == 10240)
      {
        memset(v42, 0, 24);
        *(_DWORD *)buf = 7708;
        *(_OWORD *)((char *)v42 + 4) = *(_OWORD *)(v20 + 8);
        memset(&v40[1], 0, 24);
        v40[0] = 7708;
        *(_OWORD *)&v40[2] = *(_OWORD *)(v20 + 24);
        goto LABEL_20;
      }
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42[0]) = v22;
        v29 = v27;
        v30 = "Bad traffic IPv6 traffic selector length (%u)";
        goto LABEL_31;
      }
    }
    else
    {
      if (v25 != 7)
      {
        v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v28 = *v20;
          *(_DWORD *)buf = 67109120;
          LODWORD(v42[0]) = v28;
          _os_log_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_INFO, "Unknown traffic selector type %u", buf, 8u);
        }
        goto LABEL_26;
      }
      if (v21 == 4096)
      {
        LODWORD(v42[1]) = 0;
        v42[0] = 0;
        *(_DWORD *)buf = 528;
        LODWORD(v42[0]) = *((_DWORD *)v20 + 2);
        v40[3] = 0;
        *(void *)&v40[1] = 0;
        v40[0] = 528;
        v40[1] = *((_DWORD *)v20 + 3);
LABEL_20:
        v26 = objc_msgSend(MEMORY[0x1E4F38BC8], "endpointWithAddress:", buf, v36);
        [(NEIKEv2TrafficSelector *)v24 setStartAddress:v26];

        v27 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v40];
        [(NEIKEv2TrafficSelector *)v24 setEndAddress:v27];
        goto LABEL_26;
      }
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42[0]) = v22;
        v29 = v27;
        v30 = "Bad traffic IPv4 traffic selector length (%u)";
LABEL_31:
        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, v30, buf, 8u);
      }
    }
LABEL_26:

    if (v24) {
      [v38 addObject:v24];
    }

    if (v18 + 8 > v14) {
      goto LABEL_35;
    }
  }
  v32 = ne_log_obj();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42[0]) = v22;
    _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "Invalid traffic selector length (%u)", buf, 8u);
  }

LABEL_35:
  id v9 = v38;
  uint64_t v15 = objc_msgSend(v38, "count", v36);
  uint64_t v8 = v37;
LABEL_36:
  if (v15 == v8)
  {
    objc_setProperty_atomic(self, v16, v9, 24);
    BOOL v7 = [(NEIKEv2TrafficSelectorPayload *)self hasRequiredFields];
  }
  else
  {
    v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v35 = [v9 count];
      *(_DWORD *)buf = 67109376;
      LODWORD(v42[0]) = v35;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = v8;
      _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "Failed to process all traffic selectors (%u/%u)", buf, 0xEu);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_56:
    id Property = objc_getProperty(v2, v3, 16, 1);
    return Property != 0;
  }
  if (![(NEIKEv2TrafficSelectorPayload *)v2 hasRequiredFields])
  {
    v29 = ne_log_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Traffic Selector payload missing required fields", buf, 2u);
    }

    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v2) {
    id v6 = objc_getProperty(v2, v4, 24, 1);
  }
  else {
    id v6 = 0;
  }
  v40 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  selfa = v2;
  if (v2) {
    id v8 = objc_getProperty(v2, v7, 24, 1);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_47;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v47 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if (!-[NEIKEv2TrafficSelector type]((uint64_t)v15))
      {
        unsigned int v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v23 = v22;
          v24 = "Traffic selector invalid";
          goto LABEL_33;
        }
LABEL_34:

        continue;
      }
      uint64_t v16 = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
      unsigned int v17 = [v15 startAddress];
      uint64_t v18 = [v17 address];

      id v19 = [v15 endAddress];
      uint64_t v20 = [v19 address];

      if (v16 != 7)
      {
        if (v18)
        {
          if (v20)
          {
            memset(buf, 0, 40);
            buf[0] = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
            *(_WORD *)&buf[2] = 10240;
            buf[1] = [v15 ipProtocol];
            *(_WORD *)&uint8_t buf[4] = __rev16([v15 startPort]);
            if ([v15 endPort]) {
              __int16 v25 = __rev16([v15 endPort]);
            }
            else {
              __int16 v25 = -1;
            }
            *(_WORD *)&buf[6] = v25;
            *(_OWORD *)&buf[8] = *(_OWORD *)(v18 + 8);
            *(_OWORD *)&buf[24] = *(_OWORD *)(v20 + 8);
            v12 += 40;
            id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            uint64_t v27 = 40;
            goto LABEL_39;
          }
          unsigned int v22 = ne_log_obj();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_34;
          }
        }
        else
        {
          unsigned int v22 = ne_log_obj();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_34;
          }
        }
LABEL_32:
        *(_WORD *)buf = 0;
        v23 = v22;
        v24 = "Traffic selector missing start address";
LABEL_33:
        _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
        goto LABEL_34;
      }
      if (!v18)
      {
        unsigned int v22 = ne_log_obj();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
      if (!v20)
      {
        unsigned int v22 = ne_log_obj();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      buf[0] = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
      *(_WORD *)&buf[2] = 4096;
      buf[1] = [v15 ipProtocol];
      *(_WORD *)&uint8_t buf[4] = __rev16([v15 startPort]);
      if ([v15 endPort]) {
        __int16 v21 = __rev16([v15 endPort]);
      }
      else {
        __int16 v21 = -1;
      }
      *(_WORD *)&buf[6] = v21;
      *(_DWORD *)&buf[8] = *(_DWORD *)(v18 + 4);
      *(_DWORD *)&buf[12] = *(_DWORD *)(v20 + 4);
      v12 += 16;
      id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v27 = 16;
LABEL_39:
      int v28 = objc_msgSend(v26, "initWithBytes:length:", buf, v27, selfa);
      [v40 addObject:v28];
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  }
  while (v11);
LABEL_47:

  *(_DWORD *)buf = 0;
  buf[0] = [v40 count];
  int v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v12 + 4];
  [v31 appendBytes:buf length:4];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v32 = v40;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend(v31, "appendData:", *(void *)(*((void *)&v41 + 1) + 8 * j), selfa);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v34);
  }

  v2 = selfa;
  if (selfa)
  {
    objc_setProperty_atomic(selfa, v37, v31, 16);

    goto LABEL_56;
  }

  id Property = 0;
  return Property != 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2TrafficSelectorPayload *)objc_getProperty(self, a2, 24, 1);
  }
  return [(NEIKEv2TrafficSelectorPayload *)self count] != 0;
}

- (id)description
{
  return [(NEIKEv2TrafficSelectorPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  id v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Traffic Selectors" andIndent:v5 options:a4];

  return v7;
}

+ (id)copyTypeDescription
{
  return @"TS";
}

@end