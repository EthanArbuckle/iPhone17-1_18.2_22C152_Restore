@interface NEIKEv2ChildSA
- (BOOL)isRekeying;
- (_BYTE)configuredInitiatorTrafficSelectors;
- (_BYTE)configuredResponderTrafficSelectors;
- (_BYTE)initiatorTrafficSelectors;
- (_BYTE)responderTrafficSelectors;
- (id)configProposalsWithoutKEM;
- (id)description;
- (id)ikeSA;
- (id)initWithConfiguration:(int)a3 childID:(void *)a4 ikeSA:;
- (id)preferredKEMProtocol;
- (uint64_t)generateAllValues;
- (uint64_t)generateInitialValues;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1;
- (uint64_t)processCurrentKeyExchange;
- (uint64_t)processPrimaryKeyExchange;
- (uint64_t)setInitiatorTrafficSelectors:(unsigned char *)a1;
- (uint64_t)setResponderTrafficSelectors:(unsigned char *)a1;
- (uint64_t)shouldGenerateNewDHKeys;
- (void)dealloc;
- (void)reset;
- (void)setConfigProposalsWithoutKEM:self;
- (void)setState:(void *)a3 error:;
@end

@implementation NEIKEv2ChildSA

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalProposalsWithoutKEM, 0);
  objc_storeStrong((id *)&self->_rekeyedRemoteSPI, 0);
  objc_storeStrong((id *)&self->_rekeyedSPI, 0);
  objc_storeStrong((id *)&self->_rekeyResponseProposal, 0);
  objc_storeStrong((id *)&self->_rekeyRequestProposals, 0);
  objc_storeStrong((id *)&self->_outgoingIntegrityKey, 0);
  objc_storeStrong((id *)&self->_outgoingEncryptionKey, 0);
  objc_storeStrong((id *)&self->_incomingIntegrityKey, 0);
  objc_storeStrong((id *)&self->_incomingEncryptionKey, 0);
  objc_storeStrong((id *)&self->_followupSharedSecrets, 0);
  objc_storeStrong((id *)&self->_additionalKENotify, 0);
  objc_storeStrong((id *)&self->_primarySharedSecret, 0);
  objc_storeStrong((id *)&self->_currentKEHandler, 0);
  objc_storeStrong((id *)&self->_remoteKeyExchangeData, 0);
  objc_storeStrong((id *)&self->_remotePreferredKEMProtocol, 0);
  objc_storeStrong((id *)&self->_remoteNonce, 0);
  objc_storeStrong((id *)&self->_localNonce, 0);
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_chosenProposal, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_ikeSA);
}

- (void)dealloc
{
  [(NEIKEv2ChildSA *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2ChildSA;
  [(NEIKEv2ChildSA *)&v3 dealloc];
}

- (void)reset
{
  if (a1)
  {
    a1[9] = 1;
    objc_setProperty_atomic(a1, a2, 0, 56);
    objc_setProperty_atomic(a1, v3, 0, 208);
    a1[8] = 1;
    objc_setProperty_atomic(a1, v4, 0, 64);
    objc_setProperty_atomic(a1, v5, 0, 72);
    objc_setProperty_atomic(a1, v6, 0, 80);
    objc_setProperty_atomic(a1, v7, 0, 88);
    objc_setProperty_atomic(a1, v8, 0, 104);
    objc_setProperty_atomic(a1, v9, 0, 112);
    objc_setProperty_atomic(a1, v10, 0, 120);
    objc_setProperty_atomic(a1, v11, 0, 128);
    objc_setProperty_atomic(a1, v12, 0, 136);
    objc_setProperty_atomic(a1, v13, 0, 144);
    objc_setProperty_atomic(a1, v14, 0, 152);
    objc_setProperty_atomic(a1, v15, 0, 160);
    objc_setProperty_atomic(a1, v16, 0, 168);
  }
}

- (id)description
{
  id v4 = [NSString alloc];
  if (self)
  {
    uint64_t childID = self->_childID;
    id Property = objc_getProperty(self, v3, 56, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 80, 1);
    }
    id v8 = Property;
    id v10 = objc_getProperty(self, v9, 56, 1);
    if (v10) {
      id v10 = objc_getProperty(v10, v11, 88, 1);
    }
  }
  else
  {
    uint64_t childID = 0;
    id v8 = 0;
    id v10 = 0;
  }
  id v12 = v10;
  SEL v13 = (void *)[v4 initWithFormat:@"ChildSA[%u, %@-%@]", childID, v8, v12];

  return v13;
}

- (id)initWithConfiguration:(int)a3 childID:(void *)a4 ikeSA:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!a1)
  {
    id v11 = 0;
    goto LABEL_15;
  }
  if (v7)
  {
    v26.receiver = a1;
    v26.super_class = (Class)NEIKEv2ChildSA;
    id v9 = [&v26 init];
    if (v9)
    {
      id v11 = v9;
      objc_setProperty_atomic(v9, v10, v7, 48);
      *((unsigned char *)v11 + 9) = 1;
      objc_setProperty_atomic(v11, v12, 0, 56);
      *((_DWORD *)v11 + 4) = a3;
      *((void *)v11 + 4) = 3;
      objc_setProperty_atomic(v11, v13, 0, 40);
      *((unsigned char *)v11 + 8) = 0;
      self;
      __int16 v14 = nextDatabaseReqID_nextReqid;
      if ((unsigned __int16)(nextDatabaseReqID_nextReqid + 1) >> 14) {
        __int16 v15 = 1;
      }
      else {
        __int16 v15 = nextDatabaseReqID_nextReqid + 1;
      }
      nextDatabaseReqID_nextReqid = v15;
      *((_WORD *)v11 + 6) = v14;
      self;
      __int16 v16 = nextDatabaseReqID_nextReqid;
      if ((unsigned __int16)(nextDatabaseReqID_nextReqid + 1) >> 14) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = nextDatabaseReqID_nextReqid + 1;
      }
      nextDatabaseReqID_nextReqid = v17;
      *((_WORD *)v11 + 7) = v16;
      objc_storeWeak((id *)v11 + 3, v8);
      a1 = ne_log_large_obj();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_INFO))
      {
        int v19 = *((_DWORD *)v11 + 4);
        if (v8) {
          id Property = objc_getProperty(v8, v18, 32, 1);
        }
        else {
          id Property = 0;
        }
        id v21 = Property;
        id v23 = objc_getProperty(v11, v22, 48, 1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = v19;
        *(_WORD *)&v28[4] = 2112;
        *(void *)&v28[6] = v21;
        __int16 v29 = 2112;
        id v30 = v23;
        _os_log_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_INFO, "Created Child SA %u (off of %@) with configuration %@", buf, 0x1Cu);
      }
      goto LABEL_14;
    }
    a1 = ne_log_obj();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v28 = "-[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:]";
      _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }
  }
  id v11 = 0;
LABEL_14:

LABEL_15:
  return v11;
}

- (void)setState:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = (v6 | (unint64_t)objc_getProperty((id)a1, v5, 40, 1)) != 0;
    id v9 = ne_log_obj();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == a2)
    {
      if (v8)
      {
        if (v10)
        {
          SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
          int v23 = 138413058;
          uint64_t v24 = a1;
          __int16 v25 = 2112;
          objc_super v26 = SessionStateString;
          __int16 v27 = 2112;
          id Property = objc_getProperty((id)a1, v12, 40, 1);
          __int16 v29 = 2112;
          unint64_t v30 = v6;
          SEL v13 = "%@ not changing state %@ nor error %@ -> %@";
          __int16 v14 = v9;
          uint32_t v15 = 42;
LABEL_11:
          _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);
        }
      }
      else if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
        int v23 = 138412546;
        uint64_t v24 = a1;
        __int16 v25 = 2112;
        objc_super v26 = SessionStateString;
        SEL v13 = "%@ not changing state %@ nor error";
        __int16 v14 = v9;
        uint32_t v15 = 22;
        goto LABEL_11;
      }

      goto LABEL_17;
    }
    if (v8)
    {
      if (v10)
      {
        __int16 v16 = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
        __int16 v17 = NEIKEv2CreateSessionStateString(a2);
        int v23 = 138413314;
        uint64_t v24 = a1;
        __int16 v25 = 2112;
        objc_super v26 = v16;
        __int16 v27 = 2112;
        id Property = v17;
        __int16 v29 = 2112;
        unint64_t v30 = (unint64_t)objc_getProperty((id)a1, v18, 40, 1);
        __int16 v31 = 2112;
        unint64_t v32 = v6;
        int v19 = "%@ state %@ -> %@ error %@ -> %@";
        v20 = v9;
        uint32_t v21 = 52;
LABEL_15:
        _os_log_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
      }
    }
    else if (v10)
    {
      __int16 v16 = NEIKEv2CreateSessionStateString(*(void *)(a1 + 32));
      __int16 v17 = NEIKEv2CreateSessionStateString(a2);
      int v23 = 138412802;
      uint64_t v24 = a1;
      __int16 v25 = 2112;
      objc_super v26 = v16;
      __int16 v27 = 2112;
      id Property = v17;
      int v19 = "%@ state %@ -> %@";
      v20 = v9;
      uint32_t v21 = 32;
      goto LABEL_15;
    }

    *(void *)(a1 + 32) = a2;
    objc_setProperty_atomic((id)a1, v22, (id)v6, 40);
    *(unsigned char *)(a1 + 8) = 1;
  }
LABEL_17:
}

- (void)setConfigProposalsWithoutKEM:self
{
  if (self) {
    objc_setProperty_atomic(self, a2, 0, 208);
  }
}

- (id)configProposalsWithoutKEM
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 208, 1))
    {
LABEL_20:
      a1 = objc_getProperty(v2, v3, 208, 1);
      goto LABEL_21;
    }
    id v4 = objc_msgSend(objc_getProperty(v2, v3, 48, 1), "proposals");
    if ([v4 count] == 1)
    {
      SEL v5 = [v4 objectAtIndexedSubscript:0];
      unint64_t v6 = -[NEIKEv2ChildSAProposal copyWithoutKEM](v5);

      if (v6) {
        v6[8] = 1;
      }
      v24[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      objc_setProperty_atomic(v2, v8, v7, 208);
    }
    else
    {
      unint64_t v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v4;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            __int16 v14 = -[NEIKEv2ChildSAProposal copyWithoutKEM](*(void **)(*((void *)&v19 + 1) + 8 * i));
            char v15 = objc_msgSend(v6, "count", (void)v19);
            if (v14) {
              v14[8] = v15 + 1;
            }
            [v6 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      if (![v6 count]) {
        goto LABEL_19;
      }
      uint64_t v7 = [v6 array];
      __int16 v16 = (void *)[v7 copy];
      objc_setProperty_atomic(v2, v17, v16, 208);
    }
LABEL_19:

    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

- (uint64_t)shouldGenerateNewDHKeys
{
  uint64_t v2 = (uint64_t)self;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 184, 1);
    if (v4) {
      goto LABEL_3;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = objc_getProperty((id)v2, v3, 176, 1);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = [(NEIKEv2IKESAProposal *)*(id *)(*((void *)&v16 + 1) + 8 * v10) kemProtocol];
          uint64_t v12 = objc_msgSend(v11, "method", (void)v16);

          if (v12)
          {
            uint64_t v2 = 1;
            goto LABEL_18;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v4 = objc_getProperty((id)v2, v13, 56, 1);
    if (v4
      || (objc_msgSend(objc_getProperty((id)v2, v3, 48, 1), "proposals"),
          __int16 v14 = objc_claimAutoreleasedReturnValue(),
          [v14 firstObject],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v14,
          v4))
    {
LABEL_3:
      SEL v5 = [(NEIKEv2IKESAProposal *)v4 kemProtocol];
      uint64_t v2 = [v5 method] != 0;
    }
    else
    {
      id v4 = ne_log_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v21 = "-[NEIKEv2ChildSA shouldGenerateNewDHKeys]";
        _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
      }
      uint64_t v2 = 0;
    }
LABEL_18:
  }
  return v2;
}

- (BOOL)isRekeying
{
  uint64_t v3 = 1;
  if (!objc_getProperty(a1, a2, 176, 1)) {
    return objc_getProperty(a1, v4, 184, 1) != 0;
  }
  return v3;
}

- (_BYTE)configuredInitiatorTrafficSelectors
{
  if (a1)
  {
    char v3 = a1[9];
    id Property = objc_getProperty(a1, a2, 48, 1);
    if (v3) {
      [Property localTrafficSelectors];
    }
    else {
    a1 = [Property remoteTrafficSelectors];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (_BYTE)configuredResponderTrafficSelectors
{
  if (a1)
  {
    char v3 = a1[9];
    id Property = objc_getProperty(a1, a2, 48, 1);
    if (v3) {
      [Property remoteTrafficSelectors];
    }
    else {
    a1 = [Property localTrafficSelectors];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setInitiatorTrafficSelectors:(unsigned char *)a1
{
  char v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v5 = 64;
    }
    else {
      ptrdiff_t v5 = 72;
    }
    uint64_t v7 = v3;
    objc_setProperty_atomic(a1, v3, v3, v5);
    id v4 = v7;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (_BYTE)initiatorTrafficSelectors
{
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v3 = 64;
    }
    else {
      ptrdiff_t v3 = 72;
    }
    a1 = objc_getProperty(a1, a2, v3, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setResponderTrafficSelectors:(unsigned char *)a1
{
  ptrdiff_t v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v5 = 72;
    }
    else {
      ptrdiff_t v5 = 64;
    }
    uint64_t v7 = v3;
    objc_setProperty_atomic(a1, v3, v3, v5);
    id v4 = v7;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (_BYTE)responderTrafficSelectors
{
  if (a1)
  {
    if (a1[9]) {
      ptrdiff_t v3 = 72;
    }
    else {
      ptrdiff_t v3 = 64;
    }
    a1 = objc_getProperty(a1, a2, v3, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)preferredKEMProtocol
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (objc_getProperty(a1, a2, 96, 1))
  {
    id v4 = objc_getProperty(a1, v3, 96, 1);
  }
  else
  {
    uint64_t v6 = objc_getProperty(a1, v3, 184, 1);
    if (v6) {
      goto LABEL_4;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = objc_getProperty(a1, v5, 176, 1);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(NSObject **)(*((void *)&v18 + 1) + 8 * i);
          SEL v13 = [(NEIKEv2IKESAProposal *)v12 kemProtocol];
          uint64_t v14 = objc_msgSend(v13, "method", (void)v18);

          if (v14)
          {
            uint64_t v7 = v12;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v6 = objc_getProperty(a1, v15, 56, 1);
    if (v6
      || (objc_msgSend(objc_getProperty(a1, v5, 48, 1), "proposals"),
          long long v16 = objc_claimAutoreleasedReturnValue(),
          [v16 firstObject],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v16,
          v6))
    {
LABEL_4:
      uint64_t v7 = v6;
LABEL_19:
      id v4 = [(NEIKEv2IKESAProposal *)v7 kemProtocol];
    }
    else
    {
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = "-[NEIKEv2ChildSA preferredKEMProtocol]";
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
      }
      id v4 = 0;
    }
  }

  return v4;
}

- (id)ikeSA
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty(a1, v3, 112, 1);

    if (v5)
    {
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[NEIKEv2ChildSA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]((uint64_t)NEIKEv2KeyExchangeHandler, [v4 method]);
      objc_setProperty_atomic(a1, v9, v8, 112);

      uint64_t v7 = 1;
      id v11 = objc_getProperty(a1, v10, 112, 1);

      if (v11) {
        goto LABEL_8;
      }
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        uint64_t v14 = (const char *)v4;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (uint64_t)generateInitialValues
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    id v4 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = objc_getProperty(WeakRetained, v3, 80, 1);
    }
    id v5 = WeakRetained;
    unsigned int v6 = [v5 nonceSize];

    if (v6 <= 0xF)
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 67109120;
        LODWORD(v16) = v6;
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "Invalid nonce size %u", (uint8_t *)&v15, 8u);
      }
    }
    else
    {
      uint64_t v7 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v6);
      objc_setProperty_atomic(v1, v8, v7, 80);

      if (![(NEIKEv2ChildSA *)v1 shouldGenerateNewDHKeys]) {
        return 1;
      }
      id v11 = [(NEIKEv2ChildSA *)v1 preferredKEMProtocol];
      uint64_t v12 = v11;
      if (v11 && [v11 method] != 36 && [v12 method] != 37)
      {
        uint64_t v1 = (void *)-[NEIKEv2ChildSA generateLocalValuesForKEMProtocol:](v1, v12);
LABEL_13:

        return (uint64_t)v1;
      }
      uint64_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412290;
        long long v16 = v12;
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "KE method %@ is not Diffie-Hellman", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v1 = 0;
    goto LABEL_13;
  }
  return (uint64_t)v1;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = objc_getProperty(self, a2, 112, 1);
  }
  id v3 = self;

  if (!v3)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    int v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  id v5 = objc_getProperty(v2, v4, 104, 1);

  if (!v5)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    int v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }
  SEL v8 = objc_getProperty(v2, v6, 104, 1);
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0, 104);
    id Property = objc_getProperty(v2, v9, 112, 1);
  }
  else
  {
    id Property = 0;
  }
  id v11 = Property;
  uint64_t v12 = [v11 processPeerPayload:v8];

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  if (result)
  {
    id v2 = (void *)result;
    result = [(NEIKEv2ChildSA *)(id)result processCurrentKeyExchange];
    if (result)
    {
      id v4 = objc_getProperty(v2, v3, 112, 1);
      unsigned int v6 = v4;
      if (v4) {
        uint64_t v7 = (void *)*((void *)v4 + 3);
      }
      else {
        uint64_t v7 = 0;
      }
      objc_setProperty_atomic(v2, v5, v7, 120);

      objc_setProperty_atomic(v2, v8, 0, 112);
      return 1;
    }
  }
  return result;
}

- (uint64_t)generateAllValues
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    unsigned int v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v128, 0xCu);
    }
    uint64_t v97 = 0;
    goto LABEL_97;
  }
  unsigned int v6 = objc_getProperty(WeakRetained, v3, 96, 1);
  if (!v6)
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null ikeProposal", v128, 0xCu);
    }
    goto LABEL_110;
  }
  uint64_t v7 = objc_getProperty((id)a1, v5, 56, 1);
  if (!v7)
  {
    v100 = ne_log_obj();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19DDAF000, v100, OS_LOG_TYPE_FAULT, "%s called with null childProposal", v128, 0xCu);
    }

    SEL v9 = 0;
LABEL_110:
    uint64_t v97 = 0;
    goto LABEL_96;
  }
  SEL v9 = v7;
  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v10 = 80;
  }
  else {
    ptrdiff_t v10 = 88;
  }
  id v12 = objc_getProperty((id)a1, v8, v10, 1);
  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v13 = 88;
  }
  else {
    ptrdiff_t v13 = 80;
  }
  id v14 = objc_getProperty((id)a1, v11, v13, 1);
  int v16 = v14;
  if (v12 && v14)
  {
    uint64_t v17 = v12;
  }
  else
  {
    uint64_t v17 = [(NEIKEv2IKESA *)v4 initiatorNonce];

    long long v19 = [(NEIKEv2IKESA *)v4 initiatorNonce];

    if (!v19)
    {
      v35 = ne_log_obj();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl(&dword_19DDAF000, v35, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.initiatorNonce", v128, 0xCu);
      }

      unsigned __int8 v123 = 0;
      goto LABEL_95;
    }
    uint64_t v21 = [(NEIKEv2IKESA *)v4 responderNonce];

    uint64_t v23 = [(NEIKEv2IKESA *)v4 responderNonce];

    if (!v23)
    {
      v95 = ne_log_obj();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(void *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl(&dword_19DDAF000, v95, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.responderNonce", v128, 0xCu);
      }

      unsigned __int8 v123 = 0;
      int v16 = (void *)v21;
      goto LABEL_95;
    }
    int v16 = (void *)v21;
  }
  v112 = objc_getProperty((id)a1, v15, 120, 1);
  v114 = v17;
  v111 = v4;
  if (v112)
  {
    uint64_t v25 = v16;
    objc_super v26 = v9;
    objc_setProperty_atomic((id)a1, v24, 0, 120);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v28 = objc_getProperty((id)a1, v27, 136, 1);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v119 objects:v127 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = 0;
      uint64_t v32 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v120 != v32) {
            objc_enumerationMutation(v28);
          }
          v31 += [*(id *)(*((void *)&v119 + 1) + 8 * i) length];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v119 objects:v127 count:16];
      }
      while (v30);
    }
    else
    {
      uint64_t v31 = 0;
    }
    v34 = v6;

    SEL v9 = v26;
    uint64_t v17 = v114;
    int v16 = v25;
  }
  else
  {
    v34 = v6;
    uint64_t v31 = 0;
  }
  uint64_t v36 = [v17 length];
  v37 = v16;
  uint64_t v38 = [v16 length];
  CFIndex v39 = v36 + [v112 length] + v31 + v38;
  CFMutableDataRef v40 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E4F1CA58], v39);
  if (!v40)
  {
    v101 = ne_log_obj();
    unsigned int v6 = v34;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 134217984;
      *(void *)&v128[4] = v39;
      _os_log_fault_impl(&dword_19DDAF000, v101, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", v128, 0xCu);
    }

    CFMutableDataRef v41 = 0;
    unsigned __int8 v123 = 0;
    int v16 = v37;
    id v4 = v111;
    v92 = v112;
    goto LABEL_94;
  }
  CFMutableDataRef v41 = v40;
  [(__CFData *)v40 appendData:v112];
  [(__CFData *)v41 appendData:v17];
  v110 = v37;
  [(__CFData *)v41 appendData:v37];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v43 = objc_getProperty((id)a1, v42, 136, 1);
  uint64_t v44 = [v43 countByEnumeratingWithState:&v115 objects:v126 count:16];
  unsigned int v6 = v34;
  id v4 = v111;
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v116 != v46) {
          objc_enumerationMutation(v43);
        }
        [(__CFData *)v41 appendData:*(void *)(*((void *)&v115 + 1) + 8 * j)];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v115 objects:v126 count:16];
    }
    while (v45);
  }

  objc_setProperty_atomic((id)a1, v48, 0, 136);
  *(void *)v128 = 0;
  [(__CFData *)v41 bytes];
  [(__CFData *)v41 length];
  unsigned int Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    unsigned int v102 = Hkdf;
    v103 = ne_log_obj();
    uint64_t v17 = v114;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v102;
      _os_log_fault_impl(&dword_19DDAF000, v103, OS_LOG_TYPE_FAULT, "CCKDFParametersCreateHkdf failed %d", buf, 8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    v92 = v112;
    goto LABEL_94;
  }
  v52 = [(NEIKEv2ChildSAProposal *)v9 integrityProtocol];
  uint64_t v17 = v114;
  if (v52)
  {
    v53 = [(NEIKEv2ChildSAProposal *)v9 integrityProtocol];
    unsigned int v54 = -[NEIKEv2IntegrityProtocol keyLength]((uint64_t)v53);
  }
  else
  {
    unsigned int v54 = 0;
  }

  v56 = [(NEIKEv2ChildSAProposal *)v9 encryptionProtocol];
  unsigned int v57 = -[NEIKEv2EncryptionProtocol keyLength]((uint64_t)v56);

  unsigned int v107 = v54;
  uint64_t v58 = v57 + v54;
  v60 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], (2 * v58));
  if (!v60)
  {
    v104 = ne_log_obj();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = 2 * v58;
      _os_log_fault_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", buf, 8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    v92 = v112;
    goto LABEL_93;
  }
  uint64_t v106 = v58;
  unsigned int v108 = v57;
  v109 = v9;
  id v61 = objc_getProperty(v111, v59, 216, 1);
  v63 = [(NEIKEv2IKESAProposal *)v6 prfProtocol];
  -[NEIKEv2PRFProtocol ccDigest](v63);
  [v61 bytes];
  [v61 length];
  [(__CFData *)v60 mutableBytes];
  [(__CFData *)v60 length];
  unsigned int v64 = CCHKDFExpand();

  CCKDFParametersDestroy();
  *(void *)v128 = 0;
  if (v64)
  {
    v105 = ne_log_obj();
    v92 = v112;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v64;
      _os_log_fault_impl(&dword_19DDAF000, v105, OS_LOG_TYPE_FAULT, "CCHKDFExpand failed %d", buf, 8u);
    }

    unsigned __int8 v123 = 0;
    int v16 = v110;
    id v4 = v111;
    goto LABEL_92;
  }

  v113 = v60;
  v65 = (const UInt8 *)[(__CFData *)v60 bytes];
  CFDataRef v67 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], v65, v108);
  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v68 = 160;
  }
  else {
    ptrdiff_t v68 = 144;
  }
  objc_setProperty_atomic((id)a1, v66, v67, v68);

  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v70 = 160;
  }
  else {
    ptrdiff_t v70 = 144;
  }
  id v71 = objc_getProperty((id)a1, v69, v70, 1);

  if (!v71)
  {
    v93 = ne_log_obj();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v108;
      _os_log_fault_impl(&dword_19DDAF000, v93, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    goto LABEL_90;
  }
  uint64_t v72 = v108;
  unsigned int v73 = v108;
  if (v107)
  {
    CFDataRef v75 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v65[v108], v107);
    if (*(unsigned char *)(a1 + 9)) {
      ptrdiff_t v76 = 168;
    }
    else {
      ptrdiff_t v76 = 152;
    }
    objc_setProperty_atomic((id)a1, v74, v75, v76);

    if (*(unsigned char *)(a1 + 9)) {
      ptrdiff_t v78 = 168;
    }
    else {
      ptrdiff_t v78 = 152;
    }
    id v79 = objc_getProperty((id)a1, v77, v78, 1);

    if (v79)
    {
      uint64_t v72 = v106;
      unsigned int v73 = v106;
      goto LABEL_62;
    }
    v96 = ne_log_obj();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v107;
      _os_log_fault_impl(&dword_19DDAF000, v96, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

LABEL_90:
    CFMutableDataRef v41 = 0;
    v92 = 0;
    id v61 = 0;
    unsigned __int8 v123 = 0;
    id v4 = v111;
    goto LABEL_91;
  }
LABEL_62:
  CFDataRef v81 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v65[v72], v108);
  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v82 = 144;
  }
  else {
    ptrdiff_t v82 = 160;
  }
  objc_setProperty_atomic((id)a1, v80, v81, v82);

  if (*(unsigned char *)(a1 + 9)) {
    ptrdiff_t v84 = 144;
  }
  else {
    ptrdiff_t v84 = 160;
  }
  id v85 = objc_getProperty((id)a1, v83, v84, 1);

  if (!v85)
  {
    v94 = ne_log_obj();
    id v4 = v111;
    v60 = v113;
    SEL v9 = v109;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v108;
      _os_log_fault_impl(&dword_19DDAF000, v94, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    CFMutableDataRef v41 = 0;
    v92 = 0;
    id v61 = 0;
    unsigned __int8 v123 = 0;
    int v16 = v110;
    goto LABEL_92;
  }
  id v4 = v111;
  if (!v107) {
    goto LABEL_77;
  }
  CFDataRef v87 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E4F1C9B8], &v65[v73 + v108], v107);
  ptrdiff_t v88 = (*(unsigned char *)(a1 + 9) & 1) != 0 ? 152 : 168;
  objc_setProperty_atomic((id)a1, v86, v87, v88);

  ptrdiff_t v90 = (*(unsigned char *)(a1 + 9) & 1) != 0 ? 152 : 168;
  id v91 = objc_getProperty((id)a1, v89, v90, 1);

  if (!v91)
  {
    v99 = ne_log_obj();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v125 = v107;
      _os_log_fault_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    CFMutableDataRef v41 = 0;
    v92 = 0;
    id v61 = 0;
    unsigned __int8 v123 = 0;
  }
  else
  {
LABEL_77:
    CFMutableDataRef v41 = 0;
    v92 = 0;
    id v61 = 0;
    unsigned __int8 v123 = 1;
  }
LABEL_91:
  SEL v9 = v109;
  int v16 = v110;
  v60 = v113;
LABEL_92:

  uint64_t v17 = v114;
LABEL_93:

LABEL_94:
LABEL_95:

  uint64_t v97 = v123;
LABEL_96:

LABEL_97:
  return v97;
}

@end