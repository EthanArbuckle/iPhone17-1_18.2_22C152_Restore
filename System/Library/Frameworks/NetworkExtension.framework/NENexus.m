@interface NENexus
- (BOOL)handleRequestNexusFromClient:(id)a3;
- (BOOL)isAsserted;
- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7;
- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7 netifRingSize:(unsigned int)a8 kernelPipeTxRingSize:(unsigned int)a9 kernelPipeRxRingSize:(unsigned int)a10 execUUID:(id)a11;
- (NENexus)initWithName:(id)a3 delegate:(id)a4;
- (NEVirtualInterface_s)virtualInterface;
- (NSArray)dnsServerAddresses;
- (NSArray)localAddresses;
- (NSString)interfaceName;
- (NSString)name;
- (unint64_t)availability;
- (unint64_t)level;
- (unint64_t)maximumTransmissionUnit;
- (void)cancel;
- (void)closeFlowWithClientIdentifier:(id)a3;
- (void)dealloc;
- (void)handleAssertFromClient:(id)a3;
- (void)handleStartFromClient:(id)a3;
- (void)handleUnassertFromClient:(id)a3;
- (void)rejectFlowWithClientIdentifier:(void *)a1;
- (void)setAsserted:(BOOL)a3;
- (void)setAvailability:(unint64_t)a3;
- (void)setDnsServerAddresses:(id)a3;
- (void)setLocalAddresses:(id)a3;
- (void)setMaximumTransmissionUnit:(unint64_t)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
@end

@implementation NENexus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelNexusClientFlows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_userNexusClientFlows, 0);
  objc_storeStrong((id *)&self->_userNexusClientCount, 0);
  objc_storeStrong((id *)&self->_userNexusInstances, 0);
  objc_storeStrong((id *)&self->_userNexus, 0);
  objc_storeStrong((id *)&self->_dnsServerAddresses, 0);
  objc_storeStrong((id *)&self->_localAddresses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (unint64_t)maximumTransmissionUnit
{
  return self->_maximumTransmissionUnit;
}

- (NSArray)dnsServerAddresses
{
  return self->_dnsServerAddresses;
}

- (NSArray)localAddresses
{
  return self->_localAddresses;
}

- (void)setAsserted:(BOOL)a3
{
  self->_asserted = a3;
}

- (BOOL)isAsserted
{
  return self->_asserted;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setMaximumTransmissionUnit:(unint64_t)a3
{
  int v3 = a3;
  self->_maximumTransmissionUnit = a3;
  v4 = [(NENexus *)self virtualInterface];

  NEVirtualInterfaceSetMTU((uint64_t)v4, v3);
}

- (void)setDnsServerAddresses:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_dnsServerAddresses, a3);
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = objc_msgSend(v12, "hostname", (void)v15);
            [v6 addObject:v13];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  v14 = [(NENexus *)self virtualInterface];
  NEVirtualInterfaceSetDNSServers((uint64_t)v14, v6);
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v14, 0, 1);
}

- (void)setLocalAddresses:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_localAddresses];
  [v6 minusSet:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:self->_localAddresses];
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  [v8 minusSet:v9];

  objc_storeStrong((id *)&self->_localAddresses, a3);
  uint64_t v10 = [(NENexus *)self virtualInterface];
  if ([v8 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v11 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = [v17 hostname];
            NEVirtualInterfaceRemoveAddress((uint64_t)v10, v18);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v14);
    }

    uint64_t v8 = v11;
  }
  if ([v6 count])
  {
    v30 = v8;
    v31 = v6;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (!v20) {
      goto LABEL_27;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    while (1)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = v24;
          if ([v25 addressFamily] == 2)
          {
            v26 = [v25 hostname];
            uint64_t v27 = (uint64_t)v10;
            CFStringRef v28 = v26;
            CFStringRef v29 = @"255.255.255.255";
            goto LABEL_23;
          }
          if ([v25 addressFamily] == 30)
          {
            v26 = [v25 hostname];
            uint64_t v27 = (uint64_t)v10;
            CFStringRef v28 = v26;
            CFStringRef v29 = @"FFFF:FFFF:FFFF:FFFF::";
LABEL_23:
            NEVirtualInterfaceAddAddressInternal(v27, v28, v29, 0);
          }
          continue;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (!v21)
      {
LABEL_27:

        id v6 = v31;
        uint64_t v8 = v30;
        break;
      }
    }
  }
  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0, 1);
}

- (void)handleUnassertFromClient:(id)a3
{
  id v22 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  objc_sync_enter(v6);
  if (self) {
    id v8 = objc_getProperty(self, v7, 96, 1);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 objectForKeyedSubscript:v22];

  if (v10)
  {
    if ((unint64_t)[v10 unsignedIntegerValue] > 1)
    {
      id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") - 1);
      if (self) {
        id v20 = objc_getProperty(self, v18, 96, 1);
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;
      [v21 setObject:v19 forKeyedSubscript:v22];
    }
    else
    {
      if (self) {
        id v12 = objc_getProperty(self, v11, 96, 1);
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;
      [v13 setObject:0 forKeyedSubscript:v22];

      if ([(NENexus *)self isAsserted])
      {
        id v15 = self ? objc_getProperty(self, v14, 96, 1) : 0;
        id v16 = v15;
        uint64_t v17 = [v16 count];

        if (!v17) {
          [(NENexus *)self setAsserted:0];
        }
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)handleAssertFromClient:(id)a3
{
  id v23 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 96, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  objc_sync_enter(v6);
  if (self) {
    id v8 = objc_getProperty(self, v7, 96, 1);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 objectForKeyedSubscript:v23];

  if (v10)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    if (self) {
      id v13 = objc_getProperty(self, v11, 96, 1);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    [v14 setObject:v12 forKeyedSubscript:v23];
  }
  else
  {
    id v16 = [NSNumber numberWithUnsignedInteger:1];
    if (self) {
      id v17 = objc_getProperty(self, v15, 96, 1);
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;
    [v18 setObject:v16 forKeyedSubscript:v23];

    if (![(NENexus *)self isAsserted])
    {
      id v20 = self ? objc_getProperty(self, v19, 96, 1) : 0;
      id v21 = v20;
      uint64_t v22 = [v21 count];

      if (v22) {
        [(NENexus *)self setAsserted:1];
      }
    }
  }

  objc_sync_exit(v6);
}

- (void)handleStartFromClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F38C18] pathForClientID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 parameters];
    if ([v7 pid])
    {
      id v8 = -[NENexusPathFlow initWithPath:]((id *)[NENexusPathFlow alloc], v6);
      [v8 setState:1];
      if (self) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      else {
        id WeakRetained = 0;
      }
      [WeakRetained handleRequestToActivateNexus:self fromFlow:v8];
    }
    else
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Client has no pid, cannot assign nexus", (uint8_t *)&v11, 2u);
      }
    }
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to get path for client %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
  objc_msgSend(objc_getProperty(self, a2, 128, 1), "setActive:", a3 != 0);
  id Property = objc_getProperty(self, v5, 128, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 32, 1);
  }
  id v8 = Property;
  objc_msgSend(v8, "updateNetworkAgent:", objc_getProperty(self, v9, 128, 1));

  uint64_t v10 = [(NENexus *)self virtualInterface];
  if (v10 && !*((unsigned char *)v10 + 264))
  {
    char v11 = *((unsigned char *)v10 + 312);
    if (((v11 & 1) == 0) == (a3 == 3)) {
      *((unsigned char *)v10 + 312) = v11 & 0xFE | (a3 == 3);
    }
    char v12 = *((unsigned char *)v10 + 312);
    if (((v12 & 2) == 0) == (a3 == 2)) {
      *((unsigned char *)v10 + 312) = v12 & 0xFD | (2 * (a3 == 2));
    }
    char v13 = *((unsigned char *)v10 + 312);
    if (((v13 & 4) == 0) == (a3 == 4)) {
      *((unsigned char *)v10 + 312) = v13 & 0xFB | (4 * (a3 == 4));
    }
    char v14 = *((unsigned char *)v10 + 312);
    if (((v14 & 8) == 0) == a3 < 2) {
      *((unsigned char *)v10 + 312) = v14 & 0xF7 | (8 * (a3 < 2));
    }
  }

  NEVirtualInterfaceUpdateAdHocServiceReturnChanges((uint64_t)v10, 0, 1);
}

- (void)closeFlowWithClientIdentifier:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 88, 1);
    }
    else {
      id Property = 0;
    }
    id v7 = [Property objectForKeyedSubscript:v5];
    SEL v9 = v7;
    if (v7 && (id v10 = objc_getProperty(v7, v8, 24, 1)) != 0)
    {
      char v11 = v10;
      [v9 setState:3];
      if (self)
      {
        objc_msgSend(objc_getProperty(self, v12, 88, 1), "setObject:forKeyedSubscript:", 0, v5);
        id v14 = objc_getProperty(self, v13, 80, 1);
      }
      else
      {
        [0 setObject:0 forKeyedSubscript:v5];
        id v14 = 0;
      }
      id v15 = [v14 objectForKeyedSubscript:v11];
      unint64_t v16 = [v15 unsignedIntegerValue];
      if (v16 > 1)
      {
        v48 = [NSNumber numberWithUnsignedInteger:v16 - 1];
        if (self) {
          id v53 = objc_getProperty(self, v52, 80, 1);
        }
        else {
          id v53 = 0;
        }
        [v53 setObject:v48 forKeyedSubscript:v11];
      }
      else
      {
        if (self)
        {
          objc_msgSend(objc_getProperty(self, v17, 80, 1), "setObject:forKeyedSubscript:", 0, v11);
          id v19 = objc_getProperty(self, v18, 112, 1);
          id v21 = v19;
          if (v19) {
            id v19 = objc_getProperty(v19, v20, 32, 1);
          }
        }
        else
        {
          [0 setObject:0 forKeyedSubscript:v11];
          id v21 = 0;
          id v19 = 0;
        }
        uint64_t v22 = [v19 objectForKeyedSubscript:v11];

        id v23 = (void *)nw_context_copy_implicit_context();
        uint64_t v65 = MEMORY[0x1E4F143A8];
        uint64_t v66 = 3221225472;
        v67 = __41__NENexus_closeFlowWithClientIdentifier___block_invoke;
        v68 = &unk_1E5992328;
        id v69 = v22;
        v70 = v9;
        nw_queue_context_async();

        id v25 = [MEMORY[0x1E4F1CA48] array];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v56 = v9;
        id v54 = v69;
        if (self) {
          id v26 = objc_getProperty(self, v24, 72, 1);
        }
        else {
          id v26 = 0;
        }
        v55 = v15;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v28)
        {
          uint64_t v30 = v28;
          uint64_t v31 = *(void *)v62;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v62 != v31) {
                objc_enumerationMutation(v27);
              }
              uint64_t v33 = *(void *)(*((void *)&v61 + 1) + 8 * v32);
              if (self) {
                id v34 = objc_getProperty(self, v29, 72, 1);
              }
              else {
                id v34 = 0;
              }
              long long v35 = [v34 objectForKeyedSubscript:v33];

              if (v35 == v11) {
                [v25 addObject:v33];
              }
              ++v32;
            }
            while (v30 != v32);
            uint64_t v36 = [v27 countByEnumeratingWithState:&v61 objects:v72 count:16];
            uint64_t v30 = v36;
          }
          while (v36);
        }

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v37 = v25;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v38)
        {
          uint64_t v40 = v38;
          uint64_t v41 = *(void *)v58;
          do
          {
            uint64_t v42 = 0;
            do
            {
              if (*(void *)v58 != v41) {
                objc_enumerationMutation(v37);
              }
              uint64_t v43 = *(void *)(*((void *)&v57 + 1) + 8 * v42);
              if (self) {
                id v44 = objc_getProperty(self, v39, 72, 1);
              }
              else {
                id v44 = 0;
              }
              [v44 setObject:0 forKeyedSubscript:v43];
              ++v42;
            }
            while (v40 != v42);
            uint64_t v45 = [v37 countByEnumeratingWithState:&v57 objects:v71 count:16];
            uint64_t v40 = v45;
          }
          while (v45);
        }

        if (self)
        {
          v48 = v54;
          id v15 = v55;
          if (objc_getProperty(self, v46, 64, 1))
          {
            objc_getProperty(self, v47, 64, 1);
            nw_nexus_close_channel_and_instance();
          }
          id v49 = objc_getProperty(self, v47, 112, 1);
          v51 = v49;
          SEL v9 = v56;
          if (v49) {
            id v49 = objc_getProperty(v49, v50, 32, 1);
          }
        }
        else
        {
          v51 = 0;
          id v49 = 0;
          id v15 = v55;
          SEL v9 = v56;
          v48 = v54;
        }
        [v49 setObject:0 forKeyedSubscript:v11];

        -[NENexus rejectFlowWithClientIdentifier:](self, v5);
      }
    }
    else
    {
      -[NENexus rejectFlowWithClientIdentifier:](self, v5);
    }
  }
  else
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "-[NENexus closeFlowWithClientIdentifier:]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null clientUUID", buf, 0xCu);
    }
  }
}

- (void)rejectFlowWithClientIdentifier:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v15 = 0;
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    uint64_t assign_message = nw_path_create_assign_message();
    if (!assign_message)
    {
      SEL v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", v14, 2u);
      }
      goto LABEL_10;
    }
    id v6 = (void *)assign_message;
    id Property = objc_getProperty(a1, v5, 128, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v8, 32, 1);
    }
    SEL v9 = (void *)MEMORY[0x1E4F1C9B8];
    id v10 = Property;
    char v11 = [v9 dataWithBytes:v6 length:v15];
    char v12 = [v10 assignNexusData:v11 toClient:v3];

    free(v6);
    if ((v12 & 1) == 0)
    {
      SEL v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v14 = 0;
        _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", v14, 2u);
      }
LABEL_10:
    }
  }
}

uint64_t __41__NENexus_closeFlowWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  uint64_t result = [*(id *)(a1 + 40) protocol];
  if (protocol_handler) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(protocol_handler + 24) + 8);
    return v5(protocol_handler, result, 1);
  }
  return result;
}

- (BOOL)handleRequestNexusFromClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F38C18] pathForClientID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 parameters];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x2020000000;
    int v25 = 0;
    int v25 = [v7 pid];
    int v8 = *(_DWORD *)(*((void *)&buf + 1) + 24);
    BOOL v9 = v8 != 0;
    if (!v8)
    {
      id v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Client has no pid, cannot assign nexus", v22, 2u);
      }
      goto LABEL_14;
    }
    id v10 = -[NENexusPathFlow initWithPath:]((id *)[NENexusPathFlow alloc], v6);
    [v10 setState:1];
    if (self)
    {
      id Property = objc_getProperty(self, v11, 112, 1);
      if (!v10)
      {
LABEL_6:
        if (self) {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        }
        else {
          id WeakRetained = 0;
        }
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __40__NENexus_handleRequestNexusFromClient___block_invoke;
        v16[3] = &unk_1E5991AA8;
        id v14 = v10;
        uint64_t v17 = v14;
        SEL v18 = self;
        p_long long buf = &buf;
        id v19 = v4;
        id v20 = v7;
        [WeakRetained acceptNewFlow:v14 fromNexus:self completionHandler:v16];

LABEL_14:
        _Block_object_dispose(&buf, 8);
        goto LABEL_15;
      }
    }
    else
    {
      id Property = 0;
      if (!v10) {
        goto LABEL_6;
      }
    }
    objc_storeWeak(v10 + 4, Property);
    goto LABEL_6;
  }
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to get path for client %@", (uint8_t *)&buf, 0xCu);
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

void __40__NENexus_handleRequestNexusFromClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_73;
  }
  [v4 setState:2];
  int v89 = 0;
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 72, 1);
  }
  id v7 = NSNumber;
  uint64_t v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v9 = Property;
  id v10 = [v7 numberWithInt:v8];
  char v11 = [v9 objectForKeyedSubscript:v10];

  id v13 = *(id *)(a1 + 40);
  if (v11)
  {
    if (v13) {
      id v13 = objc_getProperty(v13, v12, 80, 1);
    }
    id v14 = [v13 objectForKeyedSubscript:v11];
    if (v14)
    {
      unint64_t v16 = v14;
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
    }
    else
    {
      uint64_t v17 = &unk_1EF08D180;
    }
    id v26 = *(id *)(a1 + 40);
    if (v26) {
      id v26 = objc_getProperty(v26, v15, 80, 1);
    }
    [v26 setObject:v17 forKeyedSubscript:v11];
    id v28 = *(id *)(a1 + 40);
    if (v28)
    {
      id v28 = objc_getProperty(v28, v27, 112, 1);
      uint64_t v30 = v28;
      if (v28) {
        id v28 = objc_getProperty(v28, v29, 32, 1);
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    uint64_t v31 = [v28 objectForKeyedSubscript:v11];

    if (v31) {
      nw_channel_get_key();
    }
    uint64_t v32 = (void *)nw_context_copy_implicit_context();
    uint64_t v81 = MEMORY[0x1E4F143A8];
    uint64_t v82 = 3221225472;
    v83 = __40__NENexus_handleRequestNexusFromClient___block_invoke_200;
    v84 = &unk_1E5991A80;
    uint64_t v33 = *(void *)(a1 + 40);
    id v34 = *(void **)(a1 + 48);
    v85 = v31;
    uint64_t v86 = v33;
    id v87 = v34;
    id v88 = *(id *)(a1 + 32);
    id v20 = v31;
    nw_queue_context_async();

    long long v35 = v85;
    goto LABEL_27;
  }
  if (v13) {
    objc_getProperty(v13, v12, 64, 1);
  }
  uint64_t channel_to_new_instance = nw_nexus_create_channel_to_new_instance();
  if (!channel_to_new_instance)
  {
    id v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v92 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_FAULT, "nw_nexus_create_channel_to_new_instance failed", v92, 2u);
    }
    goto LABEL_72;
  }
  id v19 = channel_to_new_instance;
  *(void *)v92 = 0;
  uint64_t v93 = 0;
  [0 getUUIDBytes:v92];
  *(_DWORD *)long long buf = 0;
  if ((nw_channel_get_nexus_instance() & 1) == 0)
  {
    long long v57 = ne_log_obj();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v90 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v57, OS_LOG_TYPE_FAULT, "nw_channel_get_nexus_instance failed", v90, 2u);
    }

    goto LABEL_72;
  }
  nw_channel_get_key();
  id v20 = [*(id *)(a1 + 56) processUUID];
  id v21 = [*(id *)(a1 + 56) effectiveProcessUUID];
  char v22 = [v21 isEqual:v20];

  if (v22)
  {
    if (v20)
    {
      *(void *)v90 = 0;
      uint64_t v91 = 0;
      [v20 getUUIDBytes:v90];
      int v25 = *(void **)(a1 + 40);
      if (v25) {
        objc_getProperty(v25, v24, 64, 1);
      }
    }
    else
    {
      long long v60 = *(void **)(a1 + 40);
      if (v60) {
        objc_getProperty(v60, v23, 64, 1);
      }
    }
  }
  else if (v20)
  {
    *(void *)v90 = 0;
    uint64_t v91 = 0;
    [v20 getUUIDBytes:v90];
    long long v59 = *(void **)(a1 + 40);
    if (v59) {
      objc_getProperty(v59, v58, 64, 1);
    }
  }
  else
  {
    long long v61 = *(void **)(a1 + 40);
    if (v61) {
      objc_getProperty(v61, v23, 64, 1);
    }
  }
  if ((nw_nexus_bind_client_port() & 1) == 0)
  {
    uint64_t v75 = ne_log_obj();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      int v76 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(_DWORD *)v90 = 67109120;
      *(_DWORD *)&v90[4] = v76;
      _os_log_error_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_ERROR, "Failed to bind nexus port for %d", v90, 8u);
    }

LABEL_72:
    id v4 = *(void **)(a1 + 32);
LABEL_73:
    [v4 setState:3];
    goto LABEL_74;
  }
  long long v62 = (void *)nw_context_copy_implicit_context();
  uint64_t v77 = MEMORY[0x1E4F143A8];
  uint64_t v17 = v19;
  id v78 = *(id *)(a1 + 48);
  id v79 = *(id *)(a1 + 32);
  nw_queue_context_async();

  char v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", v92, v77, 3221225472, __40__NENexus_handleRequestNexusFromClient___block_invoke_201, &unk_1E5991A80);
  id v64 = *(id *)(a1 + 40);
  if (v64)
  {
    id v64 = objc_getProperty(v64, v63, 112, 1);
    uint64_t v66 = v64;
    if (v64) {
      id v64 = objc_getProperty(v64, v65, 32, 1);
    }
  }
  else
  {
    uint64_t v66 = 0;
  }
  [v64 setObject:v17 forKeyedSubscript:v11];

  id v68 = *(id *)(a1 + 40);
  if (v68) {
    id v68 = objc_getProperty(v68, v67, 72, 1);
  }
  id v69 = NSNumber;
  uint64_t v70 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v71 = v68;
  v72 = [v69 numberWithInt:v70];
  [v71 setObject:v11 forKeyedSubscript:v72];

  id v74 = *(id *)(a1 + 40);
  if (v74) {
    id v74 = objc_getProperty(v74, v73, 80, 1);
  }
  [v74 setObject:&unk_1EF08D180 forKeyedSubscript:v11];

  long long v35 = v17;
LABEL_27:

  id v37 = *(void **)(a1 + 32);
  if (v37) {
    objc_setProperty_atomic(v37, v36, v11, 24);
  }
  uint64_t v38 = [v3 localEndpoint];
  long long v39 = v38;
  if (v38)
  {
    uint64_t v40 = (void *)[v38 copyCEndpoint];
  }
  else
  {
    uint64_t v41 = [*(id *)(a1 + 40) localAddresses];
    uint64_t v42 = [v41 firstObject];
    uint64_t v40 = (void *)[v42 copyCEndpoint];
  }
  *(void *)v90 = 0;
  *(void *)v92 = 0;
  uint64_t v93 = 0;
  [v11 getUUIDBytes:v92];
  uint64_t assign_message = nw_path_create_assign_message();
  if (assign_message)
  {
    uint64_t v45 = (void *)assign_message;
    id v46 = *(id *)(a1 + 40);
    if (v46)
    {
      id v46 = objc_getProperty(v46, v44, 128, 1);
      v48 = v46;
      if (v46) {
        id v46 = objc_getProperty(v46, v47, 32, 1);
      }
    }
    else
    {
      v48 = 0;
    }
    id v49 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v50 = *(void *)v90;
    id v51 = v46;
    v52 = [v49 dataWithBytes:v45 length:v50];
    LOBYTE(v50) = [v51 assignNexusData:v52 toClient:*(void *)(a1 + 48)];

    free(v45);
    if (v50)
    {
      uint64_t v55 = *(void *)(a1 + 32);
      id v54 = *(id *)(a1 + 40);
      if (v54) {
        id v54 = objc_getProperty(v54, v53, 88, 1);
      }
      [v54 setObject:v55 forKeyedSubscript:*(void *)(a1 + 48)];
      goto LABEL_45;
    }
    v56 = ne_log_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_DEBUG, "assignNexusData:toClient: failed", buf, 2u);
    }
  }
  else
  {
    v56 = ne_log_obj();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_FAULT, "nw_path_create_assign_message failed", buf, 2u);
    }
  }

  [*(id *)(a1 + 32) setState:3];
LABEL_45:

LABEL_74:
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_200(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))(protocol_handler, [*(id *)(a1 + 56) protocol]);
    if (result) {
      return result;
    }
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      id v5 = "Failed to attach network protocol to user channel";
      id v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v5 = "Could not get channel protocol";
      id v6 = buf;
      goto LABEL_9;
    }
  }

  return [*(id *)(a1 + 40) closeFlowWithClientIdentifier:*(void *)(a1 + 48)];
}

uint64_t __40__NENexus_handleRequestNexusFromClient___block_invoke_201(uint64_t a1)
{
  uint64_t protocol_handler = nw_channel_get_protocol_handler();
  if (protocol_handler)
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))(protocol_handler, [*(id *)(a1 + 56) protocol]);
    if (result) {
      return result;
    }
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      id v5 = "Failed to attach network protocol to user channel";
      id v6 = (uint8_t *)&v7;
LABEL_9:
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    }
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v5 = "Could not get channel protocol";
      id v6 = buf;
      goto LABEL_9;
    }
  }

  return [*(id *)(a1 + 40) closeFlowWithClientIdentifier:*(void *)(a1 + 48)];
}

- (NSString)interfaceName
{
  id v3 = [(NENexus *)self virtualInterface];
  if (v3)
  {
    id v3 = [(NENexus *)self virtualInterface];
    if (v3) {
      id v3 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)&v3[8].info + 1, 0x600u);
    }
  }

  return (NSString *)v3;
}

- (void)dealloc
{
  if ([(NENexus *)self virtualInterface])
  {
    CFRelease([(NENexus *)self virtualInterface]);
    [(NENexus *)self setVirtualInterface:0];
  }
  if (self)
  {
    id Property = objc_getProperty(self, v3, 128, 1);
    id v6 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 32, 1);
    }
  }
  else
  {
    id v6 = 0;
    id Property = 0;
  }
  [Property unregisterNetworkAgent];

  v7.receiver = self;
  v7.super_class = (Class)NENexus;
  [(NENexus *)&v7 dealloc];
}

- (void)cancel
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if (self) {
    self = (NENexus *)objc_getProperty(self, a2, 88, 1);
  }
  id v3 = self;
  uint64_t v4 = [(NENexus *)v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NENexus *)v2 closeFlowWithClientIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NENexus *)v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }

  if (!v2)
  {
    CFStringRef v29 = 0;
    id v27 = 0;
    goto LABEL_23;
  }
  id v9 = objc_getProperty(v2, v8, 112, 1);
  id v11 = v9;
  if (!v9) {
    goto LABEL_18;
  }
  id Property = objc_getProperty(v9, v10, 8, 1);

  if (Property)
  {
    id v14 = objc_getProperty(v2, v13, 112, 1);
    id v16 = objc_getProperty(v2, v15, 112, 1);
    SEL v18 = v16;
    if (v16) {
      id v16 = objc_getProperty(v16, v17, 8, 1);
    }
    id v19 = v16;

    id v20 = (void *)nw_context_copy_implicit_context();
    uint64_t v31 = v19;
    uint64_t v32 = v14;
    id v11 = v14;
    id v21 = v19;
    nw_queue_context_async_if_needed();

    id v23 = objc_getProperty(v2, v22, 112, 1);
    if (v23)
    {
      int v25 = v23;
      objc_setProperty_atomic(v23, v24, 0, 8);
    }
LABEL_18:
  }
  if (objc_getProperty(v2, v13, 64, 1))
  {
    objc_getProperty(v2, v26, 64, 1);
    nw_nexus_close();
  }
  id v27 = objc_getProperty(v2, v26, 128, 1);
  CFStringRef v29 = v27;
  if (v27) {
    id v27 = objc_getProperty(v27, v28, 32, 1);
  }
LABEL_23:
  [v27 unregisterNetworkAgent];

  uint64_t v30 = [(NENexus *)v2 virtualInterface];
  if (!v30 || *(void *)(v30 + 256) != 2) {
    NEVirtualInterfaceInvalidate((uint64_t)[(NENexus *)v2 virtualInterface]);
  }
}

void __17__NENexus_cancel__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  nw_channel_close();
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Closed channel for nexus %@ flow manager %@", (uint8_t *)&v5, 0x16u);
  }
}

- (NENexus)initWithName:(id)a3 delegate:(id)a4
{
  uint64_t v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Cannot instantiate an NENexus directly", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)NENexus;
  [(NENexus *)&v8 doesNotRecognizeSelector:a2];

  return 0;
}

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7 netifRingSize:(unsigned int)a8 kernelPipeTxRingSize:(unsigned int)a9 kernelPipeRxRingSize:(unsigned int)a10 execUUID:(id)a11
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v19 = a6;
  id v20 = a11;
  if (!v18)
  {
    v73 = ne_log_obj();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_DWORD *)uuid_t uu = 136315138;
    *(void *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    id v78 = "%s called with null name";
    goto LABEL_78;
  }
  if (!v19)
  {
    v73 = ne_log_obj();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_DWORD *)uuid_t uu = 136315138;
    *(void *)&uu[4] = "-[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipe"
                        "TxRingSize:kernelPipeRxRingSize:execUUID:]";
    id v78 = "%s called with null delegate";
LABEL_78:
    uint64_t v81 = uu;
    uint64_t v82 = v73;
    uint32_t v83 = 12;
    goto LABEL_66;
  }
  v86.receiver = self;
  v86.super_class = (Class)NENexus;
  id v21 = [(NENexus *)&v86 init];
  if (!v21)
  {
    ne_log_obj();
    self = (NENexus *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_19DDAF000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", uu, 2u);
    }
    goto LABEL_49;
  }
  self = v21;
  if (a3 == 2)
  {
    int v22 = 2;
  }
  else
  {
    if (a3 != 4)
    {
      v73 = ne_log_obj();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uuid_t uu = 67109120;
        *(_DWORD *)&uu[4] = a3;
        _os_log_error_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_ERROR, "Nexus level %u is invalid", uu, 8u);
      }
      goto LABEL_48;
    }
    int v22 = 4;
  }
  v21->_level = a3;
  v21->_availability = 0;
  objc_storeStrong((id *)&v21->_name, a4);
  objc_storeWeak((id *)&self->_delegate, v19);
  id v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  if (!v23)
  {
    id v74 = ne_log_obj();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uuid_t uu = 134217984;
      *(void *)&uu[4] = 64;
      _os_log_fault_impl(&dword_19DDAF000, v74, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", uu, 0xCu);
    }

LABEL_47:
    v73 = ne_log_obj();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      id v78 = "setupFlowManager failed";
      goto LABEL_64;
    }
    goto LABEL_48;
  }
  uint64_t v24 = v23;
  v84 = v20;
  if (setupFlowManager_onceToken != -1) {
    dispatch_once(&setupFlowManager_onceToken, &__block_literal_global_17575);
  }
  v24[2] = &NENexusFlowIdentifier;
  v24[3] = &NENexusFlowCallbacks;
  int v25 = objc_alloc_init(NENexusFlowManager);
  objc_setProperty_atomic(self, v26, v25, 112);

  if (!objc_getProperty(self, v27, 112, 1))
  {
    uint64_t v75 = ne_log_obj();
    id v20 = v84;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_FAULT, "[NENexusFlowManager init] failed", uu, 2u);
    }

    free(v24);
    goto LABEL_47;
  }
  v24[5] = objc_getProperty(self, v28, 112, 1);
  id Property = objc_getProperty(self, v29, 112, 1);
  if (Property) {
    Property[2] = v24;
  }
  uint64_t v31 = objc_alloc_init(NEPolicySession);
  objc_setProperty_atomic(self, v32, v31, 120);

  if (!objc_getProperty(self, v33, 120, 1))
  {
    uint64_t v77 = ne_log_obj();
    id v20 = v84;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      _os_log_fault_impl(&dword_19DDAF000, v77, OS_LOG_TYPE_FAULT, "[NEPolicySession init] failed", uu, 2u);
    }

    v73 = ne_log_obj();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    *(_WORD *)uuid_t uu = 0;
    id v78 = "setupPolicySession failed";
    goto LABEL_64;
  }
  if (a3 == 4 || !a7)
  {
    [v18 UTF8String];
    long long v34 = (OS_nw_nexus *)nw_nexus_create();
    userNexus = self->_userNexus;
    self->_userNexus = v34;

    if (!self->_userNexus)
    {
      id v79 = ne_log_obj();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uuid_t uu = 0;
        v80 = "nw_nexus_create failed";
        goto LABEL_73;
      }
LABEL_60:

      v72 = 0;
      id v20 = v84;
      goto LABEL_50;
    }
  }
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  flowManager = self->_flowManager;
  if (flowManager) {
    objc_setProperty_atomic(flowManager, v36, v37, 32);
  }

  long long v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  userNexusInstances = self->_userNexusInstances;
  self->_userNexusInstances = v39;

  uint64_t v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  userNexusClientCount = self->_userNexusClientCount;
  self->_userNexusClientCount = v41;

  uint64_t v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  userNexusClientFlows = self->_userNexusClientFlows;
  self->_userNexusClientFlows = v43;

  uint64_t v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  kernelNexusClientFlows = self->_kernelNexusClientFlows;
  self->_kernelNexusClientFlows = v45;

  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  assertions = self->_assertions;
  self->_assertions = v47;

  id v49 = objc_alloc_init(NENexusAgent);
  agent = self->_agent;
  self->_agent = v49;

  id v51 = self->_agent;
  if (!v51)
  {
    id v79 = ne_log_obj();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      v80 = "[NENexusAgent init] failed";
LABEL_73:
      _os_log_fault_impl(&dword_19DDAF000, v79, OS_LOG_TYPE_FAULT, v80, uu, 2u);
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  [(NENexusAgent *)v51 setActive:0];
  v52 = [MEMORY[0x1E4F29128] UUID];
  [(NENexusAgent *)self->_agent setAgentUUID:v52];

  [(NENexusAgent *)self->_agent setAgentDescription:v18];
  id v53 = self->_agent;
  if (v53 && (v53->_frameType = v22, (id v54 = self->_agent) != 0))
  {
    objc_storeWeak((id *)&v54->_delegate, self);
    uint64_t v55 = self->_agent;
  }
  else
  {
    uint64_t v55 = 0;
  }
  [(NENexusAgent *)v55 setNexusProvider:a3 == 4];
  long long v57 = (void *)[objc_alloc(MEMORY[0x1E4F38C00]) initWithNetworkAgentClass:objc_opt_class()];
  long long v58 = self->_agent;
  if (v58) {
    objc_setProperty_atomic(v58, v56, v57, 32);
  }

  long long v60 = self->_agent;
  id v20 = v84;
  if (!v60 || !objc_getProperty(v60, v59, 32, 1))
  {
    v73 = ne_log_obj();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      id v78 = "[NWNetworkAgentRegistration initWithNetworkAgentClass] failed";
LABEL_64:
      uint64_t v81 = uu;
LABEL_65:
      uint64_t v82 = v73;
      uint32_t v83 = 2;
LABEL_66:
      _os_log_fault_impl(&dword_19DDAF000, v82, OS_LOG_TYPE_FAULT, v78, v81, v83);
    }
LABEL_48:

LABEL_49:
    v72 = 0;
    goto LABEL_50;
  }
  long long v62 = self->_agent;
  if (v62)
  {
    long long v62 = objc_getProperty(v62, v61, 32, 1);
    long long v63 = self->_agent;
  }
  else
  {
    long long v63 = 0;
  }
  if (([v62 registerNetworkAgent:v63] & 1) == 0)
  {
    v73 = ne_log_obj();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uuid_t uu = 0;
      id v78 = "[NWNetworkAgentRegistration registerNetworkAgent] failed";
      goto LABEL_64;
    }
    goto LABEL_48;
  }
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (v84) {
    [v84 getUUIDBytes:uu];
  }
  CFAllocatorRef v64 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  NexusExtendedWithOptions = (NEVirtualInterface_s *)NEVirtualInterfaceCreateNexusExtendedWithOptions((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a5, 0, 0, 1, 0, a7, 0, a8, a9, a10, uu, 0);
  self->_virtualInterface = NexusExtendedWithOptions;
  if (!NexusExtendedWithOptions)
  {
    v73 = ne_log_obj();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    __int16 v85 = 0;
    id v78 = "NEVirtualInterfaceCreateNexus failed";
    goto LABEL_71;
  }
  virtualInterface = (char *)NexusExtendedWithOptions;
  id v68 = self->_agent;
  if (v68)
  {
    id v69 = objc_getProperty(v68, v66, 32, 1);
    virtualInterface = (char *)self->_virtualInterface;
    id v70 = v69;
    if (!virtualInterface) {
      goto LABEL_37;
    }
  }
  else
  {
    id v70 = 0;
  }
  virtualInterface = (char *)CFStringCreateWithCString(v64, virtualInterface + 265, 0x600u);
LABEL_37:
  char v71 = [v70 addNetworkAgentToInterfaceNamed:virtualInterface];

  if ((v71 & 1) == 0)
  {
    v73 = ne_log_obj();
    if (!os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
      goto LABEL_48;
    }
    __int16 v85 = 0;
    id v78 = "[NWNetworkAgentRegistration addNetworkAgentToInterfaceNamed] failed";
LABEL_71:
    uint64_t v81 = (unsigned __int8 *)&v85;
    goto LABEL_65;
  }
  v72 = self;
LABEL_50:

  return v72;
}

void __27__NENexus_setupFlowManager__block_invoke()
{
  dword_1E9455B20 = 4;
  NENexusFlowCallbacks = (uint64_t)nw_nexus_flow_add_input_handler;
  qword_1E9455A30 = (uint64_t)nw_nexus_flow_input_available;
  qword_1E9455A38 = (uint64_t)nw_nexus_flow_output_available;
  qword_1E9455A40 = (uint64_t)nw_nexus_flow_get_input_frames;
  qword_1E9455A48 = (uint64_t)nw_nexus_flow_get_output_frames;
  qword_1E9455A50 = (uint64_t)nw_nexus_flow_finalize_output_frames;
}

- (NENexus)initWithLevel:(unint64_t)a3 name:(id)a4 virtualInterfaceType:(int64_t)a5 delegate:(id)a6 channelCount:(unsigned int)a7
{
  return -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:](self, "initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:", a3, a4, a5, a6, *(void *)&a7, 0, 0, 0);
}

@end