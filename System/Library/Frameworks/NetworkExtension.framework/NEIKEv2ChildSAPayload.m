@interface NEIKEv2ChildSAPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2ChildSAPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v68[1] + 4) = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68[0] = "-[NEIKEv2ChildSAPayload parsePayloadData]";
      v5 = "%s called with null self.payloadData";
      goto LABEL_69;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_75;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 7)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68[0] = "-[NEIKEv2ChildSAPayload parsePayloadData]";
      v5 = "%s called with null (self.payloadData.length >= sizeof(ikev2_proposal_t))";
LABEL_69:
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, v5, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  selfa = self;
  id v8 = objc_getProperty(self, v7, 16, 1);
  v9 = (unsigned __int8 *)[v8 bytes];
  v55 = v8;
  unsigned int v11 = [v8 length];
  *(void *)&long long v12 = 67109376;
  long long v54 = v12;
  v57 = v4;
  while (v11 >= 8)
  {
    unsigned int v13 = bswap32(*((unsigned __int16 *)v9 + 1));
    unint64_t v14 = HIWORD(v13);
    if (v11 < HIWORD(v13))
    {
      v49 = ne_log_obj();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
LABEL_73:

        break;
      }
      *(_DWORD *)buf = v54;
      LODWORD(v68[0]) = v11;
      WORD2(v68[0]) = 1024;
      *(_DWORD *)((char *)v68 + 6) = v14;
      v50 = "Not enough bytes remaining (%u) to process proposal length %u";
      v51 = v49;
      uint32_t v52 = 14;
LABEL_77:
      _os_log_error_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
      goto LABEL_73;
    }
    if ((unint64_t)v9[6] + 8 > v14)
    {
      v49 = ne_log_obj();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        goto LABEL_73;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v68[0]) = v14;
      v50 = "Proposal length %u is too short";
      v51 = v49;
      uint32_t v52 = 8;
      goto LABEL_77;
    }
    unsigned int v62 = v9[7];
    v15 = objc_alloc_init(NEIKEv2ChildSAProposal);
    if (v9[6] == 4)
    {
      v17 = [[NEIKEv2ESPSPI alloc] initWithValue:*((unsigned int *)v9 + 2)];
      if (v15) {
        objc_setProperty_atomic(v15, v16, v17, 80);
      }
    }
    else
    {
      ne_log_obj();
      v17 = (NEIKEv2ESPSPI *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
      {
        int v47 = v9[4];
        int v48 = v9[6];
        *(_DWORD *)buf = v54;
        LODWORD(v68[0]) = v47;
        WORD2(v68[0]) = 1024;
        *(_DWORD *)((char *)v68 + 6) = v48;
        _os_log_error_impl(&dword_19DDAF000, &v17->super.super, OS_LOG_TYPE_ERROR, "SA proposal %u has wrong length %u", buf, 0xEu);
      }
    }
    unsigned int v58 = v11;

    uint64_t v18 = v9[6];
    BOOL v19 = v18 + 16 > v14 || v62 == 0;
    v61 = v15;
    if (v19)
    {
      v60 = 0;
      char v59 = 0;
      id v25 = 0;
    }
    else
    {
      id v25 = 0;
      char v59 = 0;
      v60 = 0;
      uint64_t v26 = v18 + 8;
      unsigned int v27 = 1;
      do
      {
        v28 = &v9[v26];
        unsigned int v29 = bswap32(*(unsigned __int16 *)&v9[v26 + 2]) >> 16;
        uint64_t v30 = v9[v26 + 4];
        switch(v9[v26 + 4])
        {
          case 1u:
            char v36 = v29 >= 0xC && *((_WORD *)v28 + 4) == 3712 && *((_WORD *)v28 + 5) == 1;
            v31 = (NEIKEv2IntegrityProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:]([NEIKEv2EncryptionProtocol alloc], bswap32(*((unsigned __int16 *)v28 + 3)) >> 16, v36);
            v45 = [(NEIKEv2ChildSAProposal *)v15 encryptionProtocols];

            if (v45)
            {
              v38 = [(NEIKEv2ChildSAProposal *)v15 encryptionProtocols];
              v39 = [v38 arrayByAddingObject:v31];
              [(NEIKEv2ChildSAProposal *)v15 setEncryptionProtocols:v39];
              goto LABEL_56;
            }
            v66 = v31;
            v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
            [(NEIKEv2ChildSAProposal *)v15 setEncryptionProtocols:v38];
            break;
          case 3u:
            v31 = [[NEIKEv2IntegrityProtocol alloc] initWithType:bswap32(*((unsigned __int16 *)v28 + 3)) >> 16];
            v37 = [(NEIKEv2ChildSAProposal *)v15 integrityProtocols];

            if (v37)
            {
              v38 = [(NEIKEv2ChildSAProposal *)v15 integrityProtocols];
              v39 = [v38 arrayByAddingObject:v31];
              [(NEIKEv2ChildSAProposal *)v15 setIntegrityProtocols:v39];
              goto LABEL_56;
            }
            v65 = v31;
            v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
            [(NEIKEv2ChildSAProposal *)v15 setIntegrityProtocols:v38];
            break;
          case 4u:
            v31 = [[NEIKEv2KEMProtocol alloc] initWithMethod:bswap32(*((unsigned __int16 *)v28 + 3)) >> 16];
            v40 = [(NEIKEv2ChildSAProposal *)v15 kemProtocols];

            if (v40)
            {
              v38 = [(NEIKEv2ChildSAProposal *)v15 kemProtocols];
              v39 = [v38 arrayByAddingObject:v31];
              [(NEIKEv2ChildSAProposal *)v15 setKemProtocols:v39];
LABEL_56:
            }
            else
            {
              v64 = v31;
              v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
              [(NEIKEv2ChildSAProposal *)v15 setKemProtocols:v38];
            }
            break;
          case 5u:
            v59 |= *((_WORD *)v28 + 3) == 0;
            goto LABEL_59;
          case 6u:
          case 7u:
          case 8u:
          case 9u:
          case 0xAu:
          case 0xBu:
          case 0xCu:
            objc_msgSend(NSNumber, "numberWithUnsignedChar:");
            v31 = (NEIKEv2IntegrityProtocol *)objc_claimAutoreleasedReturnValue();
            v32 = [[NEIKEv2KEMProtocol alloc] initWithMethod:bswap32(*((unsigned __int16 *)v28 + 3)) >> 16];
            if (!v25) {
              id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            v33 = objc_msgSend(v25, "objectForKeyedSubscript:", v31, v54);

            if (v33)
            {
              v34 = [v25 objectForKeyedSubscript:v31];
              v35 = [v34 arrayByAddingObject:v32];
              [v25 setObject:v35 forKeyedSubscript:v31];

              v15 = v61;
            }
            else
            {
              v63 = v32;
              v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
              [v25 setObject:v34 forKeyedSubscript:v31];
            }

            goto LABEL_58;
          default:
            id v41 = v60;
            if (!v60)
            {
              id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              uint64_t v30 = v28[4];
            }
            v42 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v30, v54);
            v60 = v41;
            [v41 addObject:v42];

            v43 = ne_log_obj();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              int v44 = v28[4];
              *(_DWORD *)buf = 67109120;
              LODWORD(v68[0]) = v44;
              _os_log_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_INFO, "Found unsupported transform type %u in Child SA proposal", buf, 8u);
            }

            v15 = v61;
            goto LABEL_59;
        }

LABEL_58:
LABEL_59:
        v26 += v29;
      }
      while (v26 + 8 <= v14 && v27++ < v62);
    }
    if (v15)
    {
      v15->_proposalNumber = v9[4];
      v15->_noESNTransformPresent = v59 & 1;
    }
    v4 = v57;
    if (v25)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v25];
      [(NEIKEv2ChildSAProposal *)v61 setAdditionalKEMProtocols:v20];

      v15 = v61;
    }
    if (v60)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v60];
      if (v15) {
        objc_setProperty_atomic(v15, v21, v22, 72);
      }
    }
    -[NSObject addObject:](v57, "addObject:", v15, v54);
    v23 = v15;
    int v24 = *v9;
    unsigned int v11 = v58 - v14;
    v9 += v14;

    if (v24 != 2) {
      break;
    }
  }
  objc_setProperty_atomic(selfa, v10, v4, 24);
  BOOL v6 = [(NEIKEv2ChildSAPayload *)selfa hasRequiredFields];

LABEL_75:
  return v6;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_3:
    id Property = objc_getProperty(v2, v3, 16, 1);
    return Property != 0;
  }
  if (![(NEIKEv2ChildSAPayload *)v2 hasRequiredFields])
  {
    v111 = ne_log_obj();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v111, OS_LOG_TYPE_ERROR, "Child SA payload missing required fields", buf, 2u);
    }

    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (v2) {
    id v8 = objc_getProperty(v2, v6, 24, 1);
  }
  else {
    id v8 = 0;
  }
  unsigned __int8 v10 = [v8 count];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v114 = v2;
  if (v2) {
    id v11 = objc_getProperty(v2, v9, 24, 1);
  }
  else {
    id v11 = 0;
  }
  obuint64_t j = v11;
  unint64_t v119 = [obj countByEnumeratingWithState:&v156 objects:v170 count:16];
  if (!v119) {
    goto LABEL_128;
  }
  unsigned __int8 v121 = 0;
  uint64_t v12 = 0;
  id v115 = v7;
  int v116 = v10 - 1;
  uint64_t v117 = *(void *)v157;
  uint64_t v13 = *(void *)v157;
  while (2)
  {
    if (v13 != v117) {
      objc_enumerationMutation(obj);
    }
    unint64_t v14 = *(void **)(*((void *)&v156 + 1) + 8 * v12);
    objc_msgSend(v14, "encryptionProtocols", v114);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    selfa = v14;
    if (v14) {
      id v17 = objc_getProperty(v14, v15, 96, 1);
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      id v20 = selfa;
      if (selfa) {
        id v20 = objc_getProperty(selfa, v19, 96, 1);
      }
      id v21 = v20;
      id v169 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:1];

      id v16 = (id)v22;
    }
    if (![v16 count])
    {
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, "Child SA proposal missing encryption protocol", buf, 2u);
      }
      goto LABEL_135;
    }
    uint64_t v120 = v12;
    v23 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v16 = v16;
    uint64_t v24 = [v16 countByEnumeratingWithState:&v152 objects:v168 count:16];
    v128 = v16;
    if (!v24)
    {

      LOBYTE(v26) = 0;
      v37 = selfa;
      goto LABEL_45;
    }
    unint64_t v25 = v24;
    int v26 = 0;
    char v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v153;
    for (uint64_t i = *(void *)v153; ; uint64_t i = *(void *)v153)
    {
      if (i != v29) {
        objc_enumerationMutation(v16);
      }
      uint64_t v31 = *(void *)(*((void *)&v152 + 1) + 8 * v28);
      *(void *)buf = 0;
      LODWORD(v130) = 0;
      if (!v31)
      {
        LODWORD(v32) = 0;
LABEL_33:
        buf[0] = 3;
        uint8_t buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v32) >> 16;
        *(_WORD *)&buf[2] = 2048;
        [v23 appendBytes:buf length:8];
        ++v26;
        if (!v31) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
      unint64_t v32 = *(void *)(v31 + 16);
      if (v32 != 12 && (v32 > 0x1E || ((0x401C0000u >> v32) & 1) == 0)) {
        goto LABEL_33;
      }
      unsigned int v33 = (*(unsigned char *)(v31 + 8) & 1) != 0 ? 256 : 128;
      buf[0] = 3;
      uint8_t buf[4] = 1;
      *(_WORD *)&buf[6] = bswap32(v32) >> 16;
      LOWORD(v130) = 3712;
      WORD1(v130) = __rev16(v33);
      *(_WORD *)&buf[2] = 3072;
      [v23 appendBytes:buf length:8];
      [v23 appendBytes:&v130 length:4];
      ++v26;
LABEL_34:
      unint64_t v34 = *(void *)(v31 + 16);
      if (v34 <= 0x1F)
      {
        unsigned int v35 = (0xD01C0000 >> v34) & 1;
        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v35) = 0;
LABEL_37:
      id v16 = v128;
      v27 |= v35;
      if (++v28 < v25) {
        continue;
      }
      uint64_t v36 = [v128 countByEnumeratingWithState:&v152 objects:v168 count:16];
      if (!v36) {
        break;
      }
      unint64_t v25 = v36;
      uint64_t v28 = 0;
    }

    v37 = selfa;
    if (v27) {
      goto LABEL_61;
    }
LABEL_45:
    v39 = [v37 integrityProtocols];
    if (v37) {
      id v40 = objc_getProperty(v37, v38, 104, 1);
    }
    else {
      id v40 = 0;
    }
    id v41 = v40;

    if (v41)
    {
      if (v37) {
        id v43 = objc_getProperty(v37, v42, 104, 1);
      }
      else {
        id v43 = 0;
      }
      id v44 = v43;
      id v167 = v44;
      uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:1];

      v39 = (void *)v45;
    }
    if (![v39 count])
    {
      v113 = ne_log_obj();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v113, OS_LOG_TYPE_ERROR, "Child SA proposal missing integrity protocol", buf, 2u);
      }

LABEL_135:
      return 0;
    }
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v46 = v39;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v147 objects:v166 count:16];
    if (v47)
    {
      unint64_t v48 = v47;
      uint64_t v49 = 0;
      uint64_t v50 = *(void *)v148;
      for (uint64_t j = *(void *)v148; ; uint64_t j = *(void *)v148)
      {
        if (j != v50) {
          objc_enumerationMutation(v46);
        }
        uint32_t v52 = *(void **)(*((void *)&v147 + 1) + 8 * v49);
        *(void *)buf = 0;
        unsigned int v53 = [v52 type];
        buf[0] = 3;
        uint8_t buf[4] = 3;
        *(_WORD *)&buf[6] = bswap32(v53) >> 16;
        *(_WORD *)&buf[2] = 2048;
        [v23 appendBytes:buf length:8];
        LOBYTE(v26) = v26 + 1;
        if (++v49 >= v48)
        {
          uint64_t v54 = [v46 countByEnumeratingWithState:&v147 objects:v166 count:16];
          if (!v54) {
            break;
          }
          unint64_t v48 = v54;
          uint64_t v49 = 0;
        }
      }
    }

LABEL_61:
    v55 = [v37 additionalKEMProtocols];
    v56 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);

    if (v56)
    {
      v57 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);
      if ([v57 count])
      {
        v123 = v55;
        id v58 = objc_alloc(MEMORY[0x1E4F1CA60]);
        char v59 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v37);
        v60 = objc_msgSend(v58, "initWithCapacity:", objc_msgSend(v59, "count"));

        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        id v126 = v57;
        id v61 = v57;
        uint64_t v62 = [v61 countByEnumeratingWithState:&v143 objects:v165 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v144;
          do
          {
            for (uint64_t k = 0; k != v63; ++k)
            {
              if (*(void *)v144 != v64) {
                objc_enumerationMutation(v61);
              }
              uint64_t v66 = *(void *)(*((void *)&v143 + 1) + 8 * k);
              v67 = [v61 objectForKeyedSubscript:v66];
              v164 = v67;
              v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
              [v60 setObject:v68 forKeyedSubscript:v66];
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v143 objects:v165 count:16];
          }
          while (v63);
        }

        id v7 = v115;
        v55 = v123;
        v57 = v126;
      }
      else
      {
        v60 = (void *)MEMORY[0x1E4F1CC08];
      }

      v55 = v60;
      v37 = selfa;
    }
    if (![v55 count]) {
      goto LABEL_94;
    }
    v69 = [v55 allKeys];
    v70 = [v69 sortedArrayUsingSelector:sel_compare_];

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v127 = v70;
    uint64_t v71 = [v127 countByEnumeratingWithState:&v139 objects:v163 count:16];
    if (!v71) {
      goto LABEL_93;
    }
    unint64_t v72 = v71;
    uint64_t v73 = 0;
    uint64_t v74 = *(void *)v140;
    v124 = v55;
    uint64_t v125 = *(void *)v140;
    while (2)
    {
      if (v74 != v125) {
        objc_enumerationMutation(v127);
      }
      v75 = *(void **)(*((void *)&v139 + 1) + 8 * v73);
      uint8_t v76 = [v75 unsignedCharValue];
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      v77 = [v55 objectForKeyedSubscript:v75];
      uint64_t v78 = [v77 countByEnumeratingWithState:&v135 objects:v162 count:16];
      if (v78)
      {
        unint64_t v79 = v78;
        uint64_t v80 = 0;
        uint64_t v81 = *(void *)v136;
        for (uint64_t m = *(void *)v136; ; uint64_t m = *(void *)v136)
        {
          if (m != v81) {
            objc_enumerationMutation(v77);
          }
          v83 = *(void **)(*((void *)&v135 + 1) + 8 * v80);
          *(void *)buf = 0;
          unsigned int v84 = [v83 method];
          buf[0] = 3;
          uint8_t buf[4] = v76;
          *(_WORD *)&buf[6] = bswap32(v84) >> 16;
          *(_WORD *)&buf[2] = 2048;
          [v23 appendBytes:buf length:8];
          LOBYTE(v26) = v26 + 1;
          if (++v80 >= v79)
          {
            uint64_t v85 = [v77 countByEnumeratingWithState:&v135 objects:v162 count:16];
            if (!v85)
            {
              v55 = v124;
              break;
            }
            unint64_t v79 = v85;
            uint64_t v80 = 0;
          }
        }
      }

      if (++v73 < v72)
      {
LABEL_91:
        uint64_t v74 = *(void *)v140;
        continue;
      }
      break;
    }
    uint64_t v86 = [v127 countByEnumeratingWithState:&v139 objects:v163 count:16];
    if (v86)
    {
      unint64_t v72 = v86;
      uint64_t v73 = 0;
      goto LABEL_91;
    }
    id v7 = v115;
    v37 = selfa;
LABEL_93:

LABEL_94:
    v88 = [v37 kemProtocols];
    if (v37) {
      id v89 = objc_getProperty(v37, v87, 112, 1);
    }
    else {
      id v89 = 0;
    }
    id v90 = v89;

    if (v90)
    {
      if (v37) {
        id v92 = objc_getProperty(v37, v91, 112, 1);
      }
      else {
        id v92 = 0;
      }
      id v93 = v92;
      id v161 = v93;
      uint64_t v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];

      v88 = (void *)v94;
    }
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v95 = v88;
    uint64_t v96 = [v95 countByEnumeratingWithState:&v131 objects:v160 count:16];
    if (v96)
    {
      unint64_t v97 = v96;
      uint64_t v98 = 0;
      uint64_t v99 = *(void *)v132;
      for (uint64_t n = *(void *)v132; ; uint64_t n = *(void *)v132)
      {
        if (n != v99) {
          objc_enumerationMutation(v95);
        }
        v101 = *(void **)(*((void *)&v131 + 1) + 8 * v98);
        *(void *)buf = 0;
        unsigned int v102 = [v101 method];
        buf[0] = 3;
        uint8_t buf[4] = 4;
        *(_WORD *)&buf[6] = bswap32(v102) >> 16;
        *(_WORD *)&buf[2] = 2048;
        [v23 appendBytes:buf length:8];
        LOBYTE(v26) = v26 + 1;
        if (++v98 >= v97)
        {
          uint64_t v103 = [v95 countByEnumeratingWithState:&v131 objects:v160 count:16];
          if (!v103) {
            break;
          }
          unint64_t v97 = v103;
          uint64_t v98 = 0;
        }
      }
    }

    *(void *)buf = 0x508000000;
    [v23 appendBytes:buf length:8];
    uint64_t v130 = (2 * (v116 > v121));
    id v105 = selfa;
    if (selfa)
    {
      BYTE4(v130) = selfa[8];
      BYTE5(v130) = 3;
      id v105 = objc_getProperty(selfa, v104, 80, 1);
    }
    else
    {
      WORD2(v130) = 768;
    }
    id v106 = v105;

    if (v106)
    {
      int v129 = 0;
      id v108 = selfa;
      if (selfa) {
        id v108 = objc_getProperty(selfa, v107, 80, 1);
      }
      id v109 = v108;
      int v110 = [v109 value];

      int v129 = v110;
      BYTE6(v130) = 4;
      -[NSObject replaceBytesInRange:withBytes:length:](v23, "replaceBytesInRange:withBytes:length:", 0, 0, &v129, 4);
    }
    else
    {
      BYTE6(v130) = 0;
    }
    HIBYTE(v130) = v26 + 1;
    WORD1(v130) = bswap32([v23 length] + 8) >> 16;
    [v7 appendBytes:&v130 length:8];
    [v7 appendData:v23];

    uint64_t v12 = v120 + 1;
    if (v120 + 1 < v119)
    {
LABEL_118:
      ++v121;
      uint64_t v13 = *(void *)v157;
      continue;
    }
    break;
  }
  unint64_t v119 = [obj countByEnumeratingWithState:&v156 objects:v170 count:16];
  if (v119)
  {
    uint64_t v12 = 0;
    goto LABEL_118;
  }
LABEL_128:

  v2 = v114;
  if (v114)
  {
    objc_setProperty_atomic(v114, v112, v7, 16);

    goto LABEL_3;
  }

  id Property = 0;
  return Property != 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2ChildSAPayload *)objc_getProperty(self, a2, 24, 1);
  }
  return [(NEIKEv2ChildSAPayload *)self count] != 0;
}

- (id)description
{
  return [(NEIKEv2ChildSAPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  id v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Proposals" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 33;
}

+ (id)copyTypeDescription
{
  return @"SA(CHILD)";
}

@end