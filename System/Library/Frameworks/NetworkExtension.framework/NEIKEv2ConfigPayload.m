@interface NEIKEv2ConfigPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)createConfigAttributeFromData:(void *)a3 attributeName:(unsigned int)a4 attributeLen:(uint64_t)a5 attributeType:(uint64_t)a6 customType:;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2ConfigPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  *(void *)&v38[5] = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v38 = "-[NEIKEv2ConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_26;
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
      *(void *)v38 = "-[NEIKEv2ConfigPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_config_hdr_t))";
LABEL_26:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v36 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v36, 4);
  v8 = objc_alloc_init(NEIKEv2ConfigurationMessage);
  objc_setProperty_atomic(self, v9, v8, 24);

  uint64_t v10 = v36;
  Property = objc_getProperty(self, v11, 24, 1);
  if (Property) {
    Property[1] = v10;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_getProperty(self, v14, 24, 1);
  if (v15) {
    objc_setProperty_atomic(v15, v16, v13, 16);
  }

  unsigned int v18 = objc_msgSend(objc_getProperty(self, v17, 16, 1), "length");
  unsigned int v21 = v18;
  if (v18 >= 5)
  {
    unint64_t v22 = v18;
    unsigned int v23 = 4;
    *(void *)&long long v20 = 67109376;
    long long v35 = v20;
    while (1)
    {
      id v24 = objc_getProperty(self, v19, 16, 1);
      v25 = (unsigned __int16 *)([v24 bytes] + v23);
      uint64_t v26 = bswap32(v25[1]) >> 16;
      if (v26 + (unint64_t)v23 + 4 > v22) {
        break;
      }
      uint64_t v27 = bswap32(*v25) >> 16;
      v28 = ne_log_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v35;
        v38[0] = v27;
        LOWORD(v38[1]) = 1024;
        *(_DWORD *)((char *)&v38[1] + 2) = v26;
        _os_log_debug_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_DEBUG, "Parsing configuration attribute of type %u length %u", buf, 0xEu);
      }

      v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v25 + 2 length:v26];
      v31 = -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)self, v29, 0, v26, v27, 0);
      if (v31)
      {
        id v32 = objc_getProperty(self, v30, 24, 1);
        if (v32) {
          id v32 = objc_getProperty(v32, v33, 16, 1);
        }
        id v34 = v32;
        [v34 addObject:v31];
      }
      v23 += v26 + 4;

      if (v23 >= v21) {
        return [(NEIKEv2ConfigPayload *)self hasRequiredFields];
      }
    }
  }
  return [(NEIKEv2ConfigPayload *)self hasRequiredFields];
}

- (id)createConfigAttributeFromData:(void *)a3 attributeName:(unsigned int)a4 attributeLen:(uint64_t)a5 attributeType:(uint64_t)a6 customType:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    switch(a5)
    {
      case 1:
      case 2:
      case 3:
      case 6:
      case 20:
        *(_DWORD *)&v32[12] = 0;
        *(void *)&v32[4] = 0;
        *(_DWORD *)id v32 = 528;
        if (a4 == 4) {
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(_OWORD *)v32);
        }
        id v13 = 0;
        switch(a5)
        {
          case 1:
          case 2:
          case 3:
          case 6:
            goto LABEL_34;
          case 4:
          case 5:
            break;
          default:
            if (a5 == 20) {
LABEL_34:
            }
              id v13 = (objc_class *)objc_opt_class();
            break;
        }
        id v22 = [v13 alloc];
        unsigned int v23 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v32];
        if (a6) {
          uint64_t v24 = [v22 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v23];
        }
        else {
          uint64_t v24 = [v22 initWithAddress:v23];
        }
        unsigned int v18 = (void *)v24;

        break;
      case 4:
      case 5:
      case 9:
      case 11:
      case 16:
      case 17:
      case 18:
      case 19:
      case 22:
      case 23:
      case 24:
        goto LABEL_24;
      case 7:
      case 14:
      case 25:
        SEL v14 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), a4, 4);
        if (a5 == 25 || a5 == 14 || a5 == 7) {
          uint64_t v26 = (objc_class *)objc_opt_class();
        }
        else {
          uint64_t v26 = 0;
        }
        uint64_t v21 = [[v26 alloc] initWithStringValue:v14];
        goto LABEL_46;
      case 8:
      case 15:
        memset(&v32[4], 0, 24);
        *(_DWORD *)id v32 = 7708;
        if (a4 == 16)
        {
          uint64_t v16 = 0;
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(void *)v32, *(void *)&v32[8], *(void *)&v32[16], *(void *)&v32[24]);
        }
        else if (a4 == 17)
        {
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(void *)v32, *(void *)&v32[8], *(void *)&v32[16], *(void *)&v32[24]);
          uint64_t v16 = *(unsigned __int8 *)([v11 bytes] + 16);
        }
        else
        {
          uint64_t v16 = 0;
        }
        v28 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v32];
        if (a5 == 8 || a5 == 15) {
          v29 = (objc_class *)objc_opt_class();
        }
        else {
          v29 = 0;
        }
        id v30 = [v29 alloc];
        if (a6) {
          uint64_t v31 = [v30 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v28 prefix:v16];
        }
        else {
          uint64_t v31 = [v30 initWithAddress:v28 prefix:v16];
        }
        unsigned int v18 = (void *)v31;

        break;
      case 10:
      case 12:
      case 21:
        goto LABEL_11;
      case 13:
        uint64_t v19 = 0;
        *(_DWORD *)&v32[12] = 0;
        *(void *)&v32[4] = 0;
        *(_DWORD *)id v32 = 528;
        if (a4 == 8)
        {
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(void *)v32, *(void *)&v32[8]);
          uint64_t v19 = *(unsigned int *)([v11 bytes] + 4);
        }
        long long v20 = [NEIKEv2IPv4SubnetAttribute alloc];
        SEL v14 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v32];
        if (a6) {
          uint64_t v21 = [(NEIKEv2SubnetAttribute *)v20 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v14 ipv4SubnetMask:v19];
        }
        else {
          uint64_t v21 = [(NEIKEv2SubnetAttribute *)v20 initWithAddress:v14 ipv4SubnetMask:v19];
        }
        goto LABEL_46;
      default:
        if ((unint64_t)(a5 - 25958) >= 2)
        {
LABEL_24:
          SEL v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v32 = 67109376;
            *(_DWORD *)&v32[4] = (unsigned __int16)a5;
            *(_WORD *)&v32[8] = 1024;
            *(_DWORD *)&v32[10] = a4;
            _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_INFO, "Received unknown attribute of type %u length %u", v32, 0xEu);
          }

          goto LABEL_27;
        }
LABEL_11:
        memset(&v32[4], 0, 24);
        *(_DWORD *)id v32 = 7708;
        if (a4 == 16) {
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(_OWORD *)v32, *(_OWORD *)&v32[16]);
        }
        SEL v14 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v32];
        id v15 = 0;
        if (a5 <= 20)
        {
          if (a5 == 10 || a5 == 12) {
            goto LABEL_39;
          }
        }
        else if (a5 == 21 || a5 == 25958 || a5 == 25959)
        {
LABEL_39:
          id v15 = (objc_class *)objc_opt_class();
        }
        id v25 = [v15 alloc];
        if (a6) {
          uint64_t v21 = [v25 initCustomWithAttributeType:a6 attributeName:v12 addressValue:v14];
        }
        else {
          uint64_t v21 = [v25 initWithAddress:v14];
        }
LABEL_46:
        unsigned int v18 = (void *)v21;

        break;
    }
  }
  else
  {
LABEL_27:
    unsigned int v18 = 0;
  }

  return v18;
}

- (BOOL)generatePayloadData
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_71:
    id Property = objc_getProperty(self, v3, 16, 1);
    return Property != 0;
  }
  if (![(NEIKEv2ConfigPayload *)self hasRequiredFields])
  {
    v43 = ne_log_obj();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = self;
      _os_log_fault_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_FAULT, "Configuration payload missing required fields %@", buf, 0xCu);
    }

    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = &OBJC_IVAR___NEIKEv2IKESA__error;
  if (self)
  {
    id v7 = objc_getProperty(self, v4, 24, 1);
    if (v7) {
      id v7 = objc_getProperty(v7, v8, 16, 1);
    }
  }
  else
  {
    id v7 = 0;
  }
  id v9 = v7;
  uint64_t v10 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  if (self)
  {
    id v12 = objc_getProperty(self, v11, 24, 1);
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 16, 1);
    }
  }
  else
  {
    id v12 = 0;
  }
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v15)
  {
    uint64_t v18 = 0;
    goto LABEL_59;
  }
  unint64_t v17 = v15;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v63;
  *(void *)&long long v16 = 138412290;
  long long v56 = v16;
  for (uint64_t i = *(void *)v63; ; uint64_t i = *(void *)v63)
  {
    if (i != v20) {
      objc_enumerationMutation(v14);
    }
    id v22 = *(NEIKEv2ConfigPayload **)(*((void *)&v62 + 1) + 8 * v19);
    if (![(NEIKEv2ConfigPayload *)v22 attributeType])
    {
      id v25 = ne_log_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = v56;
        v69 = v22;
        _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, "AttributeType 0 invalid in %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    if ([(NEIKEv2ConfigPayload *)v22 valueType] == 5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v23 = [(NEIKEv2ConfigPayload *)v22 stringValue];

        if (v23)
        {
          uint64_t v24 = [(NEIKEv2ConfigPayload *)v22 stringValue];
          id v25 = [v24 dataUsingEncoding:4];

          *(_DWORD *)buf = 0;
          unsigned int v26 = [(NEIKEv2ConfigPayload *)v22 attributeType];
          unsigned int v27 = [v25 length];
          *(_WORD *)buf = bswap32(v26) >> 16;
          *(_WORD *)&buf[2] = bswap32(v27) >> 16;
          uint64_t v28 = [v25 length] + 4;
          v18 += v28;
          v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v28];
          [v29 appendBytes:buf length:4];
          [v29 appendData:v25];
          [v10 addObject:v29];

LABEL_26:
          goto LABEL_50;
        }
LABEL_34:
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32([(NEIKEv2ConfigPayload *)v22 attributeType]) >> 16;
        *(_WORD *)&buf[2] = 0;
        v18 += 4;
        id v33 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:4];
        goto LABEL_49;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = [(NEIKEv2ConfigPayload *)v22 address];

      if (!v30) {
        goto LABEL_34;
      }
      uint64_t v31 = [(NEIKEv2ConfigPayload *)v22 address];
      uint64_t v32 = [v31 address];

      if ([(NEIKEv2ConfigPayload *)v22 valueType] == 1 && *(unsigned char *)(v32 + 1) == 2)
      {
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32([(NEIKEv2ConfigPayload *)v22 attributeType]) >> 16;
        *(_WORD *)&buf[2] = 1024;
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        [v33 appendBytes:buf length:4];
        p_b = (int *)(v32 + 4);
        goto LABEL_47;
      }
      if ([(NEIKEv2ConfigPayload *)v22 valueType] == 2 && *(unsigned char *)(v32 + 1) == 30)
      {
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32([(NEIKEv2ConfigPayload *)v22 attributeType]) >> 16;
        *(_WORD *)&buf[2] = 4096;
        v18 += 20;
        id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:20];
        [v33 appendBytes:buf length:4];
        p_b = (int *)(v32 + 8);
        v40 = v33;
        uint64_t v41 = 16;
        goto LABEL_48;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_50;
      }
      long long v35 = [(NEIKEv2ConfigPayload *)v22 address];

      if (!v35) {
        goto LABEL_34;
      }
      int v36 = [(NEIKEv2ConfigPayload *)v22 address];
      uint64_t v37 = [v36 address];

      if ([(NEIKEv2ConfigPayload *)v22 valueType] == 3 && *(unsigned char *)(v37 + 1) == 2)
      {
        unsigned int v38 = [(NEIKEv2ConfigPayload *)v22 prefix];
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32([(NEIKEv2ConfigPayload *)v22 attributeType]) >> 16;
        *(_WORD *)&buf[2] = 2048;
        int __b = 0;
        if (v38 <= 0x20)
        {
          if (v38 >= 8)
          {
            memset(&__b, 255, v38 >> 3);
            uint64_t v39 = v38 >> 3 <= 1 ? 1 : v38 >> 3;
          }
          else
          {
            uint64_t v39 = 0;
          }
          if ((v38 & 7) != 0) {
            *((unsigned char *)&__b + v39) = 0xFF00u >> (v38 & 7);
          }
        }
        v18 += 12;
        id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:12];
        [v33 appendBytes:buf length:4];
        [v33 appendBytes:v37 + 4 length:4];
        p_b = &__b;
LABEL_47:
        v40 = v33;
        uint64_t v41 = 4;
LABEL_48:
        [v40 appendBytes:p_b length:v41];
LABEL_49:
        [v10 addObject:v33];

        goto LABEL_50;
      }
      if ([(NEIKEv2ConfigPayload *)v22 valueType] == 4 && *(unsigned char *)(v37 + 1) == 30)
      {
        LOBYTE(__b) = 0;
        LOBYTE(__b) = [(NEIKEv2ConfigPayload *)v22 prefix];
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32([(NEIKEv2ConfigPayload *)v22 attributeType]) >> 16;
        *(_WORD *)&buf[2] = 4352;
        v18 += 21;
        id v33 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:21];
        [v33 appendBytes:buf length:4];
        [v33 appendBytes:v37 + 8 length:16];
        p_b = &__b;
        v40 = v33;
        uint64_t v41 = 1;
        goto LABEL_48;
      }
    }
LABEL_50:
    if (++v19 < v17) {
      continue;
    }
    uint64_t v42 = [v14 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (!v42) {
      break;
    }
    unint64_t v17 = v42;
    uint64_t v19 = 0;
  }
  v6 = &OBJC_IVAR___NEIKEv2IKESA__error;
LABEL_59:

  *(_DWORD *)buf = 0;
  if (self && (v46 = objc_getProperty(self, v45, v6[110], 1)) != 0) {
    uint64_t v47 = v46[1];
  }
  else {
    LOBYTE(v47) = 0;
  }
  buf[0] = v47;
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v18 + 4];
  [v48 appendBytes:buf length:4];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v49 = v10;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v58 != v52) {
          objc_enumerationMutation(v49);
        }
        [v48 appendData:*(void *)(*((void *)&v57 + 1) + 8 * j)];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v51);
  }

  if (self)
  {
    objc_setProperty_atomic(self, v54, v48, 16);

    goto LABEL_71;
  }

  id Property = 0;
  return Property != 0;
}

- (BOOL)hasRequiredFields
{
  if (self)
  {
    self = (NEIKEv2ConfigPayload *)objc_getProperty(self, a2, 24, 1);
    if (self) {
      LOBYTE(self) = *(void *)&self->super._isInbound != 0;
    }
  }
  return (char)self;
}

- (id)description
{
  return [(NEIKEv2ConfigPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Configuration" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 47;
}

+ (id)copyTypeDescription
{
  return @"CONFIG";
}

@end