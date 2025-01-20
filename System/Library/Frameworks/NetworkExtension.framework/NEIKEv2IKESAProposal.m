@interface NEIKEv2IKESAProposal
+ (NSObject)chooseSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:;
- (NEIKEv2IKESAProposal)init;
- (NSArray)eapProtocols;
- (NSArray)encryptionProtocols;
- (NSArray)integrityProtocols;
- (NSArray)kemProtocols;
- (NSArray)prfProtocols;
- (NSDictionary)additionalKEMProtocols;
- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:;
- (char)softLifetimeSecondsForInitiator:(char *)result;
- (id)chosenAdditionalKEMProtocols;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)encryptionProtocol;
- (id)integrityProtocol;
- (id)kemProtocol;
- (id)prfProtocol;
- (uint64_t)hasEAPMethods;
- (uint64_t)isAValidResponse;
- (unint64_t)lifetimeSeconds;
- (void)matchesLocalProposal:(int)a3 preferRemoteProposal:;
- (void)setAdditionalKEMProtocols:(id)a3;
- (void)setChosenAdditionalKEMProtocols:(void *)a1;
- (void)setEapProtocols:(id)a3;
- (void)setEncryptionProtocols:(id)a3;
- (void)setIntegrityProtocols:(id)a3;
- (void)setKemProtocols:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setPrfProtocols:(id)a3;
@end

@implementation NEIKEv2IKESAProposal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationProtocol, 0);
  objc_storeStrong((id *)&self->_chosenAdditionalKETransforms, 0);
  objc_storeStrong((id *)&self->_chosenKEMProtocol, 0);
  objc_storeStrong((id *)&self->_chosenPRFProtocol, 0);
  objc_storeStrong((id *)&self->_chosenIntegrityProtocol, 0);
  objc_storeStrong((id *)&self->_chosenEncryptionProtocol, 0);
  objc_storeStrong((id *)&self->_unsupportedTransformTypes, 0);
  objc_storeStrong((id *)&self->_eapProtocols, 0);
  objc_storeStrong((id *)&self->_additionalKEMProtocols, 0);
  objc_storeStrong((id *)&self->_kemProtocols, 0);
  objc_storeStrong((id *)&self->_prfProtocols, 0);
  objc_storeStrong((id *)&self->_integrityProtocols, 0);
  objc_storeStrong((id *)&self->_encryptionProtocols, 0);

  objc_storeStrong((id *)&self->_chosenAdditionalKEMProtocols, 0);
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setEapProtocols:(id)a3
{
}

- (NSArray)eapProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdditionalKEMProtocols:(id)a3
{
}

- (NSDictionary)additionalKEMProtocols
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKemProtocols:(id)a3
{
}

- (NSArray)kemProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrfProtocols:(id)a3
{
}

- (NSArray)prfProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntegrityProtocols:(id)a3
{
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEIKEv2IKESAProposal *)self encryptionProtocols];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    v7 = [(NEIKEv2IKESAProposal *)self encryptionProtocols];
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setEncryptionProtocols:v8];
  }
  v9 = [(NEIKEv2IKESAProposal *)self integrityProtocols];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    v11 = [(NEIKEv2IKESAProposal *)self integrityProtocols];
    v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setIntegrityProtocols:v12];
  }
  v13 = [(NEIKEv2IKESAProposal *)self prfProtocols];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
    v15 = [(NEIKEv2IKESAProposal *)self prfProtocols];
    v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setPrfProtocols:v16];
  }
  v17 = [(NEIKEv2IKESAProposal *)self kemProtocols];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1C978]);
    v19 = [(NEIKEv2IKESAProposal *)self kemProtocols];
    v20 = (void *)[v18 initWithArray:v19 copyItems:1];
    [v4 setKemProtocols:v20];
  }
  if (self
    && ([(NEIKEv2IKESAProposal *)self additionalKEMProtocols],
        v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    v69 = v4;
    id v22 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v23 = [(NEIKEv2IKESAProposal *)self additionalKEMProtocols];
    v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = [(NEIKEv2IKESAProposal *)self additionalKEMProtocols];
    uint64_t v25 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          id v30 = objc_alloc(MEMORY[0x1E4F1C978]);
          [(NEIKEv2IKESAProposal *)self additionalKEMProtocols];
          v32 = v31 = self;
          v33 = [v32 objectForKeyedSubscript:v29];
          v34 = (void *)[v30 initWithArray:v33 copyItems:1];
          [v24 setObject:v34 forKeyedSubscript:v29];

          self = v31;
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v26);
    }

    v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v24];
    v4 = v69;
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(v4, "setAdditionalKEMProtocols:", v35, v69);

  v36 = [(NEIKEv2IKESAProposal *)self eapProtocols];

  if (v36)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F1C978]);
    v39 = [(NEIKEv2IKESAProposal *)self eapProtocols];
    v40 = (void *)[v38 initWithArray:v39 copyItems:1];
    [v4 setEapProtocols:v40];
  }
  if (self)
  {
    if (objc_getProperty(self, v37, 80, 1))
    {
      id v41 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v44 = objc_msgSend(v41, "initWithSet:", objc_getProperty(self, v42, 80, 1));
      if (v4) {
        objc_setProperty_atomic(v4, v43, v44, 80);
      }
    }
    objc_msgSend(v4, "setLifetimeSeconds:", -[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"));
    unsigned __int8 proposalNumber = self->_proposalNumber;
    if (v4) {
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v4, "setLifetimeSeconds:", objc_msgSend(0, "lifetimeSeconds"));
    unsigned __int8 proposalNumber = 0;
    if (v4) {
LABEL_28:
    }
      v4[8] = proposalNumber;
  }
  if (self) {
    id Property = objc_getProperty(self, v45, 88, 1);
  }
  else {
    id Property = 0;
  }
  v49 = (void *)[Property copy];
  if (v4) {
    objc_setProperty_atomic(v4, v48, v49, 88);
  }

  if (self) {
    id v51 = objc_getProperty(self, v50, 96, 1);
  }
  else {
    id v51 = 0;
  }
  v53 = (void *)[v51 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v52, v53, 96);
  }

  if (self) {
    id v55 = objc_getProperty(self, v54, 104, 1);
  }
  else {
    id v55 = 0;
  }
  v57 = (void *)[v55 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v56, v57, 104);
  }

  if (self) {
    id v59 = objc_getProperty(self, v58, 112, 1);
  }
  else {
    id v59 = 0;
  }
  v61 = (void *)[v59 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v60, v61, 112);
  }

  v62 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);

  if (v62)
  {
    id v63 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v64 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v65 = (void *)[v63 initWithDictionary:v64 copyItems:1];
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v4, v65);
  }
  if (self) {
    authenticationProtocol = self->_authenticationProtocol;
  }
  else {
    authenticationProtocol = 0;
  }
  v67 = (void *)[(NEIKEv2AuthenticationProtocol *)authenticationProtocol copy];
  -[NEConfigurationManager setAppGroupMap:]((uint64_t)v4, v67);

  return v4;
}

- (id)chosenAdditionalKEMProtocols
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    id v2 = v1[2];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)setChosenAdditionalKEMProtocols:(void *)a1
{
  id v2 = a2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = v4;
  if (a1)
  {
    if ([v4 count])
    {
      id v18 = v2;
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v13 = [v7 objectForKeyedSubscript:v12];
            uint64_t v14 = [v13 method];

            if (v14) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v9);
      }

      if ([v6 count])
      {
        uint64_t v15 = [v6 sortedArrayUsingSelector:sel_compare_];
      }
      else
      {
        uint64_t v15 = 0;
      }
      id v2 = v18;
    }
    else
    {
      uint64_t v15 = 0;
    }
    v16 = a1;
    objc_sync_enter(v16);
    objc_storeStrong(v16 + 2, v2);
    id v17 = v16[15];
    v16[15] = (id)v15;

    objc_sync_exit(v16);
  }
}

- (id)description
{
  return [(NEIKEv2IKESAProposal *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  uint64_t v8 = v7;
  if (self)
  {
    [v7 appendPrettyInt:self->_proposalNumber withName:@"Number" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v9, 88, 1);
  }
  else
  {
    [v7 appendPrettyInt:0 withName:@"Number" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v8 appendPrettyObject:Property withName:@"Chosen Encryption" andIndent:v5 options:a4];
  v11 = [(NEIKEv2IKESAProposal *)self encryptionProtocols];
  [v8 appendPrettyObject:v11 withName:@"Encryption" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v12, 96, 1), @"Chosen Integrity", v5, a4);
    v13 = [(NEIKEv2IKESAProposal *)self integrityProtocols];
    [v8 appendPrettyObject:v13 withName:@"Integrity" andIndent:v5 options:a4];

    id v15 = objc_getProperty(self, v14, 104, 1);
  }
  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen Integrity" andIndent:v5 options:a4];
    uint64_t v26 = [0 integrityProtocols];
    [v8 appendPrettyObject:v26 withName:@"Integrity" andIndent:v5 options:a4];

    id v15 = 0;
  }
  [v8 appendPrettyObject:v15 withName:@"Chosen PRF" andIndent:v5 options:a4];
  v16 = [(NEIKEv2IKESAProposal *)self prfProtocols];
  [v8 appendPrettyObject:v16 withName:@"PRF" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v17, 112, 1), @"Chosen KE", v5, a4);
    id v18 = [(NEIKEv2IKESAProposal *)self kemProtocols];
    [v8 appendPrettyObject:v18 withName:@"KE" andIndent:v5 options:a4];

    long long v19 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    [v8 appendPrettyObject:v19 withName:@"Chosen ADDKE" andIndent:v5 options:a4];

    long long v20 = [(NEIKEv2IKESAProposal *)self additionalKEMProtocols];
    [v8 appendPrettyObject:v20 withName:@"ADDKE" andIndent:v5 options:a4];

    id v22 = objc_getProperty(self, v21, 80, 1);
  }
  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen KE" andIndent:v5 options:a4];
    uint64_t v27 = [0 kemProtocols];
    [v8 appendPrettyObject:v27 withName:@"KE" andIndent:v5 options:a4];

    v28 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](0);
    [v8 appendPrettyObject:v28 withName:@"Chosen ADDKE" andIndent:v5 options:a4];

    uint64_t v29 = [0 additionalKEMProtocols];
    [v8 appendPrettyObject:v29 withName:@"ADDKE" andIndent:v5 options:a4];

    id v22 = 0;
  }
  [v8 appendPrettyObject:v22 withName:@"Unsupported Transform Types" andIndent:v5 options:a4];
  v23 = [(NEIKEv2IKESAProposal *)self eapProtocols];
  [v8 appendPrettyObject:v23 withName:@"EAP" andIndent:v5 options:a4];

  if ([(NEIKEv2IKESAProposal *)self lifetimeSeconds]) {
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", (int)-[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"), @"Lifetime", v5, a4);
  }
  if (self) {
    authenticationProtocol = self->_authenticationProtocol;
  }
  else {
    authenticationProtocol = 0;
  }
  [v8 appendPrettyObject:authenticationProtocol withName:@"Authentication" andIndent:v5 options:a4];

  return v8;
}

- (NEIKEv2IKESAProposal)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2IKESAProposal;
  id v2 = [(NEIKEv2IKESAProposal *)&v8 init];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (id)encryptionProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 88, 1))
    {
      id v2 = objc_getProperty(v2, v3, 88, 1);
    }
    else
    {
      id v4 = [v2 encryptionProtocols];
      id v2 = [v4 firstObject];
    }
  }

  return v2;
}

- (id)integrityProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 96, 1))
    {
      id v2 = objc_getProperty(v2, v3, 96, 1);
    }
    else
    {
      id v4 = [v2 integrityProtocols];
      id v2 = [v4 firstObject];
    }
  }

  return v2;
}

- (id)prfProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 104, 1))
    {
      id v2 = objc_getProperty(v2, v3, 104, 1);
    }
    else
    {
      id v4 = [v2 prfProtocols];
      id v2 = [v4 firstObject];
    }
  }

  return v2;
}

- (id)kemProtocol
{
  id v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 112, 1))
    {
      id v2 = objc_getProperty(v2, v3, 112, 1);
    }
    else
    {
      id v4 = [v2 kemProtocols];
      id v2 = [v4 firstObject];
    }
  }

  return v2;
}

- (uint64_t)hasEAPMethods
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v1 = objc_msgSend(a1, "eapProtocols", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) method])
        {
          uint64_t v2 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v2;
}

- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  long long v6 = v5;
  if (!a1)
  {
    v126 = 0;
    goto LABEL_159;
  }
  if (!v5)
  {
    long long v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v187 = "-[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }
    v126 = 0;
    goto LABEL_158;
  }
  long long v7 = [a1 copy];
  long long v8 = v7;
  if (!v6[8])
  {
    id v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_156;
    }
    *(_WORD *)buf = 0;
    id v18 = "Remote proposal has invalid proposal number 0";
LABEL_106:
    _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_156;
  }
  if (v7) {
    LOBYTE(v7[1].isa) = v6[8];
  }
  if (a3)
  {
    long long v174 = 0uLL;
    long long v175 = 0uLL;
    long long v172 = 0uLL;
    long long v173 = 0uLL;
    long long v9 = [v6 encryptionProtocols];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v172 objects:v185 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v173;
LABEL_9:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v173 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v172 + 1) + 8 * v13);
        id v15 = [v8 encryptionProtocols];
        uint64_t v16 = [v15 indexOfObject:v14];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v172 objects:v185 count:16];
          if (v11) {
            goto LABEL_9;
          }
          goto LABEL_26;
        }
      }
      v28 = [v8 encryptionProtocols];
      uint64_t v29 = [v28 objectAtIndexedSubscript:v16];
      v31 = v29;
      if (!v8)
      {

        goto LABEL_176;
      }
      objc_setProperty_atomic(v8, v30, v29, 88);

      v33 = objc_getProperty(v8, v32, 88, 1);
      if (!v33 || (unint64_t v34 = v33[2], v34 > 0x1F) || ((1 << v34) & 0xD01C0000) == 0)
      {
LABEL_177:
        char v27 = 0;
        goto LABEL_39;
      }
LABEL_38:
      char v27 = 1;
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    long long v170 = 0uLL;
    long long v171 = 0uLL;
    long long v168 = 0uLL;
    long long v169 = 0uLL;
    long long v9 = [v7 encryptionProtocols];
    uint64_t v19 = [v9 countByEnumeratingWithState:&v168 objects:v184 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v169;
LABEL_20:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v169 != v21) {
          objc_enumerationMutation(v9);
        }
        v23 = *(void **)(*((void *)&v168 + 1) + 8 * v22);
        uint64_t v24 = [v6 encryptionProtocols];
        int v25 = [v24 containsObject:v23];

        if (v25) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v9 countByEnumeratingWithState:&v168 objects:v184 count:16];
          if (v20) {
            goto LABEL_20;
          }
          goto LABEL_26;
        }
      }
      if (!v8)
      {
LABEL_176:
        v33 = 0;
        goto LABEL_177;
      }
      objc_setProperty_atomic(v8, v26, v23, 88);
      v33 = objc_getProperty(v8, v35, 88, 1);
      if (!v33) {
        goto LABEL_177;
      }
      unint64_t v36 = v33[2];
      BOOL v37 = v36 > 0x1F;
      uint64_t v38 = (1 << v36) & 0xD01C0000;
      if (v37 || v38 == 0) {
        goto LABEL_177;
      }
      goto LABEL_38;
    }
  }
LABEL_26:
  char v27 = 0;
LABEL_40:

  if (!v8 || !objc_getProperty(v8, v40, 88, 1))
  {
    id v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_156;
    }
    *(_WORD *)buf = 0;
    id v18 = "No chosen encryption protocol";
    goto LABEL_106;
  }
  if ((v27 & 1) == 0)
  {
    if (a3)
    {
      long long v166 = 0uLL;
      long long v167 = 0uLL;
      long long v164 = 0uLL;
      long long v165 = 0uLL;
      id v41 = [v6 integrityProtocols];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v164 objects:v183 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v165;
        while (2)
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v165 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v164 + 1) + 8 * i);
            v47 = [v8 integrityProtocols];
            uint64_t v48 = [v47 indexOfObject:v46];

            if (v48 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v57 = [v8 integrityProtocols];
              v58 = [v57 objectAtIndexedSubscript:v48];
              objc_setProperty_atomic(v8, v59, v58, 96);

              goto LABEL_66;
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v164 objects:v183 count:16];
          if (v43) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      long long v162 = 0uLL;
      long long v163 = 0uLL;
      long long v160 = 0uLL;
      long long v161 = 0uLL;
      id v41 = [v8 integrityProtocols];
      uint64_t v49 = [v41 countByEnumeratingWithState:&v160 objects:v182 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v161;
        while (2)
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v161 != v51) {
              objc_enumerationMutation(v41);
            }
            v53 = *(void **)(*((void *)&v160 + 1) + 8 * j);
            v54 = [v6 integrityProtocols];
            int v55 = [v54 containsObject:v53];

            if (v55)
            {
              objc_setProperty_atomic(v8, v56, v53, 96);
              goto LABEL_66;
            }
          }
          uint64_t v50 = [v41 countByEnumeratingWithState:&v160 objects:v182 count:16];
          if (v50) {
            continue;
          }
          break;
        }
      }
    }
LABEL_66:

    if (!objc_getProperty(v8, v60, 96, 1))
    {
      id v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v18 = "No chosen integrity protocol";
        goto LABEL_106;
      }
      goto LABEL_156;
    }
  }
  if (a3)
  {
    long long v158 = 0uLL;
    long long v159 = 0uLL;
    long long v156 = 0uLL;
    long long v157 = 0uLL;
    v61 = [v6 prfProtocols];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v156 objects:v181 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v157;
      while (2)
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v157 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = *(void *)(*((void *)&v156 + 1) + 8 * k);
          v67 = [v8 prfProtocols];
          uint64_t v68 = [v67 indexOfObject:v66];

          if (v68 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v77 = [v8 prfProtocols];
            v78 = [v77 objectAtIndexedSubscript:v68];
            objc_setProperty_atomic(v8, v79, v78, 104);

            goto LABEL_88;
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v156 objects:v181 count:16];
        if (v63) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v154 = 0uLL;
    long long v155 = 0uLL;
    long long v152 = 0uLL;
    long long v153 = 0uLL;
    v61 = [v8 prfProtocols];
    uint64_t v69 = [v61 countByEnumeratingWithState:&v152 objects:v180 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v153;
      while (2)
      {
        for (uint64_t m = 0; m != v70; ++m)
        {
          if (*(void *)v153 != v71) {
            objc_enumerationMutation(v61);
          }
          long long v73 = *(void **)(*((void *)&v152 + 1) + 8 * m);
          long long v74 = [v6 prfProtocols];
          int v75 = [v74 containsObject:v73];

          if (v75)
          {
            objc_setProperty_atomic(v8, v76, v73, 104);
            goto LABEL_88;
          }
        }
        uint64_t v70 = [v61 countByEnumeratingWithState:&v152 objects:v180 count:16];
        if (v70) {
          continue;
        }
        break;
      }
    }
  }
LABEL_88:

  if (!objc_getProperty(v8, v80, 104, 1))
  {
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v18 = "No chosen PRF protocol";
      goto LABEL_106;
    }
LABEL_156:
    v126 = 0;
    goto LABEL_157;
  }
  v81 = [v8 kemProtocols];
  v82 = [v6 kemProtocols];
  v83 = [v82 firstObject];
  uint64_t v84 = [v81 indexOfObject:v83];

  if (v84 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
    {
      long long v150 = 0uLL;
      long long v151 = 0uLL;
      long long v148 = 0uLL;
      long long v149 = 0uLL;
      v85 = [v6 kemProtocols];
      uint64_t v86 = [v85 countByEnumeratingWithState:&v148 objects:v179 count:16];
      if (!v86) {
        goto LABEL_115;
      }
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v149;
LABEL_93:
      uint64_t v89 = 0;
      while (1)
      {
        if (*(void *)v149 != v88) {
          objc_enumerationMutation(v85);
        }
        uint64_t v90 = *(void *)(*((void *)&v148 + 1) + 8 * v89);
        v91 = [v8 kemProtocols];
        uint64_t v92 = [v91 indexOfObject:v90];

        if (v92 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v87 == ++v89)
        {
          uint64_t v87 = [v85 countByEnumeratingWithState:&v148 objects:v179 count:16];
          if (!v87)
          {
LABEL_115:

            goto LABEL_153;
          }
          goto LABEL_93;
        }
      }
      v102 = [v8 kemProtocols];
      id v17 = [v102 objectAtIndexedSubscript:v92];
    }
    else
    {
      long long v146 = 0uLL;
      long long v147 = 0uLL;
      long long v144 = 0uLL;
      long long v145 = 0uLL;
      v85 = [v8 kemProtocols];
      uint64_t v95 = [v85 countByEnumeratingWithState:&v144 objects:v178 count:16];
      if (!v95) {
        goto LABEL_115;
      }
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v145;
LABEL_109:
      uint64_t v98 = 0;
      while (1)
      {
        if (*(void *)v145 != v97) {
          objc_enumerationMutation(v85);
        }
        v99 = *(void **)(*((void *)&v144 + 1) + 8 * v98);
        v100 = [v6 kemProtocols];
        int v101 = [v100 containsObject:v99];

        if (v101) {
          break;
        }
        if (v96 == ++v98)
        {
          uint64_t v96 = [v85 countByEnumeratingWithState:&v144 objects:v178 count:16];
          if (!v96) {
            goto LABEL_115;
          }
          goto LABEL_109;
        }
      }
      id v17 = v99;
    }

    if (v17) {
      goto LABEL_119;
    }
    goto LABEL_153;
  }
  v93 = [v8 kemProtocols];
  id v17 = [v93 objectAtIndexedSubscript:v84];

  if (!v17)
  {
LABEL_153:
    v127 = ne_log_obj();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v127, OS_LOG_TYPE_ERROR, "No chosen KE method", buf, 2u);
    }

    id v17 = 0;
    goto LABEL_156;
  }
LABEL_119:
  objc_setProperty_atomic(v8, v94, v17, 112);
  v103 = [v6 additionalKEMProtocols];

  if (!v103)
  {
    v129 = [v8 additionalKEMProtocols];

    if (v129) {
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v8, MEMORY[0x1E4F1CC08]);
    }
    v126 = v8;
    goto LABEL_157;
  }
  int v132 = a3;
  v104 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v17, 0);
  id v105 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v106 = 6;
  v131 = v105;
  v133 = v6;
  v135 = v8;
  while (1)
  {
    v107 = [NSNumber numberWithUnsignedInteger:v106];
    v108 = [v8 additionalKEMProtocols];
    v109 = [v108 objectForKeyedSubscript:v107];

    v110 = [v6 additionalKEMProtocols];
    v111 = [v110 objectForKeyedSubscript:v107];

    if (!v111) {
      goto LABEL_136;
    }
    if (v109) {
      break;
    }
    v119 = [[NEIKEv2KEMProtocol alloc] initWithMethod:0];
    [v105 setObject:v119 forKeyedSubscript:v107];

LABEL_136:
    id v118 = 0;
LABEL_151:

    ++v106;
    long long v8 = v135;
    if (v106 == 13)
    {
      v125 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v105];
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v135, v125);

      v126 = v135;
      goto LABEL_170;
    }
  }
  v134 = v107;
  if (v132)
  {
    long long v142 = 0uLL;
    long long v143 = 0uLL;
    long long v140 = 0uLL;
    long long v141 = 0uLL;
    id v112 = v111;
    uint64_t v113 = [v112 countByEnumeratingWithState:&v140 objects:v177 count:16];
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = *(void *)v141;
      do
      {
        for (uint64_t n = 0; n != v114; ++n)
        {
          if (*(void *)v141 != v115) {
            objc_enumerationMutation(v112);
          }
          uint64_t v117 = [v109 indexOfObject:*(void *)(*((void *)&v140 + 1) + 8 * n)];
          if (v117 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v118 = [v109 objectAtIndexedSubscript:v117];
            if (![v104 containsObject:v118]) {
              goto LABEL_148;
            }
          }
        }
        uint64_t v114 = [v112 countByEnumeratingWithState:&v140 objects:v177 count:16];
      }
      while (v114);
      v111 = v112;
LABEL_163:
      id v105 = v131;
      v107 = v134;
    }
    else
    {
      v111 = v112;
    }
LABEL_166:
  }
  else
  {
    long long v138 = 0uLL;
    long long v139 = 0uLL;
    long long v136 = 0uLL;
    long long v137 = 0uLL;
    id v112 = v109;
    uint64_t v120 = [v112 countByEnumeratingWithState:&v136 objects:v176 count:16];
    if (!v120)
    {
      v109 = v112;
      goto LABEL_166;
    }
    uint64_t v121 = v120;
    uint64_t v122 = *(void *)v137;
LABEL_139:
    uint64_t v123 = 0;
    while (1)
    {
      if (*(void *)v137 != v122) {
        objc_enumerationMutation(v112);
      }
      v124 = *(void **)(*((void *)&v136 + 1) + 8 * v123);
      if (([v104 containsObject:v124] & 1) == 0)
      {
        if ([v111 containsObject:v124]) {
          break;
        }
      }
      if (v121 == ++v123)
      {
        uint64_t v121 = [v112 countByEnumeratingWithState:&v136 objects:v176 count:16];
        if (v121) {
          goto LABEL_139;
        }
        v109 = v112;
        goto LABEL_163;
      }
    }
    id v118 = v124;
LABEL_148:

    id v105 = v131;
    v107 = v134;
    if (v118)
    {
      [v131 setObject:v118 forKeyedSubscript:v134];
      long long v6 = v133;
      if ([v118 method]) {
        [v104 addObject:v118];
      }
      goto LABEL_151;
    }
  }
  long long v6 = v133;
  v130 = ne_log_obj();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v130, OS_LOG_TYPE_ERROR, "No chosen additional KE methods", buf, 2u);
  }

  v126 = 0;
  long long v8 = v135;
LABEL_170:

LABEL_157:
LABEL_158:

LABEL_159:
  return v126;
}

- (void)matchesLocalProposal:(int)a3 preferRemoteProposal:
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v6 = v5;
  if (!a1) {
    goto LABEL_30;
  }
  if (!v5)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal";
    goto LABEL_27;
  }
  long long v7 = [a1 encryptionProtocols];

  if (!v7)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v15 = "BACKTRACE %s called with null self.encryptionProtocols";
LABEL_23:
    uint64_t v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_24;
  }
  long long v8 = [v6 encryptionProtocols];

  if (!v8)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.encryptionProtocols";
LABEL_27:
    _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_28;
  }
  long long v9 = [a1 prfProtocols];

  if (!v9)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v15 = "BACKTRACE %s called with null self.prfProtocols";
    goto LABEL_23;
  }
  uint64_t v10 = [v6 prfProtocols];

  if (!v10)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.prfProtocols";
    goto LABEL_27;
  }
  uint64_t v11 = [a1 kemProtocols];

  if (!v11)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v15 = "BACKTRACE %s called with null self.kemProtocols";
    goto LABEL_23;
  }
  uint64_t v12 = [v6 kemProtocols];

  if (!v12)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    long long v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    id v18 = "%s called with null localProposal.kemProtocols";
    goto LABEL_27;
  }
  if (objc_getProperty(a1, v13, 80, 1))
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v15 = "Not matching proposal with unsupported transform type";
LABEL_12:
      uint64_t v16 = v14;
      uint32_t v17 = 2;
LABEL_24:
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
LABEL_28:

    goto LABEL_29;
  }
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  uint64_t v20 = [v6 encryptionProtocols];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v136 objects:v152 count:16];
  if (!v21) {
    goto LABEL_39;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v137;
LABEL_33:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v137 != v23) {
      objc_enumerationMutation(v20);
    }
    uint64_t v25 = *(void *)(*((void *)&v136 + 1) + 8 * v24);
    uint64_t v26 = [a1 encryptionProtocols];
    int v27 = [v26 containsObject:v25];

    if (v27) {
      break;
    }
    if (v22 == ++v24)
    {
      uint64_t v22 = [v20 countByEnumeratingWithState:&v136 objects:v152 count:16];
      if (!v22)
      {
LABEL_39:

        v28 = ne_log_large_obj();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [a1 encryptionProtocols];
          id v30 = [v6 encryptionProtocols];
          *(_DWORD *)buf = 138412546;
          long long v149 = v29;
          __int16 v150 = 2112;
          long long v151 = v30;
          v31 = "Failed to match encryption algorithms (%@ vs %@)";
          goto LABEL_72;
        }
        goto LABEL_73;
      }
      goto LABEL_33;
    }
  }
  if (v25)
  {
    unint64_t v32 = *(void *)(v25 + 16);
    BOOL v33 = v32 >= 0x20;
    unsigned int v34 = (0xD01C0000 >> v32) & 1;
    if (v33) {
      char v35 = 0;
    }
    else {
      char v35 = v34;
    }
  }
  else
  {
    char v35 = 0;
  }

  unint64_t v36 = [v6 integrityProtocols];
  if ([v36 count])
  {
    BOOL v37 = [a1 integrityProtocols];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      v39 = [v6 integrityProtocols];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v132 objects:v147 count:16];
      if (!v40) {
        goto LABEL_55;
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v133;
LABEL_49:
      uint64_t v43 = 0;
      while (1)
      {
        if (*(void *)v133 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v132 + 1) + 8 * v43);
        v45 = [a1 integrityProtocols];
        LOBYTE(v44) = [v45 containsObject:v44];

        if (v44) {
          break;
        }
        if (v41 == ++v43)
        {
          uint64_t v41 = [v39 countByEnumeratingWithState:&v132 objects:v147 count:16];
          if (!v41)
          {
LABEL_55:

            v28 = ne_log_large_obj();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = [a1 integrityProtocols];
              id v30 = [v6 integrityProtocols];
              *(_DWORD *)buf = 138412546;
              long long v149 = v29;
              __int16 v150 = 2112;
              long long v151 = v30;
              v31 = "Failed to match integrity algorithms (%@ vs %@)";
              goto LABEL_72;
            }
            goto LABEL_73;
          }
          goto LABEL_49;
        }
      }

      goto LABEL_62;
    }
  }
  else
  {
  }
  if ((v35 & 1) == 0)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    id v15 = "Failed to match integrity algorithms, none provided";
    goto LABEL_12;
  }
LABEL_62:
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  uint64_t v46 = [v6 prfProtocols];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v128 objects:v146 count:16];
  if (!v47) {
    goto LABEL_70;
  }
  uint64_t v48 = v47;
  uint64_t v49 = *(void *)v129;
LABEL_64:
  uint64_t v50 = 0;
  while (1)
  {
    if (*(void *)v129 != v49) {
      objc_enumerationMutation(v46);
    }
    uint64_t v51 = *(void *)(*((void *)&v128 + 1) + 8 * v50);
    v52 = [a1 prfProtocols];
    LOBYTE(v51) = [v52 containsObject:v51];

    if (v51) {
      break;
    }
    if (v48 == ++v50)
    {
      uint64_t v48 = [v46 countByEnumeratingWithState:&v128 objects:v146 count:16];
      if (!v48)
      {
LABEL_70:

        v28 = ne_log_large_obj();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [a1 prfProtocols];
          id v30 = [v6 prfProtocols];
          *(_DWORD *)buf = 138412546;
          long long v149 = v29;
          __int16 v150 = 2112;
          long long v151 = v30;
          v31 = "Failed to match PRF algorithms (%@ vs %@)";
LABEL_72:
          _os_log_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_INFO, v31, buf, 0x16u);
        }
LABEL_73:

LABEL_29:
        a1 = 0;
        goto LABEL_30;
      }
      goto LABEL_64;
    }
  }

  v53 = [v6 kemProtocols];
  v54 = [a1 kemProtocols];
  int v55 = [v54 firstObject];
  uint64_t v56 = [v53 indexOfObject:v55];

  if (v56 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
    {
      long long v126 = 0uLL;
      long long v127 = 0uLL;
      long long v124 = 0uLL;
      long long v125 = 0uLL;
      v57 = [a1 kemProtocols];
      uint64_t v58 = [v57 countByEnumeratingWithState:&v124 objects:v145 count:16];
      if (!v58) {
        goto LABEL_94;
      }
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v125;
LABEL_78:
      uint64_t v61 = 0;
      while (1)
      {
        if (*(void *)v125 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v124 + 1) + 8 * v61);
        uint64_t v63 = [v6 kemProtocols];
        uint64_t v64 = [v63 indexOfObject:v62];

        if (v64 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v59 == ++v61)
        {
          uint64_t v59 = [v57 countByEnumeratingWithState:&v124 objects:v145 count:16];
          if (!v59)
          {
LABEL_94:

LABEL_101:
            uint64_t v76 = ne_log_large_obj();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              v77 = [a1 kemProtocols];
              v78 = [v6 kemProtocols];
              *(_DWORD *)buf = 138412546;
              long long v149 = v77;
              __int16 v150 = 2112;
              long long v151 = v78;
              _os_log_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_INFO, "Failed to match Key Exchange methods (%@ vs %@)", buf, 0x16u);
            }
            long long v74 = 0;
            unsigned __int8 v140 = 0;
            goto LABEL_152;
          }
          goto LABEL_78;
        }
      }
      long long v73 = [v6 kemProtocols];
      long long v74 = [v73 objectAtIndexedSubscript:v64];

      goto LABEL_98;
    }
    long long v122 = 0uLL;
    long long v123 = 0uLL;
    long long v120 = 0uLL;
    long long v121 = 0uLL;
    v57 = [v6 kemProtocols];
    uint64_t v66 = [v57 countByEnumeratingWithState:&v120 objects:v144 count:16];
    if (!v66) {
      goto LABEL_94;
    }
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v121;
LABEL_88:
    uint64_t v69 = 0;
    while (1)
    {
      if (*(void *)v121 != v68) {
        objc_enumerationMutation(v57);
      }
      uint64_t v70 = *(void **)(*((void *)&v120 + 1) + 8 * v69);
      uint64_t v71 = [a1 kemProtocols];
      int v72 = [v71 containsObject:v70];

      if (v72) {
        break;
      }
      if (v67 == ++v69)
      {
        uint64_t v67 = [v57 countByEnumeratingWithState:&v120 objects:v144 count:16];
        if (!v67) {
          goto LABEL_94;
        }
        goto LABEL_88;
      }
    }
    id v65 = v70;
  }
  else
  {
    v57 = [v6 kemProtocols];
    id v65 = [v57 objectAtIndexedSubscript:v56];
  }
  long long v74 = v65;
LABEL_98:

  if (!v74) {
    goto LABEL_101;
  }
  int v75 = [a1 additionalKEMProtocols];
  if (v75)
  {
  }
  else
  {
    SEL v79 = [v6 additionalKEMProtocols];

    if (!v79)
    {
      unsigned __int8 v140 = 1;
      goto LABEL_152;
    }
  }
  SEL v80 = [[NEIKEv2KEMProtocol alloc] initWithMethod:0];
  long long v143 = v80;
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];

  v107 = v74;
  v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v74, 0);
  uint64_t v82 = 6;
  unint64_t v83 = 0x1E4F28000uLL;
  int v109 = a3;
  while (1)
  {
    uint64_t v84 = [*(id *)(v83 + 3792) numberWithUnsignedInteger:v82];
    v85 = [v6 additionalKEMProtocols];
    uint64_t v86 = [v85 objectForKeyedSubscript:v84];

    uint64_t v87 = [a1 additionalKEMProtocols];
    uint64_t v88 = [v87 objectForKeyedSubscript:v84];

    if (v86 | v88) {
      break;
    }
LABEL_140:

    if (++v82 == 13)
    {
      unsigned __int8 v140 = 1;
      goto LABEL_151;
    }
  }
  if (v86) {
    BOOL v89 = v88 == 0;
  }
  else {
    BOOL v89 = 1;
  }
  if (v89)
  {
    if (v86) {
      uint64_t v88 = (uint64_t)v108;
    }
    else {
      uint64_t v86 = (uint64_t)v108;
    }
    id v90 = v108;
  }
  uint64_t v110 = v82;
  v111 = v84;
  if (a3)
  {
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v91 = (void *)v88;
    id v92 = (id)v88;
    uint64_t v93 = [v92 countByEnumeratingWithState:&v116 objects:v142 count:16];
    if (!v93)
    {
      v103 = v92;
      goto LABEL_148;
    }
    uint64_t v94 = v93;
    uint64_t v95 = (void *)v86;
    uint64_t v96 = *(void *)v117;
LABEL_119:
    uint64_t v97 = 0;
    while (1)
    {
      if (*(void *)v117 != v96) {
        objc_enumerationMutation(v92);
      }
      uint64_t v98 = *(void **)(*((void *)&v116 + 1) + 8 * v97);
      if (([v81 containsObject:v98] & 1) == 0)
      {
        if ([v95 containsObject:v98]) {
          goto LABEL_137;
        }
      }
      if (v94 == ++v97)
      {
        uint64_t v94 = [v92 countByEnumeratingWithState:&v116 objects:v142 count:16];
        if (v94) {
          goto LABEL_119;
        }
        v103 = v92;
        uint64_t v84 = v111;
        uint64_t v86 = (uint64_t)v95;
        goto LABEL_148;
      }
    }
  }
  v91 = (void *)v88;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v92 = (id)v86;
  uint64_t v99 = [v92 countByEnumeratingWithState:&v112 objects:v141 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v95 = (void *)v86;
    uint64_t v101 = *(void *)v113;
LABEL_129:
    uint64_t v102 = 0;
    while (1)
    {
      if (*(void *)v113 != v101) {
        objc_enumerationMutation(v92);
      }
      uint64_t v98 = *(void **)(*((void *)&v112 + 1) + 8 * v102);
      if (([v81 containsObject:v98] & 1) == 0)
      {
        if ([v91 containsObject:v98]) {
          break;
        }
      }
      if (v100 == ++v102)
      {
        uint64_t v100 = [v92 countByEnumeratingWithState:&v112 objects:v141 count:16];
        if (v100) {
          goto LABEL_129;
        }
        uint64_t v86 = (uint64_t)v92;
        uint64_t v84 = v111;
        goto LABEL_147;
      }
    }
LABEL_137:
    if ([v98 method]) {
      [v81 addObject:v98];
    }

    uint64_t v82 = v110;
    uint64_t v84 = v111;
    a3 = v109;
    unint64_t v83 = 0x1E4F28000;
    goto LABEL_140;
  }
  uint64_t v86 = (uint64_t)v92;
LABEL_147:
  v103 = v91;
LABEL_148:

  v104 = ne_log_large_obj();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
  {
    id v105 = [a1 additionalKEMProtocols];
    uint64_t v106 = [v6 additionalKEMProtocols];
    *(_DWORD *)buf = 138412546;
    long long v149 = v105;
    __int16 v150 = 2112;
    long long v151 = v106;
    _os_log_impl(&dword_19DDAF000, v104, OS_LOG_TYPE_INFO, "Failed to match Additional Key Exchange methods (%@ vs %@)", buf, 0x16u);
  }
  unsigned __int8 v140 = 0;

LABEL_151:
  long long v74 = v107;
LABEL_152:

  a1 = (void *)v140;
LABEL_30:

  return a1;
}

- (char)softLifetimeSecondsForInitiator:(char *)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = [result lifetimeSeconds];
    uint64_t v5 = [v3 lifetimeSeconds];
    unint64_t v6 = v5;
    if (v4 < 0xB)
    {
      result = (char *)[v3 lifetimeSeconds];
      uint64_t v8 = -2;
      if (!a2) {
        uint64_t v8 = -1;
      }
      long long v9 = &result[v8];
      if (v6 >= 2) {
        return v9;
      }
    }
    else
    {
      uint64_t v7 = 8;
      if (!a2) {
        uint64_t v7 = 9;
      }
      return (char *)(v5 * v7 / 0xAuLL);
    }
  }
  return result;
}

- (uint64_t)isAValidResponse
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (objc_getProperty(a1, a2, 80, 1)) {
    return 0;
  }
  if (!a1[8]) {
    return 0;
  }
  uint64_t v5 = [a1 kemProtocols];
  uint64_t v6 = [v5 count];

  if (v6 != 1) {
    return 0;
  }
  uint64_t v7 = [a1 prfProtocols];
  uint64_t v8 = [v7 count];

  if (v8 != 1) {
    return 0;
  }
  long long v9 = [a1 encryptionProtocols];
  uint64_t v10 = [v9 count];

  if (v10 != 1) {
    return 0;
  }
  uint64_t v11 = [a1 encryptionProtocols];
  uint64_t v12 = [v11 firstObject];
  if (!v12)
  {

    goto LABEL_11;
  }
  unint64_t v13 = v12[2] - 29;

  if (v13 < 3) {
    return 0;
  }
LABEL_11:
  uint64_t v14 = [a1 encryptionProtocols];
  id v15 = [v14 firstObject];
  if (v15 && (unint64_t v16 = v15[2] - 18, v16 <= 0xD)) {
    uint64_t v17 = qword_19DF9D448[v16];
  }
  else {
    uint64_t v17 = 1;
  }

  id v18 = [a1 integrityProtocols];
  uint64_t v19 = [v18 count];

  if (v19 != v17) {
    return 0;
  }
  uint64_t v20 = [a1 additionalKEMProtocols];

  if (!v20) {
    return 1;
  }
  uint64_t v21 = [a1 additionalKEMProtocols];
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v21, "count") + 1);
  uint64_t v23 = [a1 kemProtocols];
  uint64_t v24 = [v23 firstObject];
  [v22 addObject:v24];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = objc_msgSend(v25, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
        if ([v30 count] != 1) {
          goto LABEL_32;
        }
        v31 = [v30 firstObject];
        if ([v22 containsObject:v31])
        {

LABEL_32:
          uint64_t v3 = 0;
          goto LABEL_33;
        }
        if ([v31 method]) {
          [v22 addObject:v31];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v3 = 1;
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
LABEL_33:

  return v3;
}

+ (NSObject)chooseSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v24 = v6;
  if (!v6)
  {
    uint64_t v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
LABEL_29:
      long long v9 = 0;
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v38 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    uint64_t v23 = "%s called with null localProposals";
LABEL_31:
    _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_29;
  }
  if (!v7)
  {
    uint64_t v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v38 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    uint64_t v23 = "%s called with null remoteProposals";
    goto LABEL_31;
  }
  if (a4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = v7;
    long long v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = ((char *)i + 1))
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke;
          v30[3] = &unk_1E5990020;
          v30[4] = v12;
          uint64_t v13 = objc_msgSend(v24, "indexOfObjectPassingTest:", v30, v24);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v18 = [v24 objectAtIndexedSubscript:v13];
            uint64_t v19 = v18;
            uint64_t v20 = v12;
            int v21 = 1;
            goto LABEL_24;
          }
        }
        long long v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = v6;
    long long v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v9)
    {
      uint64_t v14 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v9; uint64_t j = ((char *)j + 1))
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v8);
          }
          unint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2;
          v25[3] = &unk_1E5990020;
          v25[4] = v16;
          uint64_t v17 = objc_msgSend(v7, "indexOfObjectPassingTest:", v25, v24);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v19 = [v7 objectAtIndexedSubscript:v17];
            id v18 = v16;
            uint64_t v20 = v19;
            int v21 = 0;
LABEL_24:
            long long v9 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v18, v20, v21);

            goto LABEL_25;
          }
        }
        long long v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
LABEL_25:

  return v9;
}

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke(uint64_t a1, void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](*(void **)(a1 + 32), a2, 1);
}

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2(uint64_t a1, void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](a2, *(void **)(a1 + 32), 0);
}

@end