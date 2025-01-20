@interface NEIKEv2Server
- (id)getNextViableServerAddressForPath:(void *)a1;
- (id)getViableServerAddressForPath:(void *)a1;
- (void)dealloc;
- (void)resetPathProxyState;
- (void)setServerResolvedAddress:(void *)a3 path:;
- (void)startRedirectTimer;
- (void)stopRedirectTimer;
@end

@implementation NEIKEv2Server

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectTimer, 0);
  objc_storeStrong((id *)&self->_pathProxyConnectedRemoteEndpointString, 0);
  objc_storeStrong((id *)&self->_pathProxyEndpoint, 0);
  objc_storeStrong((id *)&self->_additionalIPv6ServerAddresses, 0);
  objc_storeStrong((id *)&self->_additionalIPv4ServerAddresses, 0);
  objc_storeStrong((id *)&self->_redirectedFromAddress, 0);
  objc_storeStrong((id *)&self->_resolvedAddressList, 0);

  objc_storeStrong((id *)&self->_serverAddress, 0);
}

- (void)dealloc
{
  -[NEIKEv2Server stopRedirectTimer]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Server;
  [(NEIKEv2Server *)&v3 dealloc];
}

- (void)stopRedirectTimer
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      source = v2;
      if (dispatch_source_testcancel(v2))
      {
        objc_super v3 = source;
      }
      else
      {
        dispatch_source_cancel(source);
        objc_super v3 = *(NSObject **)(a1 + 72);
      }
      *(void *)(a1 + 72) = 0;
    }
  }
}

- (void)setServerResolvedAddress:(void *)a3 path:
{
  *(void *)&v27[5] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    v7 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]((uint64_t)NEIKEv2AddressList, v5, a3);
    if (!v7)
    {
      v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v26 = 136315138;
        *(void *)v27 = "-[NEIKEv2Server setServerResolvedAddress:path:]";
        _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "%s called with null normalizedAddress", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_20;
    }
    if (!objc_getProperty(a1, v6, 24, 1))
    {
      v9 = objc_alloc_init(NEIKEv2AddressList);
      objc_setProperty_atomic(a1, v10, v9, 24);
    }
    id Property = objc_getProperty(a1, v8, 24, 1);
    CFStringRef v12 = (const __CFString *)v5;
    v13 = v12;
    if (!Property)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (!v12)
    {
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        int v26 = 136315138;
        *(void *)v27 = "-[NEIKEv2AddressList addAddressToList:]";
        _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_19;
    }
    unsigned int v14 = NEGetAddressFamilyFromString(v12);
    if (v14 == 30)
    {
      ptrdiff_t v16 = 8;
      if (objc_getProperty(Property, v15, 8, 1)) {
        goto LABEL_14;
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      ptrdiff_t v16 = 8;
      v20 = Property;
      v21 = v19;
      ptrdiff_t v22 = 8;
    }
    else
    {
      if (v14 != 2)
      {
        unsigned int v24 = v14;
        v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int v26 = 67109378;
          v27[0] = v24;
          LOWORD(v27[1]) = 2112;
          *(void *)((char *)&v27[1] + 2) = v13;
          _os_log_error_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_ERROR, "Bad address family %d for address %@", (uint8_t *)&v26, 0x12u);
        }

        v23 = 0;
        goto LABEL_19;
      }
      ptrdiff_t v16 = 16;
      if (objc_getProperty(Property, v15, 16, 1))
      {
LABEL_14:
        v23 = objc_getProperty(Property, v17, v16, 1);
        if (([v23 containsObject:v13] & 1) == 0) {
          [v23 addObject:v13];
        }
LABEL_19:

        goto LABEL_20;
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      ptrdiff_t v16 = 16;
      v20 = Property;
      v21 = v19;
      ptrdiff_t v22 = 16;
    }
    objc_setProperty_atomic(v20, v18, v21, v22);

    goto LABEL_14;
  }
LABEL_21:
}

- (void)startRedirectTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[NEIKEv2Server stopRedirectTimer]((uint64_t)a1);
    if (objc_getProperty(a1, v2, 32, 1))
    {
      objc_super v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "-[NEIKEv2Server startRedirectTimer]";
        _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "%s: Starting timer\n", buf, 0xCu);
      }

      dispatch_time_t v4 = dispatch_time(0, 300000000000);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__NEIKEv2Server_startRedirectTimer__block_invoke;
      v7[3] = &unk_1E59932C0;
      v7[4] = a1;
      uint64_t v5 = NERepeatingEventCreate(MEMORY[0x1E4F14428], v4, 0, 300000, 150000, 0, v7, 0);
      v6 = (void *)a1[9];
      a1[9] = v5;
    }
  }
}

void __35__NEIKEv2Server_startRedirectTimer__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  SEL v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NEIKEv2Server startRedirectTimer]_block_invoke";
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "%s: timeout\n", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(_DWORD *)(v3 + 12) = 0;
  }
}

- (void)resetPathProxyState
{
  if (a1)
  {
    a1[8] = 0;
    objc_setProperty_atomic(a1, a2, 0, 56);
    objc_setProperty_atomic(a1, v3, 0, 64);
  }
}

- (id)getNextViableServerAddressForPath:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    id Property = objc_getProperty(a1, v4, 24, 1);
    id v6 = v3;
    v7 = v6;
    if (Property)
    {
      if ([v6 supportsIPv6])
      {
        unint64_t v9 = Property[3];
        if (v9 < objc_msgSend(objc_getProperty(Property, v8, 8, 1), "count"))
        {
          v11 = objc_msgSend(objc_getProperty(Property, v10, 8, 1), "objectAtIndex:", Property[3]);
          ++Property[3];
LABEL_21:

          unsigned int v24 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]((uint64_t)NEIKEv2AddressList, v11, v7);
          objc_setProperty_atomic(a1, v25, v24, 16);

          goto LABEL_22;
        }
      }
      if ([v7 supportsIPv4])
      {
        unint64_t v13 = Property[4];
        if (v13 < objc_msgSend(objc_getProperty(Property, v12, 16, 1), "count"))
        {
          v11 = objc_msgSend(objc_getProperty(Property, v14, 16, 1), "objectAtIndex:", Property[4]);
          ++Property[4];
          goto LABEL_21;
        }
      }
      if ([v7 supportsIPv6])
      {
        unint64_t v16 = Property[4];
        if (v16 < objc_msgSend(objc_getProperty(Property, v15, 16, 1), "count"))
        {
          *(void *)buf = 0;
          v17 = [v7 scopedInterface];
          if (v17) {
            [v7 scopedInterface];
          }
          else {
          v18 = [v7 interface];
          }
          [v18 interfaceIndex];

          int v19 = nw_nat64_copy_prefixes();
          if (v19)
          {
            int v21 = v19;
            ptrdiff_t v22 = objc_msgSend(objc_getProperty(Property, v20, 16, 1), "objectAtIndex:", Property[4]);
            ++Property[4];
            v11 = +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]((uint64_t)NEIKEv2AddressList, v22, *(uint64_t *)buf, v21);
            if (*(void *)buf) {
              free(*(void **)buf);
            }

            goto LABEL_21;
          }
        }
      }
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if ([v7 supportsIPv4]) {
          v27 = "yes";
        }
        else {
          v27 = "no";
        }
        if ([v7 supportsIPv6]) {
          v28 = "yes";
        }
        else {
          v28 = "no";
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v30 = 2080;
        v31 = v28;
        _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, "Failed to find suitable address, path supports IPv4 %s IPv6 %s", buf, 0x16u);
      }
    }
    v11 = 0;
    goto LABEL_21;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (id)getViableServerAddressForPath:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    if (objc_getProperty(a1, v3, 56, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "hostname");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      a1 = v6;
      goto LABEL_15;
    }
    id Property = objc_getProperty(a1, v5, 16, 1);
    if ((+[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, Property) & 3) != 1) {
      id v9 = -[NEIKEv2Server getNextViableServerAddressForPath:](a1, v4);
    }
    if (objc_getProperty(a1, v8, 16, 1))
    {
      CFStringRef v11 = (const __CFString *)objc_getProperty(a1, v10, 16, 1);
      unsigned int v12 = NEGetAddressFamilyFromString(v11);
      if ([v4 supportsIPv4] && (objc_msgSend(v4, "supportsIPv6") & 1) != 0
        || [v4 supportsIPv4] && v12 == 2
        || [v4 supportsIPv6] && v12 == 30)
      {
        id v6 = objc_getProperty(a1, v13, 16, 1);
        goto LABEL_14;
      }
      if ([v4 supportsIPv4] && objc_getProperty(a1, v16, 40, 1))
      {
        v18 = a1;
        ptrdiff_t v19 = 40;
LABEL_28:
        objc_msgSend(objc_getProperty(v18, v17, v19, 1), "objectAtIndexedSubscript:", 0);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if ([v4 supportsIPv6])
      {
        if (objc_getProperty(a1, v20, 48, 1))
        {
          v18 = a1;
          ptrdiff_t v19 = 48;
          goto LABEL_28;
        }
        *(void *)buf = 0;
        int v21 = [v4 scopedInterface];
        if (v21) {
          [v4 scopedInterface];
        }
        else {
        ptrdiff_t v22 = [v4 interface];
        }
        [v22 interfaceIndex];

        int v23 = nw_nat64_copy_prefixes();
        if (v23)
        {
          int v25 = v23;
          id v26 = objc_getProperty(a1, v24, 16, 1);
          a1 = +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]((uint64_t)NEIKEv2AddressList, v26, *(uint64_t *)buf, v25);
          goto LABEL_15;
        }
      }
    }
    else
    {
      v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "failed to find viable server", buf, 2u);
      }
    }
    a1 = 0;
  }
LABEL_15:

  return a1;
}

@end