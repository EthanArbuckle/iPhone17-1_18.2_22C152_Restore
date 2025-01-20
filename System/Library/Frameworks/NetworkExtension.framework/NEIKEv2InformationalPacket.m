@interface NEIKEv2InformationalPacket
+ (NSObject)createDeleteResponse:(void *)a3 child:;
+ (id)copyTypeDescription;
+ (id)createInformationalResponse:(void *)a3 ikeSA:;
+ (unint64_t)exchangeType;
- (uint64_t)isDeleteChild;
- (uint64_t)isDeleteIKE;
- (uint64_t)isMOBIKE;
- (uint64_t)validateDeleteChild:(uint64_t)a1;
- (uint64_t)validateUpdateAddresses:(void *)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2InformationalPacket

+ (NSObject)createDeleteResponse:(void *)a3 child:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5)
  {
    v6 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2InformationalPacket alloc], v4);
    if (v6)
    {
      v7 = objc_alloc_init(NEIKEv2DeletePayload);
      p_super = &v7->super.super;
      if (v7) {
        v7->_protocol = 3;
      }
      id v17 = v5;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      if (p_super) {
        objc_setProperty_atomic(p_super, v9, v10, 32);
      }

      if (-[NEIKEv2Payload isValid]((uint64_t)p_super))
      {
        v16 = p_super;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
        objc_setProperty_atomic(v6, v12, v11, 88);

        v13 = v6;
LABEL_12:

        goto LABEL_13;
      }
      v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
        _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
      }
    }
    else
    {
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
      }
    }
    v13 = 0;
    goto LABEL_12;
  }
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
    _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null childSPI", buf, 0xCu);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (uint64_t)validateDeleteChild:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v6 = objc_getProperty((id)a1, v4, 88, 1);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v6);
            }
            SEL v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v12)
            {
              if (v12[3] == 3)
              {
                id v13 = objc_getProperty(v12, v8, 32, 1);
                int v14 = objc_msgSend(v13, "containsObject:", v5, (void)v16);

                if (v14)
                {

                  a1 = 1;
                  goto LABEL_16;
                }
              }
            }
          }
          uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      a1 = 0;
    }
    else
    {
      a1 = [(NEIKEv2InformationalPacket *)(void *)a1 isDeleteChild];
    }
  }
LABEL_16:

  return a1;
}

+ (id)createInformationalResponse:(void *)a3 ikeSA:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v7 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2InformationalPacket alloc], v4);
  if (!v7)
  {
    long long v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
    }
    goto LABEL_41;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  if (v4) {
    id Property = objc_getProperty(v4, v6, 64, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (v15) {
          uint64_t v15 = *(void *)(v15 + 24);
        }
        v12 |= (v15 & 0xFFFE) == 16388;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }
  else
  {
    char v12 = 0;
  }

  if (!v5 || (v5[18] & 1) == 0 || !-[NEIKEv2Packet hasNotification:](v4, (const char *)0xA08D))
  {
LABEL_25:
    if ((v12 & 1) == 0)
    {
LABEL_33:
      id v38 = v7;
      goto LABEL_42;
    }
    v24 = [(NEIKEv2IKESA *)v5 initiatorSPI];
    v27 = [(NEIKEv2IKESA *)v5 responderSPI];
    if (v5) {
      id v28 = objc_getProperty(v5, v26, 64, 1);
    }
    else {
      id v28 = 0;
    }
    id v29 = v28;
    long long v16 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v24, v27, v29);

    if (-[NEIKEv2Packet addNotification:data:](v7, 0x4004uLL, v16))
    {
      v31 = [(NEIKEv2IKESA *)v5 initiatorSPI];
      v34 = [(NEIKEv2IKESA *)v5 responderSPI];
      if (v5) {
        id v35 = objc_getProperty(v5, v33, 72, 1);
      }
      else {
        id v35 = 0;
      }
      id v36 = v35;
      v37 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v31, v34, v36);

      if (-[NEIKEv2Packet addNotification:data:](v7, 0x4005uLL, v37))
      {

        goto LABEL_33;
      }
      v40 = ne_log_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed", buf, 2u);
      }

      goto LABEL_40;
    }
    v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v39 = "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed";
LABEL_46:
      _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, v39, buf, 2u);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  long long v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v42 = objc_msgSend(v4, "copyShortDescription", (void)v43);
    *(_DWORD *)buf = 138412290;
    v48 = v42;
    _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "%@ received sending notify payload request", buf, 0xCu);
  }
  id v20 = objc_getProperty(v5, v19, 88, 1);
  uint64_t v21 = [v20 IMEI];
  long long v16 = [v21 dataUsingEncoding:4];

  if (!v16
    || (v22 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0xA08DuLL, v16), BOOL v23 = -[NEIKEv2Packet addNotifyPayload:](v7, v22), v22, v23))
  {

    goto LABEL_25;
  }
  v37 = ne_log_obj();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v39 = "[packet addNotifyPayload:notifyPayload] failed";
    goto LABEL_46;
  }
LABEL_40:

LABEL_41:
  id v38 = 0;
LABEL_42:

  return v38;
}

- (uint64_t)validateUpdateAddresses:(void *)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v5 = v3;
  if (!a1)
  {
    uint64_t v36 = 0;
    goto LABEL_39;
  }
  if (!v3)
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NEIKEv2InformationalPacket(Exchange) validateUpdateAddresses:]";
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
    }
LABEL_22:
    uint64_t v36 = 0;
    goto LABEL_38;
  }
  if ([(NEIKEv2Packet *)a1 hasErrors])
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v7 = objc_getProperty(a1, v6, 64, 1);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = *(__CFString **)(*((void *)&v53 + 1) + 8 * i);
          if (v12 && (unint64_t)(v12->length - 1) <= 0x3FFE)
          {
            v34 = -[NEIKEv2NotifyPayload copyError](v12);
            id v35 = ne_log_obj();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v52 = (char *)objc_msgSend(a1, "copyShortDescription", (void)v53);
              *(_DWORD *)buf = 138412546;
              v58 = v52;
              __int16 v59 = 2112;
              v60 = v34;
              _os_log_error_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_ERROR, "%@ Update addresses received notify error %@", buf, 0x16u);
            }
            -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v34);

            goto LABEL_22;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v7 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4004);
  uint64_t v13 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4005);
  uint64_t v15 = v13;
  if (v7 && v13)
  {
    long long v16 = [(NEIKEv2IKESA *)v5 initiatorSPI];
    long long v18 = [(NEIKEv2IKESA *)v5 responderSPI];
    id v20 = objc_getProperty(v5, v19, 72, 1);
    uint64_t v21 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v16, v18, v20);

    BOOL v23 = [(NEIKEv2IKESA *)v5 initiatorSPI];
    uint64_t v25 = [(NEIKEv2IKESA *)v5 responderSPI];
    id v27 = objc_getProperty(v5, v26, 64, 1);
    id v28 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v23, (void *)v25, v27);

    id v30 = objc_getProperty(v7, v29, 32, 1);
    LOBYTE(v25) = [v21 isEqualToData:v30];

    if (v25)
    {
      v5[15] = 0;
      v31 = ne_log_obj();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      v32 = (char *)[a1 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      v33 = "%@ Detected no incoming NAT";
    }
    else
    {
      v5[15] = 1;
      v31 = ne_log_obj();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      v32 = (char *)[a1 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      v33 = "%@ Detected incoming NAT";
    }
    _os_log_debug_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_DEBUG, v33, buf, 0xCu);

LABEL_24:
    id v38 = objc_getProperty(v15, v37, 32, 1);
    char v39 = [v28 isEqualToData:v38];

    if (v39)
    {
      v5[14] = 0;
      v40 = ne_log_obj();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      v41 = (char *)[a1 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v58 = v41;
      v42 = "%@ Detected no outgoing NAT";
    }
    else
    {
      v5[14] = 1;
      v40 = ne_log_obj();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      v41 = (char *)[a1 copyShortDescription];
      *(_DWORD *)buf = 138412290;
      v58 = v41;
      v42 = "%@ Detected outgoing NAT";
    }
    _os_log_debug_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);

LABEL_28:
    id v44 = objc_getProperty(v5, v43, 80, 1);
    if ([v44 disableSwitchToNATTPorts])
    {
    }
    else
    {
      id v47 = objc_getProperty(v5, v45, 88, 1);
      if ([v47 negotiateMOBIKE] & 1) != 0 || (v5[15])
      {
      }
      else
      {
        char v48 = v5[14];

        if ((v48 & 1) == 0) {
          goto LABEL_36;
        }
      }
      [(NEIKEv2IKESA *)(uint64_t)v5 switchToNATTraversalPorts];
    }
LABEL_36:
    id v49 = objc_getProperty(v15, v46, 32, 1);
    objc_setProperty_atomic(v5, v50, v49, 496);
  }
  uint64_t v36 = 1;
LABEL_38:

LABEL_39:
  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_deletes, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self) {
    self = (NEIKEv2InformationalPacket *)objc_getProperty(self, a2, 80, 1);
  }
  id v3 = self;
  uint64_t v4 = [(NEIKEv2InformationalPacket *)v3 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              uint64_t v13 = objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              goto LABEL_24;
            }
            id v27 = v8;
            uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v27, 1, (void)v21);
            if (v2)
            {
LABEL_24:
              long long v18 = v2;
              SEL v19 = v13;
              ptrdiff_t v20 = 64;
              goto LABEL_29;
            }
LABEL_30:

            goto LABEL_31;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v2 && objc_getProperty(v2, v14, 88, 1))
            {
              uint64_t v13 = objc_msgSend(objc_getProperty(v2, v15, 88, 1), "arrayByAddingObject:", v8);
            }
            else
            {
              SEL v26 = v8;
              uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v26, 1, (void)v21);
              if (!v2) {
                goto LABEL_30;
              }
            }
            ptrdiff_t v20 = 88;
            long long v18 = v2;
            SEL v19 = v13;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_31;
            }
            if (v2 && objc_getProperty(v2, v16, 56, 1))
            {
              uint64_t v13 = objc_msgSend(objc_getProperty(v2, v17, 56, 1), "arrayByAddingObject:", v8);
            }
            else
            {
              uint64_t v25 = v8;
              uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1, (void)v21);
              if (!v2) {
                goto LABEL_30;
              }
            }
            long long v18 = v2;
            SEL v19 = v13;
            ptrdiff_t v20 = 56;
          }
LABEL_29:
          objc_setProperty_atomic(v18, v12, v19, v20);
          goto LABEL_30;
        }
        if (v2) {
          objc_setProperty_atomic(v2, v9, v8, 96);
        }
LABEL_31:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NEIKEv2InformationalPacket *)v3 countByEnumeratingWithState:&v21 objects:v28 count:16];
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
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 88, 1));
    if (objc_getProperty(self, v5, 96, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 96, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80);
  }
  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 37;
}

+ (id)copyTypeDescription
{
  return @"INFORMATIONAL";
}

- (uint64_t)isDeleteIKE
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 88, 1);
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
        if (v6 && *(void *)(v6 + 24) == 1)
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

- (uint64_t)isMOBIKE
{
  if ((-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4011) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400F) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400D) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400E) & 1) != 0)
  {
    return 1;
  }

  return -[NEIKEv2Packet hasNotification:](a1, (const char *)0x4010);
}

- (uint64_t)isDeleteChild
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 88, 1);
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
        if (v6 && *(void *)(v6 + 24) == 3)
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

@end