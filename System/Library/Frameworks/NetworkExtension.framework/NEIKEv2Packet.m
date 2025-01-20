@interface NEIKEv2Packet
+ (BOOL)encryptPayloads;
+ (id)copyTypeDescription;
+ (uint64_t)createPacketFromReceivedData:(uint64_t)a1;
+ (unint64_t)exchangeType;
- (BOOL)addNotification:(void *)a3 data:;
- (BOOL)addNotifyPayload:(void *)a1;
- (NSObject)initOutbound;
- (id)copyPacketDatagramsForIKESA:(unsigned char *)a1;
- (id)copyShortDescription;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)copyUnifiedData;
- (uint64_t)hasErrors;
- (uint64_t)hasNotification:(void *)a1;
- (uint64_t)initResponse:(uint64_t)a1;
- (uint64_t)processDecryptedPacketForIKESA:(unsigned char *)a1;
- (uint64_t)processReceivedPacketForIKESA:(unsigned char *)a1;
- (void)addNotification:(void *)a3 fromArray:(void *)a4 toPayloads:;
- (void)constructHeadersForNextPayloadType:(uint64_t)a3 payloadsLength:(unsigned int)a4 fragmentNumber:(unsigned int)a5 totalFragments:(void *)a6 securityContext:;
- (void)copyNotification:(void *)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2Packet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPayloads, 0);
  objc_storeStrong((id *)&self->_packetDatagrams, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_customPayloads, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
  objc_storeStrong((id *)&self->_responderSPI, 0);

  objc_storeStrong((id *)&self->_initiatorSPI, 0);
}

- (id)copyShortDescription
{
  id v3 = [NSString alloc];
  v5 = (void *)[(id)objc_opt_class() copyTypeDescription];
  v6 = "R";
  v7 = "req";
  if (self)
  {
    if (self->_isInitiator) {
      v6 = "I";
    }
    if (self->_isResponse) {
      v7 = "resp";
    }
    uint64_t messageID = self->_messageID;
    id v9 = objc_getProperty(self, v4, 32, 1);
    id Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {
    id v9 = 0;
    uint64_t messageID = 0;
    id Property = 0;
  }
  v12 = (void *)[v3 initWithFormat:@"[%@ %s %s%d %@-%@]", v5, v6, v7, messageID, v9, Property];

  return v12;
}

- (id)description
{
  return [(NEIKEv2Packet *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Exchange" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 32, 1), @"Initiator SPI", v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 40, 1), @"Responder SPI", v5, a4);
    [v7 appendPrettyBOOL:self->_isInitiator withName:@"Initiator" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:self->_isResponse withName:@"Response" andIndent:v5 options:a4];
    [v7 appendPrettyInt:self->_messageID withName:@"Message ID" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v11, 80, 1);
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"Initiator SPI" andIndent:v5 options:a4];
    [v7 appendPrettyObject:0 withName:@"Responder SPI" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:0 withName:@"Initiator" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:0 withName:@"Response" andIndent:v5 options:a4];
    [v7 appendPrettyInt:0 withName:@"Message ID" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Payloads" andIndent:v5 options:a4];

  return v7;
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (self) {
    self = (NEIKEv2Packet *)objc_getProperty(self, a2, 80, 1);
  }
  id v3 = self;
  uint64_t v4 = [(NEIKEv2Packet *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v2 && objc_getProperty(v2, v9, 64, 1))
          {
            v12 = objc_msgSend(objc_getProperty(v2, v10, 64, 1), "arrayByAddingObject:", v8);
LABEL_17:
            v15 = v2;
            v16 = v12;
            ptrdiff_t v17 = 64;
            goto LABEL_20;
          }
          uint64_t v23 = v8;
          v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v23, 1, (void)v18);
          if (v2) {
            goto LABEL_17;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          if (v2 && objc_getProperty(v2, v13, 56, 1))
          {
            v12 = objc_msgSend(objc_getProperty(v2, v14, 56, 1), "arrayByAddingObject:", v8);
LABEL_19:
            v15 = v2;
            v16 = v12;
            ptrdiff_t v17 = 56;
LABEL_20:
            objc_setProperty_atomic(v15, v11, v16, v17);
            goto LABEL_21;
          }
          uint64_t v22 = v8;
          v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v22, 1, (void)v18);
          if (v2) {
            goto LABEL_19;
          }
        }
LABEL_21:

LABEL_22:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NEIKEv2Packet *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v3, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 56, 1));
    objc_setProperty_atomic(self, v5, newValue, 80);
  }
  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 0;
}

+ (BOOL)encryptPayloads
{
  return 1;
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

- (void)addNotification:(void *)a3 fromArray:(void *)a4 toPayloads:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
          if (v14)
          {
            if (v14[3] == a2)
            {
              v16 = v14;

              objc_msgSend(v8, "addObject:", v16, (void)v17);
              [v9 removeObject:v16];
              id v9 = v16;
              goto LABEL_16;
            }
          }
          else if (!a2)
          {
            goto LABEL_16;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v15 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v11 = v15;
      }
      while (v15);
    }
LABEL_16:
  }
}

- (NSObject)initOutbound
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2Packet;
  v1 = objc_msgSendSuper2(&v6, sel_init);
  if (!v1)
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)SEL v5 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }
    goto LABEL_7;
  }
  v2 = v1;
  if ([v1 isMemberOfClass:objc_opt_class()])
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)SEL v5 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "Must use a subclass of NEIKEv2Packet to create outbound packets", v5, 2u);
    }

LABEL_7:
    return 0;
  }
  return v2;
}

- (uint64_t)initResponse:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v4 = v3;
  if (a1)
  {
    if (v3)
    {
      if (v3[3])
      {
        v11.receiver = (id)a1;
        v11.super_class = (Class)NEIKEv2Packet;
        id v5 = objc_msgSendSuper2(&v11, sel_init);
        if (!v5)
        {
          a1 = ne_log_obj();
          if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_19DDAF000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
          }
          goto LABEL_8;
        }
        a1 = (uint64_t)v5;
        if (![v5 isMemberOfClass:objc_opt_class()])
        {
          *(unsigned char *)(a1 + 10) = 1;
          *(_DWORD *)(a1 + 24) = v4[6];
          goto LABEL_10;
        }
        objc_super v6 = ne_log_obj();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
LABEL_7:

LABEL_8:
          a1 = 0;
          goto LABEL_10;
        }
        *(_WORD *)buf = 0;
        id v8 = "Must use a subclass of NEIKEv2Packet to create outbound packets";
        id v9 = v6;
        uint32_t v10 = 2;
LABEL_12:
        _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
        goto LABEL_7;
      }
      objc_super v6 = ne_log_obj();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet initResponse:]";
      id v8 = "%s called with null originalMessage.isInbound";
    }
    else
    {
      objc_super v6 = ne_log_obj();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet initResponse:]";
      id v8 = "%s called with null originalMessage";
    }
    id v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_12;
  }
LABEL_10:

  return a1;
}

- (void)constructHeadersForNextPayloadType:(uint64_t)a3 payloadsLength:(unsigned int)a4 fragmentNumber:(unsigned int)a5 totalFragments:(void *)a6 securityContext:
{
  BOOL v10 = a4 != 0;
  BOOL v11 = a5 != 0;
  id v12 = a6;
  int v13 = [v12 overheadForPlaintextLength:a3];
  id v14 = objc_alloc(MEMORY[0x1E4F1CA58]);

  BOOL v15 = !v10 || !v11;
  BOOL v28 = v10 && v11;
  if (v10 && v11) {
    uint64_t v16 = 8;
  }
  else {
    uint64_t v16 = 4;
  }
  char v17 = 46;
  if (!v15) {
    char v17 = 53;
  }
  if (a6) {
    uint64_t v18 = v16 + 28;
  }
  else {
    uint64_t v18 = 28;
  }
  if (a6) {
    unsigned __int8 v19 = v17;
  }
  else {
    unsigned __int8 v19 = a2;
  }
  long long v20 = (void *)[v14 initWithCapacity:v18];
  char v21 = 32;
  v31[0] = objc_msgSend(objc_getProperty((id)a1, v22, 32, 1), "value");
  v31[1] = objc_msgSend(objc_getProperty((id)a1, v23, 40, 1), "value");
  uint64_t v32 = v19;
  BYTE1(v32) = 32;
  *(_DWORD *)((char *)&v32 + 2) = [(id)objc_opt_class() exchangeType];
  if (*(unsigned char *)(a1 + 11))
  {
    BYTE3(v32) = 8;
    char v21 = 40;
  }
  int v24 = v13 + a3;
  if (*(unsigned char *)(a1 + 10)) {
    BYTE3(v32) = v21;
  }
  HIDWORD(v32) = bswap32(*(_DWORD *)(a1 + 24));
  unsigned int v33 = bswap32(v18 + (unsigned __int16)v24);
  [v20 appendBytes:v31 length:28];
  if (a6)
  {
    v30[0] = a2;
    v30[1] = bswap32(v24 + v16) >> 16;
    [v20 appendBytes:v30 length:4];
    if (v28)
    {
      v29[0] = __rev16(a4);
      v29[1] = __rev16(a5);
      [v20 appendBytes:v29 length:4];
    }
  }
  return v20;
}

- (uint64_t)copyUnifiedData
{
  if (objc_msgSend(objc_getProperty(a1, a2, 72, 1), "count") != 1) {
    return 0;
  }
  objc_msgSend(objc_getProperty(a1, v3, 72, 1), "firstObject");
  return objc_claimAutoreleasedReturnValue();
}

- (id)copyPacketDatagramsForIKESA:(unsigned char *)a1
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  SEL v4 = a2;
  if ((a1[12] & 1) == 0)
  {
    [a1 gatherPayloads];
    objc_super v6 = [(NEIKEv2IKESA *)v4 initiatorSPI];
    objc_setProperty_atomic(a1, v7, v6, 32);

    id v9 = [(NEIKEv2IKESA *)v4 responderSPI];
    objc_setProperty_atomic(a1, v10, v9, 40);

    if (v4) {
      char v12 = v4[9] & 1;
    }
    else {
      char v12 = 0;
    }
    a1[11] = v12;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    int v13 = objc_msgSend(objc_getProperty(a1, v11, 80, 1), "reverseObjectEnumerator");
    uint64_t v14 = [v13 countByEnumeratingWithState:&v102 objects:v110 count:16];
    if (v14)
    {
      unint64_t v15 = v14;
      v99 = a1;
      v91 = v4;
      uint64_t v16 = 0;
      char v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v103;
      for (uint64_t i = *(void *)v103; ; uint64_t i = *(void *)v103)
      {
        if (i != v19) {
          objc_enumerationMutation(v13);
        }
        char v21 = *(void **)(*((void *)&v102 + 1) + 8 * v18);
        if ([v21 generatePayloadData])
        {
          *(_DWORD *)buf = 0;
          if (v21) {
            id Property = objc_getProperty(v21, v22, 16, 1);
          }
          else {
            id Property = 0;
          }
          unsigned int v24 = [Property length] + 4;
          buf[0] = v16;
          *(_WORD *)&buf[2] = bswap32(v24) >> 16;
          uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v17, "length") + (unsigned __int16)v24);
          [v25 appendBytes:buf length:4];
          if (v21) {
            id v27 = objc_getProperty(v21, v26, 16, 1);
          }
          else {
            id v27 = 0;
          }
          [v25 appendData:v27];
          if (v17) {
            [v25 appendData:v17];
          }

          uint64_t v16 = [v21 type];
          char v17 = v25;
        }
        else
        {
          BOOL v28 = ne_log_large_obj();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v109 = v21;
            _os_log_error_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_ERROR, "Failed to generate payload data for %@", buf, 0xCu);
          }
        }
        if (++v18 >= v15)
        {
          uint64_t v29 = [v13 countByEnumeratingWithState:&v102 objects:v110 count:16];
          if (!v29)
          {
            SEL v4 = v91;
            a1 = v99;
            goto LABEL_28;
          }
          unint64_t v15 = v29;
          uint64_t v18 = 0;
        }
      }
    }
    uint64_t v16 = 0;
    char v17 = 0;
LABEL_28:

    if (![(id)objc_opt_class() encryptPayloads])
    {
      v50 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)a1, v16, (unsigned __int16)[v17 length], 0, 0, 0);
      if (!v50)
      {
LABEL_76:
        id v30 = 0;
        goto LABEL_70;
      }
      v51 = v50;
      v52 = (NEIKEv2EncryptedPayload *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v17, "length") + -[NSObject length](v50, "length"));
      [(NEIKEv2EncryptedPayload *)v52 appendData:v51];
      [(NEIKEv2EncryptedPayload *)v52 appendData:v17];
      v106 = v52;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
      objc_setProperty_atomic(a1, v54, v53, 72);

      goto LABEL_68;
    }
    if (v4)
    {
      if (v4[10])
      {
        unsigned int v31 = [v17 length];
        uint64_t v32 = v4;
        unsigned int v34 = [(NEIKEv2IKESA *)v32 headerOverhead];
        uint64_t v36 = [(NEIKEv2IKESA *)(uint64_t)v32 maximumPacketSize] - v34 - 32;
        id v38 = objc_getProperty(v32, v37, 208, 1);

        LODWORD(v36) = [v38 maximumPayloadSizeWithinLimit:v36];
        if (v36 < v31)
        {
          v39 = v32;
          unsigned int v41 = [(NEIKEv2IKESA *)v39 headerOverhead];
          uint64_t v43 = [(NEIKEv2IKESA *)(uint64_t)v39 maximumPacketSize] - v41 - 36;
          id v45 = objc_getProperty(v39, v44, 208, 1);
          self = v39;

          unsigned int v46 = [v45 maximumPayloadSizeWithinLimit:v43];
          v96 = v17;
          if (!v46)
          {
            v51 = ne_log_obj();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_FAULT, "Fragment size of 0 is impossible!", buf, 2u);
            }
            goto LABEL_75;
          }
          unsigned int v47 = [v17 length];
          unsigned int v97 = v47;
          if (v47 / v46 * v46 == v47) {
            int v48 = v47 / v46;
          }
          else {
            LOWORD(v48) = v47 / v46 + 1;
          }
          v49 = ne_log_obj();
          v100 = a1;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v109 = (unsigned __int16)v48;
            *(_WORD *)&v109[4] = 1024;
            *(_DWORD *)&v109[6] = v46;
            _os_log_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_INFO, "Splitting packet into %u fragments with max size %u each", buf, 0xEu);
          }
          v92 = v4;

          v60 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(unsigned __int16)v48];
          if ((_WORD)v48)
          {
            unsigned int v94 = v46;
            unsigned __int16 v95 = v48;
            v98 = 0;
            unsigned __int16 v67 = 1;
            unsigned int v68 = v97;
            unsigned int v93 = (unsigned __int16)v48;
            while (1)
            {
              uint64_t v69 = v46 >= v68 ? v68 : v46;
              v70 = objc_msgSend(v17, "subdataWithRange:", v97 - v68, v69);
              if (!v70) {
                break;
              }
              v71 = v70;
              uint64_t v72 = v16;
              if (v67 == 1) {
                unsigned __int8 v73 = v16;
              }
              else {
                unsigned __int8 v73 = 0;
              }
              unsigned __int16 v74 = [v70 length];
              id v76 = objc_getProperty(self, v75, 208, 1);
              v77 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)v100, v73, v74, v67, v95, v76);

              if (!v77)
              {
                v51 = v98;
                char v17 = v96;
                goto LABEL_81;
              }
              if (v67 == 1)
              {
                v79 = v77;

                v98 = v79;
              }
              uint64_t v16 = v72;
              id v80 = objc_getProperty(self, v78, 208, 1);
              v81 = [v80 constructEncryptedPacketFromPayloadData:v71 authenticatedHeaders:v77];

              char v17 = v96;
              if (!v81)
              {

                v51 = v98;
                goto LABEL_81;
              }
              [v60 addObject:v81];
              v68 -= v69;

              ++v67;
              unsigned int v46 = v94;
              if (v93 < v67) {
                goto LABEL_62;
              }
            }
            v71 = ne_log_obj();
            v51 = v98;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_FAULT, "[NSData subdataWithRange:] failed", buf, 2u);
            }
LABEL_81:

            SEL v4 = v92;
            goto LABEL_75;
          }
          v98 = 0;
LABEL_62:
          a1 = v100;
          objc_setProperty_atomic(v100, v66, v60, 72);
          SEL v4 = v92;
          v51 = v98;
          goto LABEL_63;
        }
      }
      unsigned __int16 v55 = [v17 length];
      id v57 = objc_getProperty(v4, v56, 208, 1);
    }
    else
    {
      unsigned __int16 v55 = [v17 length];
      id v57 = 0;
    }
    id v58 = v57;
    id v30 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)a1, v16, v55, 0, 0, v58);

    if (!v30)
    {
LABEL_70:

      goto LABEL_71;
    }
    v60 = v30;
    if (v4) {
      id v61 = objc_getProperty(v4, v59, 208, 1);
    }
    else {
      id v61 = 0;
    }
    id v62 = v61;
    v63 = [v62 constructEncryptedPacketFromPayloadData:v17 authenticatedHeaders:v60];

    if (!v63)
    {

      v51 = v60;
      goto LABEL_75;
    }
    v107 = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
    objc_setProperty_atomic(a1, v65, v64, 72);

    v51 = v60;
LABEL_63:

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_69:

      id v30 = objc_getProperty(a1, v88, 72, 1);
      goto LABEL_70;
    }
    v82 = objc_alloc_init(NEIKEv2EncryptedPayload);
    v52 = v82;
    if (v82)
    {
      objc_setProperty_atomic(v82, v83, v17, 16);
      objc_setProperty_atomic(v52, v84, v51, 24);
      v52->_nextPayload = v16;
    }
    objc_setProperty_atomic(a1, v83, v52, 48);
    v86 = [(NEIKEv2IntermediatePacket *)a1 authenticatedData];

    if (v86)
    {
      objc_setProperty_atomic(a1, v87, 0, 48);
LABEL_68:

      goto LABEL_69;
    }
    v90 = ne_log_obj();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v90, OS_LOG_TYPE_ERROR, "Failed to get authenticated data for IKE_INTERMEDIATE", buf, 2u);
    }

LABEL_75:
    goto LABEL_76;
  }
  id v30 = objc_getProperty(a1, v3, 72, 1);
LABEL_71:

  return v30;
}

+ (uint64_t)createPacketFromReceivedData:(uint64_t)a1
{
  *(void *)&v60[5] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (![v2 bytes])
  {
    uint64_t v5 = ne_log_obj();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null data.bytes";
LABEL_82:
    _os_log_fault_impl(&dword_19DDAF000, (os_log_t)v5, OS_LOG_TYPE_FAULT, v52, buf, 0xCu);
    goto LABEL_10;
  }
  if ((unint64_t)[v2 length] <= 0x1B)
  {
    uint64_t v5 = ne_log_obj();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null (data.length >= sizeof(ikev2_hdr_t))";
    goto LABEL_82;
  }
  uint64_t v3 = [v2 bytes];
  unint64_t v4 = bswap32(*(_DWORD *)(v3 + 24));
  if ([v2 length] < v4)
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v60[0] = v4;
      LOWORD(v60[1]) = 1024;
      *(_DWORD *)((char *)&v60[1] + 2) = [v2 length];
      objc_super v6 = "Cannot parse packet, header claims to be longer than data (%u > %u)";
      SEL v7 = v5;
      uint32_t v8 = 14;
LABEL_67:
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (*(unsigned char *)(v3 + 17) == 32)
  {
    int v55 = 1;
    id v9 = off_1E598D408;
    switch(*(unsigned char *)(v3 + 18))
    {
      case '""':
        break;
      case '#':
        int v55 = 0;
        id v9 = off_1E598D3F0;
        break;
      case '$':
        int v55 = 0;
        id v9 = off_1E598D348;
        break;
      case '%':
        int v55 = 0;
        id v9 = off_1E598D498;
        break;
      case '+':
        int v55 = 0;
        id v9 = off_1E598D4C0;
        break;
      case ',':
        int v55 = 0;
        id v9 = off_1E598D3C8;
        break;
      default:
        uint64_t v5 = ne_log_obj();
        if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        int v11 = *(unsigned __int8 *)(v3 + 18);
        *(_DWORD *)buf = 67109120;
        v60[0] = v11;
        objc_super v6 = "Unknown exchange type %u";
        goto LABEL_66;
    }
    char v12 = objc_alloc_init(*v9);
    uint64_t v5 = (uint64_t)v12;
    if (v12) {
      v12[12] = 1;
    }
    id v58 = v2;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    if (v5) {
      objc_setProperty_atomic((id)v5, v13, v14, 72);
    }

    uint64_t v16 = [[NEIKEv2IKESPI alloc] initWithValue:*(void *)v3];
    if (v5) {
      objc_setProperty_atomic((id)v5, v15, v16, 32);
    }

    char v17 = [[NEIKEv2IKESPI alloc] initWithValue:*(void *)(v3 + 8)];
    uint64_t v19 = v17;
    if (v5)
    {
      objc_setProperty_atomic((id)v5, v18, v17, 40);

      *(unsigned char *)(v5 + 11) = (*(unsigned char *)(v3 + 19) & 8) != 0;
      *(unsigned char *)(v5 + 10) = (*(unsigned char *)(v3 + 19) & 0x20) != 0;
      *(_DWORD *)(v5 + 24) = bswap32(*(_DWORD *)(v3 + 20));
    }
    else
    {
    }
    unsigned int v20 = *(unsigned __int8 *)(v3 + 16);
    id v54 = v2;
    uint64_t v56 = [v2 bytes];
    if (v20 && v4 >= 0x20)
    {
      uint64_t v23 = 28;
      *(void *)&long long v22 = 67109376;
      long long v53 = v22;
      while (1)
      {
        unsigned int v24 = (unsigned __int8 *)(v56 + v23);
        uint64_t v25 = bswap32(*(unsigned __int16 *)(v56 + v23 + 2)) >> 16;
        if (v25 <= 3)
        {
          id v45 = ne_log_obj();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          int v48 = "Bad payload length too short (%u)";
LABEL_77:
          v49 = v45;
          uint32_t v50 = 8;
          goto LABEL_72;
        }
        uint64_t v23 = (v23 + v25);
        if (v23 > v4)
        {
          id v45 = ne_log_obj();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          int v48 = "Bad payload length too long (%u)";
          goto LABEL_77;
        }
        int v26 = (char)v24[1];
        id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v24 + 4 length:v25 - 4];
        BOOL v28 = +[NEIKEv2Payload createPayloadWithType:fromData:]((uint64_t)NEIKEv2Payload, v20, v27);
        if (v28) {
          break;
        }
        if (v26 < 0)
        {
          uint64_t v32 = ne_log_obj();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v60[0] = v20;
            _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "Failed to parse critical payload type %u", buf, 8u);
          }
          BOOL v28 = 0;
          goto LABEL_70;
        }
LABEL_45:
        unsigned int v20 = *v24;

        if (!v20 || v23 + 4 > v4) {
          goto LABEL_54;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = v28;
        id v36 = objc_alloc(MEMORY[0x1E4F1CA58]);
        id v38 = objc_msgSend(v36, "initWithCapacity:", objc_msgSend(objc_getProperty(v35, v37, 24, 1), "length") + 32);
        [v38 appendBytes:v3 length:28];
        [v38 appendBytes:v24 length:4];
        objc_msgSend(v38, "appendData:", objc_getProperty(v35, v39, 24, 1));
        objc_setProperty_atomic(v35, v40, v38, 24);
        v35[4].isa = (Class)*v24;
        if (v5) {
          objc_setProperty_atomic((id)v5, v41, v35, 48);
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (v5 && (isKindOfClass & 1) != 0)
        {
          *(unsigned char *)(v5 + 9) = 1;
          *(_DWORD *)(v5 + 16) = v35[5].isa;
          *(_DWORD *)(v5 + 20) = HIDWORD(v35[5].isa);
        }

        goto LABEL_54;
      }
      if (!v55)
      {
        uint64_t v32 = ne_log_obj();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        if (v26 < 0)
        {
          if (v33)
          {
            int v51 = *(unsigned __int8 *)(v3 + 18);
            *(_DWORD *)buf = v53;
            v60[0] = v20;
            LOWORD(v60[1]) = 1024;
            *(_DWORD *)((char *)&v60[1] + 2) = v51;
            _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "Unencrypted critical payload type %u is not permitted for packet type %u", buf, 0xEu);
          }
LABEL_70:
          id v2 = v54;

          goto LABEL_10;
        }
        if (v33)
        {
          int v34 = *(unsigned __int8 *)(v3 + 18);
          *(_DWORD *)buf = v53;
          v60[0] = v20;
          LOWORD(v60[1]) = 1024;
          *(_DWORD *)((char *)&v60[1] + 2) = v34;
          _os_log_error_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_ERROR, "Unencrypted payload type %u is not permitted for packet type %u", buf, 0xEu);
        }
        goto LABEL_44;
      }
      if (v5 && objc_getProperty((id)v5, v29, 80, 1))
      {
        uint64_t v32 = objc_msgSend(objc_getProperty((id)v5, v30, 80, 1), "arrayByAddingObject:", v28);
      }
      else
      {
        id v57 = v28;
        uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v57, 1, v53);
        if (!v5)
        {
LABEL_44:

          goto LABEL_45;
        }
      }
      objc_setProperty_atomic((id)v5, v31, v32, 80);
      goto LABEL_44;
    }
LABEL_54:
    if (v5)
    {
      id v43 = objc_getProperty((id)v5, v21, 80, 1);
      if (v43)
      {

LABEL_58:
        objc_msgSend((id)v5, "filloutPayloads", v53);
LABEL_59:
        id v2 = v54;
        goto LABEL_11;
      }
      if (objc_getProperty((id)v5, v44, 48, 1)) {
        goto LABEL_58;
      }
    }
    id v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v48 = "Cannot parse packet, no acceptable payloads found";
      v49 = v45;
      uint32_t v50 = 2;
LABEL_72:
      _os_log_error_impl(&dword_19DDAF000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    }
LABEL_61:

    uint64_t v5 = 0;
    goto LABEL_59;
  }
  uint64_t v5 = ne_log_obj();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    int v47 = *(unsigned __int8 *)(v3 + 17);
    *(_DWORD *)buf = 67109120;
    v60[0] = v47;
    objc_super v6 = "Cannot parse packet, unknown version (%x)";
LABEL_66:
    SEL v7 = v5;
    uint32_t v8 = 8;
    goto LABEL_67;
  }
LABEL_10:

  uint64_t v5 = 0;
LABEL_11:

  return v5;
}

- (uint64_t)processDecryptedPacketForIKESA:(unsigned char *)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v36 = 0;
    goto LABEL_47;
  }
  if ((a1[8] & 1) == 0)
  {
    SEL v37 = ne_log_obj();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    LODWORD(v54.receiver) = 136315138;
    *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
    id v45 = "%s called with null self.decrypted";
    goto LABEL_52;
  }
  id Property = objc_getProperty(a1, v3, 48, 1);
  if (Property && objc_getProperty(Property, v6, 16, 1))
  {
    if (v4)
    {
      id v8 = objc_getProperty(a1, v7, 48, 1);
      if (v8) {
        id v8 = objc_getProperty(v8, v9, 16, 1);
      }
      SEL v10 = v8;
      unsigned int v11 = [v10 length];
      int v47 = v10;
      uint64_t v50 = [v10 bytes];
      int v13 = objc_getProperty(a1, v12, 48, 1);
      if (v13)
      {
        unint64_t v14 = v13[4];
        if (v14)
        {
          unint64_t v49 = v11;
          if (v11 >= 4uLL)
          {
            uint64_t v15 = 0;
            int v16 = 0;
            id v46 = v4;
            unsigned int v48 = v11;
            while (1)
            {
              char v17 = (unsigned __int8 *)(v50 + v15);
              uint64_t v18 = bswap32(*(unsigned __int16 *)(v50 + v15 + 2)) >> 16;
              if (v18 <= 3)
              {
                id v38 = ne_log_obj();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_43;
                }
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                SEL v39 = "Bad payload length too short (%u)";
LABEL_41:
                SEL v40 = v38;
                uint32_t v41 = 8;
                goto LABEL_54;
              }
              uint64_t v15 = (v16 + v18);
              if (v15 > v11)
              {
                id v38 = ne_log_obj();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_43;
                }
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                SEL v39 = "Bad payload length too long (%u)";
                goto LABEL_41;
              }
              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v17 + 4 length:v18 - 4];
              if (v14 == 47 && (a1[10] & 1) != 0)
              {
                unsigned int v20 = [NEIKEv2ResponseConfigPayload alloc];
                id v22 = objc_getProperty(v4, v21, 88, 1);
                uint64_t v23 = [v22 configurationRequest];
                id v24 = v19;
                id v25 = v23;
                if (v20)
                {
                  v54.receiver = v20;
                  v54.super_class = (Class)NEIKEv2ResponseConfigPayload;
                  int v26 = (NEIKEv2ResponseConfigPayload *)objc_msgSendSuper2(&v54, sel_init);
                  unsigned int v20 = v26;
                  if (v26)
                  {
                    objc_setProperty_atomic(v26, v27, v24, 16);
                    v20->super.super._isInbound = 1;
                    objc_setProperty_atomic(v20, v28, v25, 32);
                    if (![(NEIKEv2ResponseConfigPayload *)v20 parsePayloadData])
                    {
                      uint64_t v29 = ne_log_obj();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        long long v53 = v20;
                        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Failed to parse payload data for %@", buf, 0xCu);
                      }

                      unsigned int v20 = 0;
                      id v4 = v46;
                    }
                  }
                }

                unsigned int v11 = v48;
                if (v20)
                {
LABEL_23:
                  if (objc_getProperty(a1, v30, 80, 1))
                  {
                    objc_msgSend(objc_getProperty(a1, v31, 80, 1), "arrayByAddingObject:", v20);
                  }
                  else
                  {
                    int v51 = v20;
                    [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
                  uint64_t v32 = };
                  objc_setProperty_atomic(a1, v33, v32, 80);

                  goto LABEL_30;
                }
              }
              else
              {
                unsigned int v20 = (NEIKEv2ResponseConfigPayload *)+[NEIKEv2Payload createPayloadWithType:fromData:]((uint64_t)NEIKEv2Payload, v14, v19);
                if (v20) {
                  goto LABEL_23;
                }
              }
              if ((char)v17[1] < 0)
              {
                id v43 = ne_log_obj();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v54.receiver) = 67109120;
                  HIDWORD(v54.receiver) = v14;
                  _os_log_error_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_ERROR, "Failed to parse critical payload type %u", (uint8_t *)&v54, 8u);
                }

                goto LABEL_44;
              }
LABEL_30:
              unint64_t v14 = *v17;

              if (v14)
              {
                int v16 = v15;
                if (v15 + 4 <= v49) {
                  continue;
                }
              }
              break;
            }
          }
        }
      }
      a1[9] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([(NEIKEv2IntermediatePacket *)a1 authenticatedData],
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            !v35))
      {
        id v38 = ne_log_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v54.receiver) = 0;
          SEL v39 = "Failed to get authenticated data for IKE_INTERMEDIATE";
          SEL v40 = v38;
          uint32_t v41 = 2;
LABEL_54:
          _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, v39, (uint8_t *)&v54, v41);
        }
LABEL_43:

LABEL_44:
        uint64_t v36 = 0;
      }
      else
      {
        objc_setProperty_atomic(a1, v34, 0, 48);
        [a1 filloutPayloads];
        uint64_t v36 = 1;
      }
      SEL v37 = v47;
      goto LABEL_46;
    }
    SEL v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v54.receiver) = 136315138;
      *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
      id v45 = "%s called with null ikeSA";
      goto LABEL_52;
    }
  }
  else
  {
    SEL v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v54.receiver) = 136315138;
      *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
      id v45 = "%s called with null self.encryptedPayload.payloadData";
LABEL_52:
      _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, v45, (uint8_t *)&v54, 0xCu);
    }
  }
LABEL_36:
  uint64_t v36 = 0;
LABEL_46:

LABEL_47:
  return v36;
}

- (uint64_t)processReceivedPacketForIKESA:(unsigned char *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = 1;
  id v6 = objc_getProperty(a1, v5, 48, 1);
  id v8 = v6;
  if ((a1[8] & 1) != 0 || !v6) {
    goto LABEL_19;
  }
  if (v3) {
    id Property = objc_getProperty(v3, v7, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;

  if (!v10)
  {
LABEL_18:
    uint64_t v4 = 0;
    goto LABEL_19;
  }
  if (v3) {
    id v12 = objc_getProperty(v3, v11, 208, 1);
  }
  else {
    id v12 = 0;
  }
  id v14 = v12;
  if (!v14)
  {
    uint64_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[NEIKEv2EncryptedPayload decryptPayloadsUsingSecurityContext:]";
      _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "%s called with null securityContext", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_17;
  }
  id v15 = objc_getProperty(v8, v13, 16, 1);
  char v17 = objc_msgSend(v14, "decryptPayloadData:authenticatedHeaders:", v15, objc_getProperty(v8, v16, 24, 1));

  if (!v17)
  {
    unsigned int v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "Failed to decrypt packet", (uint8_t *)&v22, 2u);
    }

    uint64_t v19 = 0;
LABEL_17:

    goto LABEL_18;
  }
  objc_setProperty_atomic(v8, v18, v17, 16);

  a1[8] = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = -[NEIKEv2Packet processDecryptedPacketForIKESA:](a1, v3);
  }
LABEL_19:

  return v4;
}

- (void)copyNotification:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_getProperty(a1, a2, 64, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8) {
          id v9 = (const char *)v8[3];
        }
        else {
          id v9 = 0;
        }
        if (v9 == a2)
        {
          unsigned int v11 = v8;
          goto LABEL_15;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }
  unsigned int v11 = 0;
LABEL_15:

  return v11;
}

- (uint64_t)hasNotification:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_getProperty(a1, a2, 64, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (v8) {
          uint64_t v8 = *(void *)(v8 + 24);
        }
        if ((const char *)v8 == a2)
        {
          uint64_t v9 = 1;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_14:

  return v9;
}

- (uint64_t)hasErrors
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 64, 1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && (unint64_t)(*(void *)(v6 + 24) - 1) < 0x3FFF)
        {
          uint64_t v3 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)addNotifyPayload:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    if (objc_getProperty(a1, v3, 64, 1))
    {
      uint64_t v6 = objc_msgSend(objc_getProperty(a1, v5, 64, 1), "arrayByAddingObject:", v4);
    }
    else
    {
      id v11 = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    }
    long long v8 = v6;
    objc_setProperty_atomic(a1, v7, v6, 64);
  }
  else
  {
    long long v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet addNotifyPayload:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null notifyPayload", buf, 0xCu);
    }
  }
  return v4 != 0;
}

- (BOOL)addNotification:(void *)a3 data:
{
  id v4 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, a2, a3);
  BOOL v5 = -[NEIKEv2Packet addNotifyPayload:](a1, v4);

  return v5;
}

@end