@interface NEIKEv2ChildSAProposal
+ (NSObject)chooseChildSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:(char)a5 checkKEMethod:;
- (BOOL)isEqual:(id)a3;
- (NEIKEv2ChildSAProposal)init;
- (NSArray)encryptionProtocols;
- (NSArray)integrityProtocols;
- (NSArray)kemProtocols;
- (NSDictionary)additionalKEMProtocols;
- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:(char)a4 checkKEMethod:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)encryptionProtocol;
- (id)integrityProtocol;
- (uint64_t)isAValidResponse;
- (uint64_t)matchesLocalProposal:(int)a3 preferRemoteProposal:(int)a4 checkKEMethod:;
- (unint64_t)hash;
- (unint64_t)lifetimeSeconds;
- (unint64_t)protocol;
- (void)copyForRekey;
- (void)copyWithoutKEM;
- (void)setAdditionalKEMProtocols:(id)a3;
- (void)setEncryptionProtocols:(id)a3;
- (void)setIntegrityProtocols:(id)a3;
- (void)setKemProtocols:(id)a3;
- (void)setLifetimeSeconds:(unint64_t)a3;
- (void)setProtocol:(unint64_t)a3;
@end

@implementation NEIKEv2ChildSAProposal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenAdditionalKETransforms, 0);
  objc_storeStrong((id *)&self->_chosenKEMProtocol, 0);
  objc_storeStrong((id *)&self->_chosenIntegrityProtocol, 0);
  objc_storeStrong((id *)&self->_chosenEncryptionProtocol, 0);
  objc_storeStrong((id *)&self->_remoteSPI, 0);
  objc_storeStrong((id *)&self->_spi, 0);
  objc_storeStrong((id *)&self->_unsupportedTransformTypes, 0);
  objc_storeStrong((id *)&self->_additionalKEMProtocols, 0);
  objc_storeStrong((id *)&self->_kemProtocols, 0);
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

- (void)setIntegrityProtocols:(id)a3
{
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (unint64_t)protocol
{
  return self->_protocol;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProtocol:", -[NEIKEv2ChildSAProposal protocol](self, "protocol"));
  v5 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];

  unint64_t v6 = 0x1E4F1C000uLL;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
    v8 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];
    v9 = (void *)[v7 initWithArray:v8 copyItems:1];
    [v4 setEncryptionProtocols:v9];
  }
  v10 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
    v12 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];
    v13 = (void *)[v11 initWithArray:v12 copyItems:1];
    [v4 setIntegrityProtocols:v13];
  }
  v14 = [(NEIKEv2ChildSAProposal *)self kemProtocols];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C978]);
    v16 = [(NEIKEv2ChildSAProposal *)self kemProtocols];
    v17 = (void *)[v15 initWithArray:v16 copyItems:1];
    [v4 setKemProtocols:v17];
  }
  if (!self)
  {
    [v4 setAdditionalKEMProtocols:0];
    v37 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v18 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];

  if (v18)
  {
    v64 = v4;
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v20 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
    v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
    uint64_t v22 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v67 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          unint64_t v27 = v6;
          id v28 = objc_alloc(*(Class *)(v6 + 2424));
          v29 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
          v30 = [v29 objectForKeyedSubscript:v26];
          v31 = (void *)[v28 initWithArray:v30 copyItems:1];
          [v21 setObject:v31 forKeyedSubscript:v26];

          unint64_t v6 = v27;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v23);
    }

    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v21];
    v4 = v64;
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v4, "setAdditionalKEMProtocols:", v32, v64);

  if (objc_getProperty(self, v33, 72, 1))
  {
    id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v37 = objc_msgSend(v34, "initWithSet:", objc_getProperty(self, v35, 72, 1));
    if (v4) {
      objc_setProperty_atomic(v4, v36, v37, 72);
    }
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v4, "setLifetimeSeconds:", -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"));
  if (self)
  {
    unsigned __int8 proposalNumber = self->_proposalNumber;
    if (!v4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unsigned __int8 proposalNumber = 0;
  if (v4) {
LABEL_24:
  }
    v4[8] = proposalNumber;
LABEL_25:
  if (self) {
    id Property = objc_getProperty(self, v38, 80, 1);
  }
  else {
    id Property = 0;
  }
  v42 = (void *)[Property copy];
  if (v4) {
    objc_setProperty_atomic(v4, v41, v42, 80);
  }

  if (self) {
    id v44 = objc_getProperty(self, v43, 88, 1);
  }
  else {
    id v44 = 0;
  }
  v46 = (void *)[v44 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v45, v46, 88);
  }

  if (self) {
    id v48 = objc_getProperty(self, v47, 96, 1);
  }
  else {
    id v48 = 0;
  }
  v50 = (void *)[v48 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v49, v50, 96);
  }

  if (self) {
    id v52 = objc_getProperty(self, v51, 104, 1);
  }
  else {
    id v52 = 0;
  }
  v54 = (void *)[v52 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v53, v54, 104);
  }

  if (self) {
    id v56 = objc_getProperty(self, v55, 112, 1);
  }
  else {
    id v56 = 0;
  }
  v58 = (void *)[v56 copy];
  if (v4) {
    objc_setProperty_atomic(v4, v57, v58, 112);
  }

  v59 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);

  if (v59)
  {
    id v60 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v61 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v62 = (void *)[v60 initWithDictionary:v61 copyItems:1];
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v4, v62);
  }
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NEIKEv2ChildSAProposal *)self protocol];
  v4 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];
  uint64_t v5 = [v4 hash];

  if (self) {
    id Property = objc_getProperty(self, v6, 96, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v8 = [Property hash];
  v9 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];
  uint64_t v10 = [v9 hash];

  if (self) {
    id v12 = objc_getProperty(self, v11, 104, 1);
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = [v12 hash];
  v14 = [(NEIKEv2ChildSAProposal *)self kemProtocols];
  uint64_t v15 = [v14 hash];

  if (self) {
    id v17 = objc_getProperty(self, v16, 112, 1);
  }
  else {
    id v17 = 0;
  }
  uint64_t v18 = v5 ^ v3 ^ v8 ^ v10 ^ v13 ^ v15 ^ [v17 hash];
  id v19 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
  uint64_t v20 = [v19 hash];

  v21 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  uint64_t v22 = v20 ^ [v21 hash];

  return v18 ^ v22 ^ [(NEIKEv2ChildSAProposal *)self lifetimeSeconds];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2ChildSAProposal *)self protocol];
    if (v6 == [v5 protocol])
    {
      id v7 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];
      uint64_t v8 = [v5 encryptionProtocols];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        uint64_t v10 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];
        id v11 = [v5 encryptionProtocols];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_47;
        }
      }
      if (self) {
        id Property = objc_getProperty(self, v13, 96, 1);
      }
      else {
        id Property = 0;
      }
      id v16 = Property;
      id v18 = objc_getProperty(v5, v17, 96, 1);
      if (v16 == v18)
      {
      }
      else
      {
        uint64_t v20 = v18;
        if (self) {
          id v21 = objc_getProperty(self, v19, 96, 1);
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;
        int v24 = objc_msgSend(v22, "isEqual:", objc_getProperty(v5, v23, 96, 1));

        if (!v24) {
          goto LABEL_47;
        }
      }
      v25 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];
      uint64_t v26 = [v5 integrityProtocols];
      if (v25 == (void *)v26)
      {
      }
      else
      {
        unint64_t v27 = (void *)v26;
        id v28 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];
        v29 = [v5 integrityProtocols];
        int v30 = [v28 isEqual:v29];

        if (!v30) {
          goto LABEL_47;
        }
      }
      if (self) {
        id v32 = objc_getProperty(self, v31, 104, 1);
      }
      else {
        id v32 = 0;
      }
      id v33 = v32;
      id v35 = objc_getProperty(v5, v34, 104, 1);
      if (v33 == v35)
      {
      }
      else
      {
        v37 = v35;
        if (self) {
          id v38 = objc_getProperty(self, v36, 104, 1);
        }
        else {
          id v38 = 0;
        }
        id v39 = v38;
        int v41 = objc_msgSend(v39, "isEqual:", objc_getProperty(v5, v40, 104, 1));

        if (!v41) {
          goto LABEL_47;
        }
      }
      v42 = [(NEIKEv2ChildSAProposal *)self kemProtocols];
      uint64_t v43 = [v5 kemProtocols];
      if (v42 == (void *)v43)
      {
      }
      else
      {
        id v44 = (void *)v43;
        v45 = [(NEIKEv2ChildSAProposal *)self kemProtocols];
        v46 = [v5 kemProtocols];
        int v47 = [v45 isEqual:v46];

        if (!v47) {
          goto LABEL_47;
        }
      }
      if (self) {
        id v49 = objc_getProperty(self, v48, 112, 1);
      }
      else {
        id v49 = 0;
      }
      id v50 = v49;
      id v52 = objc_getProperty(v5, v51, 112, 1);
      if (v50 == v52)
      {
      }
      else
      {
        v54 = v52;
        if (self) {
          id v55 = objc_getProperty(self, v53, 112, 1);
        }
        else {
          id v55 = 0;
        }
        id v56 = v55;
        int v58 = objc_msgSend(v56, "isEqual:", objc_getProperty(v5, v57, 112, 1));

        if (!v58) {
          goto LABEL_47;
        }
      }
      v59 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
      uint64_t v60 = [v5 additionalKEMProtocols];
      if (v59 == (void *)v60)
      {
      }
      else
      {
        v61 = (void *)v60;
        v62 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
        v63 = [v5 additionalKEMProtocols];
        int v64 = [v62 isEqual:v63];

        if (!v64) {
          goto LABEL_47;
        }
      }
      v65 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
      uint64_t v66 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
      if (v65 == (void *)v66)
      {
      }
      else
      {
        long long v67 = (void *)v66;
        long long v68 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
        long long v69 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
        int v70 = [v68 isEqual:v69];

        if (!v70) {
          goto LABEL_47;
        }
      }
      unint64_t v72 = [(NEIKEv2ChildSAProposal *)self lifetimeSeconds];
      BOOL v14 = v72 == [v5 lifetimeSeconds];
      goto LABEL_48;
    }
LABEL_47:
    BOOL v14 = 0;
LABEL_48:

    goto LABEL_49;
  }
  BOOL v14 = 0;
LABEL_49:

  return v14;
}

- (id)description
{
  return [(NEIKEv2ChildSAProposal *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  uint64_t v8 = v7;
  if (self)
  {
    [v7 appendPrettyInt:self->_proposalNumber withName:@"Number" andIndent:v5 options:a4];
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 80, 1), @"Local SPI", v5, a4);
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 88, 1), @"Remote SPI", v5, a4);
    id Property = objc_getProperty(self, v11, 96, 1);
  }
  else
  {
    [v7 appendPrettyInt:0 withName:@"Number" andIndent:v5 options:a4];
    [v8 appendPrettyObject:0 withName:@"Local SPI" andIndent:v5 options:a4];
    [v8 appendPrettyObject:0 withName:@"Remote SPI" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v8 appendPrettyObject:Property withName:@"Chosen Encryption" andIndent:v5 options:a4];
  uint64_t v13 = [(NEIKEv2ChildSAProposal *)self encryptionProtocols];
  [v8 appendPrettyObject:v13 withName:@"Encryption" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v14, 104, 1), @"Chosen Integrity", v5, a4);
    uint64_t v15 = [(NEIKEv2ChildSAProposal *)self integrityProtocols];
    [v8 appendPrettyObject:v15 withName:@"Integrity" andIndent:v5 options:a4];

    id v17 = objc_getProperty(self, v16, 112, 1);
  }
  else
  {
    [v8 appendPrettyObject:0 withName:@"Chosen Integrity" andIndent:v5 options:a4];
    int v24 = [0 integrityProtocols];
    [v8 appendPrettyObject:v24 withName:@"Integrity" andIndent:v5 options:a4];

    id v17 = 0;
  }
  [v8 appendPrettyObject:v17 withName:@"Chosen KE" andIndent:v5 options:a4];
  id v18 = [(NEIKEv2ChildSAProposal *)self kemProtocols];
  [v8 appendPrettyObject:v18 withName:@"KE" andIndent:v5 options:a4];

  id v19 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  [v8 appendPrettyObject:v19 withName:@"Chosen ADDKE" andIndent:v5 options:a4];

  uint64_t v20 = [(NEIKEv2ChildSAProposal *)self additionalKEMProtocols];
  [v8 appendPrettyObject:v20 withName:@"ADDKE" andIndent:v5 options:a4];

  if (self) {
    id v22 = objc_getProperty(self, v21, 72, 1);
  }
  else {
    id v22 = 0;
  }
  [v8 appendPrettyObject:v22 withName:@"Unsupported Transform Types" andIndent:v5 options:a4];
  if ([(NEIKEv2ChildSAProposal *)self lifetimeSeconds]) {
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", (int)-[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"), @"Lifetime", v5, a4);
  }

  return v8;
}

- (NEIKEv2ChildSAProposal)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ChildSAProposal;
  v2 = [(NEIKEv2ChildSAProposal *)&v8 init];
  unint64_t v3 = v2;
  if (v2)
  {
    [(NEIKEv2ChildSAProposal *)v2 setProtocol:3];
    v3->_noESNTransformPresent = 1;
    id v4 = v3;
  }
  else
  {
    unint64_t v6 = ne_log_obj();
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
    if (objc_getProperty(self, a2, 96, 1))
    {
      id v2 = objc_getProperty(v2, v3, 96, 1);
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
    if (objc_getProperty(self, a2, 104, 1))
    {
      id v2 = objc_getProperty(v2, v3, 104, 1);
    }
    else
    {
      id v4 = [v2 integrityProtocols];
      id v2 = [v4 firstObject];
    }
  }

  return v2;
}

- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:(char)a4 checkKEMethod:
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_super v8 = v7;
  if (!a1)
  {
    v74 = 0;
    goto LABEL_165;
  }
  if (!v7)
  {
    SEL v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v162 = "-[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }
    goto LABEL_163;
  }
  SEL v9 = [a1 copy];
  if (!objc_getProperty(v8, v10, 80, 1))
  {
    id v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_162;
    }
    *(_WORD *)buf = 0;
    id v22 = "Remote proposal has invalid SPI";
LABEL_167:
    _os_log_error_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_162;
  }
  id Property = objc_getProperty(v8, v11, 80, 1);
  if (v9)
  {
    objc_setProperty_atomic(v9, v13, Property, 88);
    if (v8[8])
    {
      LOBYTE(v9[1].isa) = v8[8];
      goto LABEL_7;
    }
LABEL_161:
    id v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v22 = "Remote proposal has invalid proposal number 0";
      goto LABEL_167;
    }
    goto LABEL_162;
  }
  if (!v8[8]) {
    goto LABEL_161;
  }
LABEL_7:
  if (a3)
  {
    long long v151 = 0uLL;
    long long v152 = 0uLL;
    long long v149 = 0uLL;
    long long v150 = 0uLL;
    BOOL v14 = [v8 encryptionProtocols];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v149 objects:v160 count:16];
    if (!v15) {
      goto LABEL_34;
    }
    uint64_t v16 = *(void *)v150;
LABEL_10:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v150 != v16) {
        objc_enumerationMutation(v14);
      }
      uint64_t v18 = *(void *)(*((void *)&v149 + 1) + 8 * v17);
      id v19 = [v9 encryptionProtocols];
      uint64_t v20 = [v19 indexOfObject:v18];

      if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v14 countByEnumeratingWithState:&v149 objects:v160 count:16];
        if (v15) {
          goto LABEL_10;
        }
        goto LABEL_34;
      }
    }
    uint64_t v15 = [v9 encryptionProtocols];
    int v30 = [(id)v15 objectAtIndexedSubscript:v20];
    id v32 = v30;
    if (!v9)
    {

      SEL v34 = 0;
      LOBYTE(v15) = 0;
      goto LABEL_33;
    }
    objc_setProperty_atomic(v9, v31, v30, 96);

    SEL v34 = objc_getProperty(v9, v33, 96, 1);
    if (v34)
    {
      unint64_t v35 = v34[2];
      if (v35 <= 0x1F && ((1 << v35) & 0xD01C0000) != 0) {
        goto LABEL_32;
      }
    }
    goto LABEL_56;
  }
  long long v147 = 0uLL;
  long long v148 = 0uLL;
  long long v145 = 0uLL;
  long long v146 = 0uLL;
  BOOL v14 = [v9 encryptionProtocols];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v145 objects:v159 count:16];
  if (!v15) {
    goto LABEL_34;
  }
  char v118 = a4;
  int v23 = a3;
  uint64_t v24 = *(void *)v146;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v146 != v24) {
        objc_enumerationMutation(v14);
      }
      uint64_t v26 = *(void **)(*((void *)&v145 + 1) + 8 * i);
      unint64_t v27 = [v8 encryptionProtocols];
      int v28 = [v27 containsObject:v26];

      if (v28)
      {
        if (v9)
        {
          objc_setProperty_atomic(v9, v29, v26, 96);
          SEL v34 = objc_getProperty(v9, v46, 96, 1);
          a3 = v23;
          if (v34)
          {
            unint64_t v47 = v34[2];
            BOOL v48 = v47 > 0x1F;
            uint64_t v49 = (1 << v47) & 0xD01C0000;
            BOOL v50 = v48 || v49 == 0;
            a4 = v118;
            if (!v50)
            {
LABEL_32:
              LOBYTE(v15) = 1;
LABEL_33:

              goto LABEL_34;
            }
LABEL_56:
            LOBYTE(v15) = 0;
            goto LABEL_33;
          }
          LOBYTE(v15) = 0;
        }
        else
        {
          SEL v34 = 0;
          LOBYTE(v15) = 0;
          a3 = v23;
        }
        a4 = v118;
        goto LABEL_33;
      }
    }
    uint64_t v15 = [v14 countByEnumeratingWithState:&v145 objects:v159 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  a3 = v23;
  a4 = v118;
LABEL_34:

  if (!v9 || !objc_getProperty(v9, v36, 96, 1))
  {
    id v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_162;
    }
    *(_WORD *)buf = 0;
    id v22 = "No chosen encryption protocol";
    goto LABEL_167;
  }
  if ((v15 & 1) == 0)
  {
    if (a3)
    {
      long long v143 = 0uLL;
      long long v144 = 0uLL;
      long long v141 = 0uLL;
      long long v142 = 0uLL;
      v37 = [v8 integrityProtocols];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v141 objects:v158 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        char v119 = a4;
        int v40 = a3;
        uint64_t v41 = *(void *)v142;
        while (2)
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v142 != v41) {
              objc_enumerationMutation(v37);
            }
            uint64_t v43 = *(void *)(*((void *)&v141 + 1) + 8 * j);
            id v44 = [v9 integrityProtocols];
            uint64_t v45 = [v44 indexOfObject:v43];

            if (v45 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v59 = [v9 integrityProtocols];
              uint64_t v60 = [v59 objectAtIndexedSubscript:v45];
              objc_setProperty_atomic(v9, v61, v60, 104);

              goto LABEL_68;
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v141 objects:v158 count:16];
          if (v39) {
            continue;
          }
          goto LABEL_68;
        }
      }
    }
    else
    {
      long long v139 = 0uLL;
      long long v140 = 0uLL;
      long long v137 = 0uLL;
      long long v138 = 0uLL;
      v37 = [v9 integrityProtocols];
      uint64_t v51 = [v37 countByEnumeratingWithState:&v137 objects:v157 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        char v119 = a4;
        int v40 = a3;
        uint64_t v53 = *(void *)v138;
        while (2)
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (*(void *)v138 != v53) {
              objc_enumerationMutation(v37);
            }
            id v55 = *(void **)(*((void *)&v137 + 1) + 8 * k);
            id v56 = [v8 integrityProtocols];
            int v57 = [v56 containsObject:v55];

            if (v57)
            {
              objc_setProperty_atomic(v9, v58, v55, 104);
              goto LABEL_68;
            }
          }
          uint64_t v52 = [v37 countByEnumeratingWithState:&v137 objects:v157 count:16];
          if (v52) {
            continue;
          }
          break;
        }
LABEL_68:
        a3 = v40;
        a4 = v119;
      }
    }

    if (!objc_getProperty(v9, v62, 104, 1))
    {
      id v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v22 = "No chosen integrity protocol";
        goto LABEL_167;
      }
LABEL_162:

LABEL_163:
      v74 = 0;
      goto LABEL_164;
    }
  }
  if ((a4 & 1) == 0)
  {
    SEL v9 = v9;
    v74 = v9;
    goto LABEL_164;
  }
  v63 = [v9 kemProtocols];
  int v64 = [v8 kemProtocols];
  v65 = v64;
  if (!v64)
  {
    v74 = v9;
    goto LABEL_155;
  }
  if (!v63)
  {
    v75 = [[NEIKEv2KEMProtocol alloc] initWithMethod:0];
    goto LABEL_90;
  }
  uint64_t v66 = [v64 firstObject];
  uint64_t v67 = [v63 indexOfObject:v66];

  if (v67 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v75 = [v63 objectAtIndexedSubscript:v67];
LABEL_90:
    v77 = v75;
    if (!v75) {
      goto LABEL_144;
    }
    goto LABEL_91;
  }
  if (a3)
  {
    long long v135 = 0uLL;
    long long v136 = 0uLL;
    long long v133 = 0uLL;
    long long v134 = 0uLL;
    id v68 = v65;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v133 objects:v156 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v134;
      while (2)
      {
        for (uint64_t m = 0; m != v70; ++m)
        {
          if (*(void *)v134 != v71) {
            objc_enumerationMutation(v68);
          }
          uint64_t v73 = [v63 indexOfObject:*(void *)(*((void *)&v133 + 1) + 8 * m)];
          if (v73 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v108 = [v63 objectAtIndexedSubscript:v73];
            goto LABEL_142;
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v133 objects:v156 count:16];
        if (v70) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v131 = 0uLL;
    long long v132 = 0uLL;
    long long v129 = 0uLL;
    long long v130 = 0uLL;
    id v68 = v63;
    uint64_t v81 = [v68 countByEnumeratingWithState:&v129 objects:v155 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v130;
      while (2)
      {
        for (uint64_t n = 0; n != v82; ++n)
        {
          if (*(void *)v130 != v83) {
            objc_enumerationMutation(v68);
          }
          v85 = *(void **)(*((void *)&v129 + 1) + 8 * n);
          if ([v65 containsObject:v85])
          {
            v108 = v85;
LABEL_142:
            v77 = v108;
            goto LABEL_143;
          }
        }
        uint64_t v82 = [v68 countByEnumeratingWithState:&v129 objects:v155 count:16];
        if (v82) {
          continue;
        }
        break;
      }
    }
  }
  v77 = 0;
LABEL_143:

  if (!v77)
  {
LABEL_144:
    v109 = ne_log_obj();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v109, OS_LOG_TYPE_ERROR, "No chosen KE method", buf, 2u);
    }

    v74 = 0;
    goto LABEL_155;
  }
LABEL_91:
  objc_setProperty_atomic(v9, v76, v77, 112);
  v78 = [v8 additionalKEMProtocols];

  if (!v78)
  {
    v80 = [v9 additionalKEMProtocols];

    if (v80) {
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v9, MEMORY[0x1E4F1CC08]);
    }
    v74 = v9;

    goto LABEL_155;
  }
  v114 = v65;
  v112 = v63;
  v113 = v77;
  if ([(NEIKEv2KEMProtocol *)v77 method]) {
    id v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v77, 0);
  }
  else {
    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  v86 = v79;
  id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v88 = 6;
  v115 = v87;
  v116 = v8;
  int v117 = a3;
  while (2)
  {
    v89 = [NSNumber numberWithUnsignedInteger:v88];
    v90 = [v9 additionalKEMProtocols];
    v91 = [v90 objectForKeyedSubscript:v89];

    v92 = [v8 additionalKEMProtocols];
    v93 = [v92 objectForKeyedSubscript:v89];

    if (!v93)
    {
LABEL_123:
      id v100 = 0;
LABEL_138:

      if (++v88 == 13)
      {
        v107 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v87];
        -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v9, v107);

        v74 = v9;
        v63 = v112;
        goto LABEL_154;
      }
      continue;
    }
    break;
  }
  if (!v91)
  {
    v101 = [[NEIKEv2KEMProtocol alloc] initWithMethod:0];
    [v87 setObject:v101 forKeyedSubscript:v89];

    goto LABEL_123;
  }
  v120 = v89;
  if (a3)
  {
    long long v127 = 0uLL;
    long long v128 = 0uLL;
    long long v125 = 0uLL;
    long long v126 = 0uLL;
    id v94 = v93;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v125 objects:v154 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v126;
      do
      {
        for (iuint64_t i = 0; ii != v96; ++ii)
        {
          if (*(void *)v126 != v97) {
            objc_enumerationMutation(v94);
          }
          uint64_t v99 = [v91 indexOfObject:*(void *)(*((void *)&v125 + 1) + 8 * ii)];
          if (v99 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v100 = [v91 objectAtIndexedSubscript:v99];
            if (![v86 containsObject:v100]) {
              goto LABEL_135;
            }
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v125 objects:v154 count:16];
      }
      while (v96);
      v93 = v94;
LABEL_147:
      id v87 = v115;
    }
    else
    {
      v93 = v94;
    }
    v89 = v120;
LABEL_150:
  }
  else
  {
    long long v123 = 0uLL;
    long long v124 = 0uLL;
    long long v121 = 0uLL;
    long long v122 = 0uLL;
    id v94 = v91;
    uint64_t v102 = [v94 countByEnumeratingWithState:&v121 objects:v153 count:16];
    if (!v102)
    {
      v91 = v94;
      goto LABEL_150;
    }
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v122;
LABEL_126:
    uint64_t v105 = 0;
    while (1)
    {
      if (*(void *)v122 != v104) {
        objc_enumerationMutation(v94);
      }
      v106 = *(void **)(*((void *)&v121 + 1) + 8 * v105);
      if (([v86 containsObject:v106] & 1) == 0)
      {
        if ([v93 containsObject:v106]) {
          break;
        }
      }
      if (v103 == ++v105)
      {
        uint64_t v103 = [v94 countByEnumeratingWithState:&v121 objects:v153 count:16];
        if (v103) {
          goto LABEL_126;
        }
        v91 = v94;
        goto LABEL_147;
      }
    }
    id v100 = v106;
LABEL_135:

    a3 = v117;
    id v87 = v115;
    v89 = v120;
    if (v100)
    {
      [v115 setObject:v100 forKeyedSubscript:v120];
      objc_super v8 = v116;
      if ([v100 method]) {
        [v86 addObject:v100];
      }
      goto LABEL_138;
    }
  }
  objc_super v8 = v116;
  v63 = v112;
  v110 = ne_log_obj();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v110, OS_LOG_TYPE_ERROR, "No chosen additional KE methods", buf, 2u);
  }

  v74 = 0;
LABEL_154:

  v65 = v114;
LABEL_155:

LABEL_164:
LABEL_165:

  return v74;
}

- (void)copyForRekey
{
  if (!a1) {
    return 0;
  }
  v1 = (void *)[a1 copy];
  unint64_t v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0, 80);
    objc_setProperty_atomic(v3, v4, 0, 88);
    objc_setProperty_atomic(v3, v5, 0, 96);
    objc_setProperty_atomic(v3, v6, 0, 104);
    objc_setProperty_atomic(v3, v7, 0, 112);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0);
  }
  return v3;
}

- (void)copyWithoutKEM
{
  if (!a1) {
    return 0;
  }
  v1 = (void *)[a1 copy];
  unint64_t v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0, 112);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0);
  }
  [v3 setKemProtocols:0];
  [v3 setAdditionalKEMProtocols:0];
  return v3;
}

- (uint64_t)matchesLocalProposal:(int)a3 preferRemoteProposal:(int)a4 checkKEMethod:
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_super v8 = v7;
  if (!a1) {
    goto LABEL_51;
  }
  if (!v7)
  {
    int v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    long long v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    uint64_t v16 = "%s called with null localProposal";
    goto LABEL_12;
  }
  SEL v9 = [(id)a1 encryptionProtocols];

  if (!v9)
  {
    int v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
      uint64_t v13 = "BACKTRACE %s called with null self.encryptionProtocols";
      BOOL v14 = v12;
      uint32_t v15 = 12;
LABEL_17:
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_49;
    }
    goto LABEL_49;
  }
  SEL v10 = [v8 encryptionProtocols];

  if (!v10)
  {
    int v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136315138;
    long long v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    uint64_t v16 = "%s called with null localProposal.encryptionProtocols";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, v16, buf, 0xCu);
    goto LABEL_49;
  }
  if (objc_getProperty((id)a1, v11, 72, 1))
  {
    int v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Not matching proposal with unsupported transform type";
LABEL_16:
      BOOL v14 = v12;
      uint32_t v15 = 2;
      goto LABEL_17;
    }
    goto LABEL_49;
  }
  if ((*(unsigned char *)(a1 + 9) & 1) == 0)
  {
    int v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Not matching proposal missing No ESN transform";
      goto LABEL_16;
    }
LABEL_49:

    goto LABEL_50;
  }
  int v99 = a3;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v17 = [v8 encryptionProtocols];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (!v18) {
    goto LABEL_26;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v121;
LABEL_20:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v121 != v20) {
      objc_enumerationMutation(v17);
    }
    uint64_t v22 = *(void *)(*((void *)&v120 + 1) + 8 * v21);
    int v23 = [(id)a1 encryptionProtocols];
    int v24 = [v23 containsObject:v22];

    if (v24) {
      break;
    }
    if (v19 == ++v21)
    {
      uint64_t v19 = [v17 countByEnumeratingWithState:&v120 objects:v135 count:16];
      if (!v19)
      {
LABEL_26:

        v25 = ne_log_large_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = [(id)a1 encryptionProtocols];
          unint64_t v27 = [v8 encryptionProtocols];
          *(_DWORD *)buf = 138412546;
          long long v132 = v26;
          __int16 v133 = 2112;
          long long v134 = v27;
          int v28 = "Failed to match encryption algorithms (%@ vs %@)";
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      goto LABEL_20;
    }
  }
  if (v22)
  {
    unint64_t v29 = *(void *)(v22 + 16);
    BOOL v30 = v29 >= 0x20;
    unsigned int v31 = (0xD01C0000 >> v29) & 1;
    if (v30) {
      char v32 = 0;
    }
    else {
      char v32 = v31;
    }
  }
  else
  {
    char v32 = 0;
  }

  SEL v33 = [v8 integrityProtocols];
  if ([v33 count])
  {
    SEL v34 = [(id)a1 integrityProtocols];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      v36 = [v8 integrityProtocols];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v116 objects:v130 count:16];
      if (!v37) {
        goto LABEL_44;
      }
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v117;
LABEL_38:
      uint64_t v40 = 0;
      while (1)
      {
        if (*(void *)v117 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v116 + 1) + 8 * v40);
        v42 = [(id)a1 integrityProtocols];
        LOBYTE(v41) = [v42 containsObject:v41];

        if (v41) {
          break;
        }
        if (v38 == ++v40)
        {
          uint64_t v38 = [v36 countByEnumeratingWithState:&v116 objects:v130 count:16];
          if (!v38)
          {
LABEL_44:

            v25 = ne_log_large_obj();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = [(id)a1 integrityProtocols];
              unint64_t v27 = [v8 integrityProtocols];
              *(_DWORD *)buf = 138412546;
              long long v132 = v26;
              __int16 v133 = 2112;
              long long v134 = v27;
              int v28 = "Failed to match integrity algorithms (%@ vs %@)";
LABEL_28:
              _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_INFO, v28, buf, 0x16u);
            }
LABEL_29:

LABEL_50:
            a1 = 0;
            goto LABEL_51;
          }
          goto LABEL_38;
        }
      }

      goto LABEL_53;
    }
  }
  else
  {
  }
  if ((v32 & 1) == 0)
  {
    int v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = "Failed to match integrity algorithms, none provided";
    goto LABEL_16;
  }
LABEL_53:
  if (!a4
    || ([v8 kemProtocols],
        uint64_t v44 = objc_claimAutoreleasedReturnValue(),
        [(id)a1 kemProtocols],
        uint64_t v45 = objc_claimAutoreleasedReturnValue(),
        !(v45 | v44)))
  {
    a1 = 1;
    goto LABEL_51;
  }
  SEL v46 = (void *)v45;
  unint64_t v47 = [[NEIKEv2KEMProtocol alloc] initWithMethod:0];
  long long v129 = v47;
  uint64_t v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];

  if (!v44 || !v46)
  {
    if (v44) {
      SEL v46 = v96;
    }
    else {
      uint64_t v44 = (uint64_t)v96;
    }
    id v48 = v96;
  }
  uint64_t v49 = [v46 firstObject];
  uint64_t v50 = [(id)v44 indexOfObject:v49];

  int v51 = v99;
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v99)
    {
      long long v114 = 0uLL;
      long long v115 = 0uLL;
      long long v112 = 0uLL;
      long long v113 = 0uLL;
      id v52 = v46;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v112 objects:v128 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v113;
        while (2)
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v113 != v55) {
              objc_enumerationMutation(v52);
            }
            uint64_t v57 = [(id)v44 indexOfObject:*(void *)(*((void *)&v112 + 1) + 8 * i)];
            if (v57 != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v64 = [(id)v44 objectAtIndexedSubscript:v57];
              goto LABEL_86;
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v112 objects:v128 count:16];
          if (v54) {
            continue;
          }
          break;
        }
LABEL_82:
        int v58 = 0;
LABEL_87:
        int v51 = v99;
        goto LABEL_88;
      }
    }
    else
    {
      long long v110 = 0uLL;
      long long v111 = 0uLL;
      long long v108 = 0uLL;
      long long v109 = 0uLL;
      id v52 = (id)v44;
      uint64_t v59 = [v52 countByEnumeratingWithState:&v108 objects:v127 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v109;
        while (2)
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v109 != v61) {
              objc_enumerationMutation(v52);
            }
            v63 = *(void **)(*((void *)&v108 + 1) + 8 * j);
            if ([v46 containsObject:v63])
            {
              id v64 = v63;
LABEL_86:
              int v58 = v64;
              goto LABEL_87;
            }
          }
          uint64_t v60 = [v52 countByEnumeratingWithState:&v108 objects:v127 count:16];
          if (v60) {
            continue;
          }
          goto LABEL_82;
        }
      }
    }
    int v58 = 0;
LABEL_88:

    goto LABEL_89;
  }
  int v58 = [(id)v44 objectAtIndexedSubscript:v50];
LABEL_89:
  if (!v58)
  {
    uint64_t v66 = ne_log_large_obj();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      uint64_t v67 = [(id)a1 kemProtocols];
      id v68 = [v8 kemProtocols];
      *(_DWORD *)buf = 138412546;
      long long v132 = v67;
      __int16 v133 = 2112;
      long long v134 = v68;
      _os_log_impl(&dword_19DDAF000, v66, OS_LOG_TYPE_INFO, "Failed to match Key Exchange methods (%@ vs %@)", buf, 0x16u);
    }
    unsigned __int8 v124 = 0;
    goto LABEL_147;
  }
  v65 = [(id)a1 additionalKEMProtocols];
  if (v65)
  {
  }
  else
  {
    uint64_t v69 = [v8 additionalKEMProtocols];

    if (!v69)
    {
      unsigned __int8 v124 = 1;
      goto LABEL_147;
    }
  }
  uint64_t v94 = v44;
  v93 = v58;
  if ([v58 method]) {
    id v70 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v58, 0);
  }
  else {
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v71 = v70;
  uint64_t v72 = 6;
  uint64_t v95 = v46;
  while (1)
  {
    uint64_t v73 = [NSNumber numberWithUnsignedInteger:v72];
    v74 = [v8 additionalKEMProtocols];
    uint64_t v75 = [v74 objectForKeyedSubscript:v73];

    v76 = [(id)a1 additionalKEMProtocols];
    uint64_t v77 = [v76 objectForKeyedSubscript:v73];

    if (v75 | v77) {
      break;
    }
LABEL_134:

    if (++v72 == 13)
    {
      unsigned __int8 v124 = 1;
      goto LABEL_146;
    }
  }
  if (v75) {
    BOOL v78 = v77 == 0;
  }
  else {
    BOOL v78 = 1;
  }
  if (v78)
  {
    if (v75) {
      uint64_t v77 = (uint64_t)v96;
    }
    else {
      uint64_t v75 = (uint64_t)v96;
    }
    id v79 = v96;
  }
  uint64_t v97 = v72;
  v98 = v73;
  if (v51)
  {
    long long v106 = 0uLL;
    long long v107 = 0uLL;
    long long v104 = 0uLL;
    long long v105 = 0uLL;
    id v80 = (id)v77;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v104 objects:v126 count:16];
    if (!v81)
    {
      uint64_t v77 = (uint64_t)v80;
      goto LABEL_143;
    }
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v105;
LABEL_113:
    uint64_t v84 = 0;
    while (1)
    {
      if (*(void *)v105 != v83) {
        objc_enumerationMutation(v80);
      }
      v85 = *(void **)(*((void *)&v104 + 1) + 8 * v84);
      if (([v71 containsObject:v85] & 1) == 0)
      {
        if ([(id)v75 containsObject:v85]) {
          goto LABEL_131;
        }
      }
      if (v82 == ++v84)
      {
        uint64_t v82 = [v80 countByEnumeratingWithState:&v104 objects:v126 count:16];
        if (v82) {
          goto LABEL_113;
        }
        uint64_t v77 = (uint64_t)v80;
        goto LABEL_137;
      }
    }
  }
  long long v102 = 0uLL;
  long long v103 = 0uLL;
  long long v100 = 0uLL;
  long long v101 = 0uLL;
  id v80 = (id)v75;
  uint64_t v86 = [v80 countByEnumeratingWithState:&v100 objects:v125 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v101;
LABEL_123:
    uint64_t v89 = 0;
    while (1)
    {
      if (*(void *)v101 != v88) {
        objc_enumerationMutation(v80);
      }
      v85 = *(void **)(*((void *)&v100 + 1) + 8 * v89);
      if (([v71 containsObject:v85] & 1) == 0)
      {
        if ([(id)v77 containsObject:v85]) {
          break;
        }
      }
      if (v87 == ++v89)
      {
        uint64_t v87 = [v80 countByEnumeratingWithState:&v100 objects:v125 count:16];
        if (v87) {
          goto LABEL_123;
        }
        uint64_t v75 = (uint64_t)v80;
LABEL_137:
        uint64_t v73 = v98;
        goto LABEL_143;
      }
    }
LABEL_131:
    if ([v85 method]) {
      [v71 addObject:v85];
    }

    int v51 = v99;
    SEL v46 = v95;
    uint64_t v72 = v97;
    uint64_t v73 = v98;
    goto LABEL_134;
  }
  uint64_t v75 = (uint64_t)v80;
LABEL_143:

  v90 = ne_log_large_obj();
  SEL v46 = v95;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
  {
    v91 = [(id)a1 additionalKEMProtocols];
    v92 = [v8 additionalKEMProtocols];
    *(_DWORD *)buf = 138412546;
    long long v132 = v91;
    __int16 v133 = 2112;
    long long v134 = v92;
    _os_log_impl(&dword_19DDAF000, v90, OS_LOG_TYPE_INFO, "Failed to match Additional Key Exchange methods (%@ vs %@)", buf, 0x16u);
  }
  unsigned __int8 v124 = 0;

LABEL_146:
  int v58 = v93;
  uint64_t v44 = v94;
LABEL_147:

  a1 = v124;
LABEL_51:

  return a1;
}

- (uint64_t)isAValidResponse
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (objc_getProperty(a1, a2, 72, 1)) {
    return 0;
  }
  if ((a1[9] & 1) == 0) {
    return 0;
  }
  if (!a1[8]) {
    return 0;
  }
  unint64_t v3 = [a1 kemProtocols];
  unint64_t v4 = [v3 count];

  if (v4 > 1) {
    return 0;
  }
  SEL v5 = [a1 encryptionProtocols];
  uint64_t v6 = [v5 count];

  if (v6 != 1) {
    return 0;
  }
  id v7 = [a1 encryptionProtocols];
  objc_super v8 = [v7 firstObject];
  if (v8 && (unint64_t v9 = v8[2] - 18, v9 <= 0xD)) {
    uint64_t v10 = qword_19DF9D4B8[v9];
  }
  else {
    uint64_t v10 = 1;
  }

  SEL v11 = [a1 integrityProtocols];
  uint64_t v12 = [v11 count];

  if (v12 != v10) {
    return 0;
  }
  uint64_t v13 = [a1 additionalKEMProtocols];

  if (!v13) {
    return 1;
  }
  BOOL v14 = [a1 kemProtocols];
  uint64_t v15 = [v14 count];

  if (v15 != 1) {
    return 0;
  }
  uint64_t v16 = [a1 additionalKEMProtocols];
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v16, "count") + 1);
  uint64_t v18 = [a1 kemProtocols];
  uint64_t v19 = [v18 firstObject];
  [v17 addObject:v19];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(v20, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * i), (void)v29);
        if ([v25 count] != 1) {
          goto LABEL_31;
        }
        uint64_t v26 = [v25 firstObject];
        if ([v17 containsObject:v26])
        {

LABEL_31:
          uint64_t v27 = 0;
          goto LABEL_32;
        }
        if ([v26 method]) {
          [v17 addObject:v26];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v27 = 1;
      if (v22) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v27 = 1;
  }
LABEL_32:

  return v27;
}

+ (NSObject)chooseChildSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:(char)a5 checkKEMethod:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  self;
  if (!v8)
  {
    id obj = ne_log_obj();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    uint64_t v26 = "%s called with null localProposals";
LABEL_29:
    _os_log_fault_impl(&dword_19DDAF000, obj, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_21;
  }
  if (!v9)
  {
    id obj = ne_log_obj();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v45 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    uint64_t v26 = "%s called with null remoteProposals";
    goto LABEL_29;
  }
  if (!a4)
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    id obj = v8;
    uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2;
          v28[3] = &unk_1E5990048;
          v28[4] = v21;
          char v29 = 0;
          char v30 = a5;
          uint64_t v22 = [v9 indexOfObjectPassingTest:v28];
          if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int v24 = [v9 objectAtIndexedSubscript:v22];
            uint64_t v16 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v21, v24, 0, a5);

            goto LABEL_24;
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    goto LABEL_21;
  }
  long long v40 = 0uLL;
  long long v41 = 0uLL;
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (!v10)
  {
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v39;
  while (2)
  {
    for (uint64_t j = 0; j != v11; ++j)
    {
      if (*(void *)v39 != v12) {
        objc_enumerationMutation(obj);
      }
      BOOL v14 = *(void **)(*((void *)&v38 + 1) + 8 * j);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke;
      v35[3] = &unk_1E5990048;
      v35[4] = v14;
      char v36 = a4;
      char v37 = a5;
      uint64_t v15 = [v8 indexOfObjectPassingTest:v35];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = [v8 objectAtIndexedSubscript:v15];
        uint64_t v16 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v23, v14, 1, a5);

        goto LABEL_24;
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  uint64_t v16 = 0;
LABEL_24:

  return v16;
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke(uint64_t a1, void *a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](a2, *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

@end