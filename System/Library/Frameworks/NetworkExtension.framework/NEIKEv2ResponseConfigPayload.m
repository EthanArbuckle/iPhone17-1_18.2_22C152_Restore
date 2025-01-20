@interface NEIKEv2ResponseConfigPayload
- (BOOL)parsePayloadData;
@end

@implementation NEIKEv2ResponseConfigPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v57 = "-[NEIKEv2ResponseConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_58;
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
      *(void *)v57 = "-[NEIKEv2ResponseConfigPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_config_hdr_t))";
LABEL_58:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v55 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v55, 4);
  v8 = objc_alloc_init(NEIKEv2ConfigurationMessage);
  objc_setProperty_atomic(self, v9, v8, 24);

  v10 = self;
  uint64_t v11 = v55;
  selfa = v10;
  Property = objc_getProperty(v10, v12, 24, 1);
  if (Property) {
    Property[1] = v11;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = selfa;
  id v17 = objc_getProperty(selfa, v16, 24, 1);
  if (v17) {
    objc_setProperty_atomic(v17, v18, v14, 16);
  }

  unsigned int v50 = objc_msgSend(objc_getProperty(selfa, v19, 16, 1), "length");
  if (v50 >= 5)
  {
    unsigned int v22 = 4;
    *(void *)&long long v21 = 67109376;
    long long v48 = v21;
    v23 = &off_1E598D000;
    do
    {
      id v24 = objc_getProperty(v15, v20, 16, 1);
      v26 = (unsigned __int16 *)([v24 bytes] + v22);
      uint64_t v27 = bswap32(v26[1]) >> 16;
      if (v27 + (unint64_t)v22 + 4 > v50)
      {

        return [(NEIKEv2ConfigPayload *)v15 hasRequiredFields];
      }
      id v28 = 0;
      int v29 = bswap32(*v26);
      uint64_t v30 = HIWORD(v29);
      if (v29 >> 16 >= 0x4000 && (unsigned __int16)(HIWORD(v29) - 25960) <= 0xFFFDu)
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v31 = objc_getProperty(v15, v25, 32, 1);
        if (v31) {
          id v31 = objc_getProperty(v31, v32, 16, 1);
        }
        id v33 = v31;
        id v28 = (id)[v33 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v28)
        {
          uint64_t v34 = *(void *)v52;
          while (2)
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v52 != v34) {
                objc_enumerationMutation(v33);
              }
              v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              if ((unint64_t)objc_msgSend(v36, "attributeType", v48) >= 0x4000
                && !((unint64_t)[v36 attributeType] >> 15)
                && [v36 attributeType] == v30)
              {
                id v28 = v36;
                goto LABEL_31;
              }
            }
            id v28 = (id)[v33 countByEnumeratingWithState:&v51 objects:v58 count:16];
            if (v28) {
              continue;
            }
            break;
          }
LABEL_31:
          v15 = selfa;
          v23 = &off_1E598D000;
        }
      }
      v37 = ne_log_obj();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v48;
        *(_DWORD *)v57 = v30;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v27;
        _os_log_debug_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_DEBUG, "Parsing configuration attribute of type %u length %u", buf, 0xEu);
      }

      v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v26 + 2 length:v27];
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v30 = 1;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v30 = 8;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v30 = 2;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v30 = 15;
                }
              }
            }
          }
          v44 = objc_msgSend(v28, "attributeName", v48);
          v42 = -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)v15, v38, v44, v27, v30, [v28 attributeType]);

          if (!v42) {
            goto LABEL_53;
          }
LABEL_50:
          id v45 = objc_getProperty(v15, v43, 24, 1);
          if (v45) {
            id v45 = objc_getProperty(v45, v46, 16, 1);
          }
          id v47 = v45;
          [v47 addObject:v42];

          goto LABEL_53;
        }
        v39 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v38, "bytes"), v27, 4);
        id v40 = objc_alloc((Class)v23[187]);
        v41 = [v28 attributeName];
        v42 = (void *)[v40 initCustomWithAttributeType:v30 attributeName:v41 stringValue:v39];

        v23 = &off_1E598D000;
        if (v42) {
          goto LABEL_50;
        }
      }
      else
      {
        v42 = -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)v15, v38, 0, v27, v30, 0);
        if (v42) {
          goto LABEL_50;
        }
      }
LABEL_53:
      v22 += v27 + 4;
    }
    while (v22 < v50);
  }
  return [(NEIKEv2ConfigPayload *)v15 hasRequiredFields];
}

@end