@interface NEIKEv2IKESAPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2IKESAPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rekeyIKESPI, 0);

  objc_storeStrong((id *)&self->_proposals, 0);
}

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v69[1] + 4) = *MEMORY[0x1E4F143B8];
  if (!self || (v2 = self, !objc_getProperty(self, a2, 16, 1)))
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69[0] = "-[NEIKEv2IKESAPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(v2, v3, 16, 1), "length") > 7)
  {
    v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_getProperty(v2, v6, 16, 1);
    v8 = (unsigned __int8 *)[v7 bytes];
    v56 = v7;
    unsigned int v10 = [v7 length];
    v11 = &off_1E598D000;
    *(void *)&long long v12 = 67109376;
    long long v55 = v12;
    v57 = v2;
    v58 = v4;
    while (1)
    {
      if (v10 < 8)
      {
LABEL_79:
        objc_setProperty_atomic(v2, v9, v4, 24);
        BOOL v5 = [(NEIKEv2IKESAPayload *)v2 hasRequiredFields];

        goto LABEL_80;
      }
      unsigned int v13 = bswap32(*((unsigned __int16 *)v8 + 1));
      unint64_t v14 = HIWORD(v13);
      if (v10 < HIWORD(v13))
      {
        v50 = ne_log_obj();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
LABEL_78:

          goto LABEL_79;
        }
        *(_DWORD *)buf = v55;
        LODWORD(v69[0]) = v10;
        WORD2(v69[0]) = 1024;
        *(_DWORD *)((char *)v69 + 6) = v14;
        v51 = "Not enough bytes remaining (%u) to process proposal length %u";
        v52 = v50;
        uint32_t v53 = 14;
LABEL_82:
        _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, v51, buf, v53);
        goto LABEL_78;
      }
      if ((unint64_t)v8[6] + 8 > v14)
      {
        v50 = ne_log_obj();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v69[0]) = v14;
        v51 = "Proposal length %u is too short";
        v52 = v50;
        uint32_t v53 = 8;
        goto LABEL_82;
      }
      unsigned int v62 = v8[7];
      v15 = objc_alloc_init((Class)v11[131]);
      uint64_t v16 = v8[6];
      if (v16 == 8)
      {
        v17 = [[NEIKEv2IKESPI alloc] initWithValue:*((void *)v8 + 1)];
        objc_setProperty_atomic(v2, v18, v17, 32);
      }
      else
      {
        if (!v8[6]) {
          goto LABEL_17;
        }
        ne_log_obj();
        v17 = (NEIKEv2IKESPI *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
        {
          int v48 = v8[4];
          int v49 = v8[6];
          *(_DWORD *)buf = v55;
          LODWORD(v69[0]) = v48;
          WORD2(v69[0]) = 1024;
          *(_DWORD *)((char *)v69 + 6) = v49;
          _os_log_error_impl(&dword_19DDAF000, &v17->super.super, OS_LOG_TYPE_ERROR, "SA proposal %u has wrong length %u", buf, 0xEu);
        }
      }

      uint64_t v16 = v8[6];
LABEL_17:
      if (v16 + 16 > v14 || v62 == 0)
      {
        v20 = 0;
        id v21 = 0;
        if (v15) {
          v15[8] = v8[4];
        }
      }
      else
      {
        unsigned int v59 = v10;
        id v60 = 0;
        id v21 = 0;
        uint64_t v22 = v16 + 8;
        unsigned int v23 = 1;
        selfa = v15;
        do
        {
          v24 = &v8[v22];
          unsigned int v25 = bswap32(*(unsigned __int16 *)&v8[v22 + 2]) >> 16;
          uint64_t v26 = v8[v22 + 4];
          switch(v8[v22 + 4])
          {
            case 1u:
              char v32 = v25 >= 0xC && *((_WORD *)v24 + 4) == 3712 && *((_WORD *)v24 + 5) == 1;
              v27 = (NEIKEv2PRFProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:]([NEIKEv2EncryptionProtocol alloc], bswap32(*((unsigned __int16 *)v24 + 3)) >> 16, v32);
              v41 = [v15 encryptionProtocols];

              if (v41)
              {
                v34 = [v15 encryptionProtocols];
                v35 = [v34 arrayByAddingObject:v27];
                [v15 setEncryptionProtocols:v35];
                goto LABEL_50;
              }
              v67 = v27;
              v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
              [v15 setEncryptionProtocols:v34];
              break;
            case 2u:
              v27 = [[NEIKEv2PRFProtocol alloc] initWithType:bswap32(*((unsigned __int16 *)v24 + 3)) >> 16];
              v33 = [v15 prfProtocols];

              if (v33)
              {
                v34 = [v15 prfProtocols];
                v35 = [v34 arrayByAddingObject:v27];
                [v15 setPrfProtocols:v35];
                goto LABEL_50;
              }
              v66 = v27;
              v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
              [v15 setPrfProtocols:v34];
              break;
            case 3u:
              v27 = [[NEIKEv2IntegrityProtocol alloc] initWithType:bswap32(*((unsigned __int16 *)v24 + 3)) >> 16];
              v36 = [v15 integrityProtocols];

              if (v36)
              {
                v34 = [v15 integrityProtocols];
                v35 = [v34 arrayByAddingObject:v27];
                [v15 setIntegrityProtocols:v35];
                goto LABEL_50;
              }
              v65 = v27;
              v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
              [v15 setIntegrityProtocols:v34];
              break;
            case 4u:
              v27 = [[NEIKEv2KEMProtocol alloc] initWithMethod:bswap32(*((unsigned __int16 *)v24 + 3)) >> 16];
              v37 = [v15 kemProtocols];

              if (v37)
              {
                v34 = [v15 kemProtocols];
                v35 = [v34 arrayByAddingObject:v27];
                [v15 setKemProtocols:v35];
LABEL_50:
              }
              else
              {
                v64 = v27;
                v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
                [v15 setKemProtocols:v34];
              }
              break;
            case 5u:
              ne_log_obj();
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_19DDAF000, &v27->super, OS_LOG_TYPE_DEBUG, "Ignoring ESN transform found in IKE SA proposal", buf, 2u);
              }
              goto LABEL_52;
            case 6u:
            case 7u:
            case 8u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xCu:
              objc_msgSend(NSNumber, "numberWithUnsignedChar:");
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              v28 = [[NEIKEv2KEMProtocol alloc] initWithMethod:bswap32(*((unsigned __int16 *)v24 + 3)) >> 16];
              if (!v21) {
                id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              v29 = objc_msgSend(v21, "objectForKeyedSubscript:", v27, v55);

              if (v29)
              {
                v30 = [v21 objectForKeyedSubscript:v27];
                v31 = [v30 arrayByAddingObject:v28];
                [v21 setObject:v31 forKeyedSubscript:v27];

                v15 = selfa;
              }
              else
              {
                v63 = v28;
                v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
                [v21 setObject:v30 forKeyedSubscript:v27];
              }

              goto LABEL_52;
            default:
              id v38 = v60;
              if (!v60)
              {
                id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                uint64_t v26 = v24[4];
              }
              v39 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v26, v55);
              id v60 = v38;
              [v38 addObject:v39];

              ne_log_obj();
              v27 = (NEIKEv2PRFProtocol *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_INFO))
              {
                int v40 = v24[4];
                *(_DWORD *)buf = 67109120;
                LODWORD(v69[0]) = v40;
                _os_log_impl(&dword_19DDAF000, &v27->super, OS_LOG_TYPE_INFO, "Found unsupported transform type %u in IKE SA proposal", buf, 8u);
              }
              v15 = selfa;
              goto LABEL_52;
          }

LABEL_52:
          v22 += v25;
        }
        while (v22 + 8 <= v14 && v23++ < v62);
        if (v15) {
          v15[8] = v8[4];
        }
        v4 = v58;
        unsigned int v10 = v59;
        v20 = v60;
        if (v21)
        {
          v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v21];
          [selfa setAdditionalKEMProtocols:v43];
        }
        v2 = v57;
        v11 = &off_1E598D000;
        if (v60)
        {
          v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v60];
          v15 = selfa;
          if (selfa) {
            objc_setProperty_atomic(selfa, v44, v45, 80);
          }
        }
        else
        {
          v15 = selfa;
        }
      }
      -[NSObject addObject:](v4, "addObject:", v15, v55);
      v46 = v15;
      int v47 = *v8;
      v10 -= v14;
      v8 += v14;

      if (v47 != 2) {
        goto LABEL_79;
      }
    }
  }
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v69[0] = "-[NEIKEv2IKESAPayload parsePayloadData]";
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_proposal_t))", buf, 0xCu);
  }
LABEL_8:
  BOOL v5 = 0;
LABEL_80:

  return v5;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1)) {
    goto LABEL_3;
  }
  if ([(NEIKEv2IKESAPayload *)v2 hasRequiredFields])
  {
    unint64_t v6 = 0x1E4F1C000uLL;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if (v2) {
      id Property = objc_getProperty(v2, v7, 24, 1);
    }
    else {
      id Property = 0;
    }
    unsigned __int8 v11 = [Property count];
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    if (v2) {
      id v12 = objc_getProperty(v2, v10, 24, 1);
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v194 objects:v211 count:16];
    if (!v14)
    {
LABEL_170:

      if (!v2)
      {

        id v4 = 0;
        return v4 != 0;
      }
      objc_setProperty_atomic(v2, v143, v8, 16);

LABEL_3:
      id v4 = objc_getProperty(v2, v3, 16, 1);
      return v4 != 0;
    }
    unint64_t v154 = v14;
    uint64_t v15 = 0;
    unsigned int v147 = v11;
    uint64_t v16 = *(void *)v195;
    uint64_t v17 = *(void *)v195;
    unsigned __int8 v151 = 1;
    uint64_t v150 = *(void *)v195;
LABEL_12:
    if (v17 != v16)
    {
      uint64_t v18 = v15;
      objc_enumerationMutation(v13);
      uint64_t v15 = v18;
    }
    uint64_t v153 = v15;
    v19 = *(void **)(*((void *)&v194 + 1) + 8 * v15);
    id v21 = [v19 encryptionProtocols];
    selfa = v19;
    if (v19) {
      id v22 = objc_getProperty(v19, v20, 88, 1);
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
      id v25 = selfa;
      if (selfa) {
        id v25 = objc_getProperty(selfa, v24, 88, 1);
      }
      id v26 = v25;
      id v210 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];

      id v21 = v27;
    }
    if ([v21 count])
    {
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      id v21 = v21;
      uint64_t v28 = [v21 countByEnumeratingWithState:&v190 objects:v209 count:16];
      if (!v28) {
        goto LABEL_30;
      }
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v191;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v191 != v30) {
            objc_enumerationMutation(v21);
          }
          uint64_t v32 = *(void *)(*((void *)&v190 + 1) + 8 * i);
          if (v32 && (unint64_t)(*(void *)(v32 + 16) - 29) <= 2)
          {
            v142 = ne_log_obj();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v142, OS_LOG_TYPE_ERROR, "IIV encryption algorithms only allowed in child SA proposals", buf, 2u);
            }

            v34 = v21;
            goto LABEL_167;
          }
        }
        uint64_t v29 = [v21 countByEnumeratingWithState:&v190 objects:v209 count:16];
      }
      while (v29);
LABEL_30:

      v34 = [selfa prfProtocols];
      if (selfa) {
        id v35 = objc_getProperty(selfa, v33, 104, 1);
      }
      else {
        id v35 = 0;
      }
      id v36 = v35;

      if (v36)
      {
        id v38 = selfa;
        v39 = v34;
        if (selfa) {
          id v38 = objc_getProperty(selfa, v37, 104, 1);
        }
        id v40 = v38;
        id v208 = v40;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
      }
      if (![v34 count])
      {
        v144 = ne_log_obj();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v144, OS_LOG_TYPE_ERROR, "IKE SA proposal missing PRF protocol", buf, 2u);
        }

        goto LABEL_167;
      }
      v159 = [selfa additionalKEMProtocols];
      v41 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);

      v158 = v21;
      v152 = v34;
      id v145 = v13;
      v146 = v8;
      v149 = v2;
      if (v41)
      {
        v42 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
        if ([v42 count])
        {
          id v43 = objc_alloc(MEMORY[0x1E4F1CA60]);
          v44 = -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](selfa);
          v45 = objc_msgSend(v43, "initWithCapacity:", objc_msgSend(v44, "count"));

          long long v188 = 0u;
          long long v189 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          id v46 = v42;
          uint64_t v47 = [v46 countByEnumeratingWithState:&v186 objects:v207 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v187;
            do
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v187 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void *)(*((void *)&v186 + 1) + 8 * j);
                v52 = [v46 objectForKeyedSubscript:v51];
                v206 = v52;
                uint32_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v206 count:1];
                [v45 setObject:v53 forKeyedSubscript:v51];
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v186 objects:v207 count:16];
            }
            while (v48);
          }

          id v13 = v145;
          id v8 = v146;
          v2 = v149;
          id v21 = v158;
          v34 = v152;
        }
        else
        {
          v45 = (void *)MEMORY[0x1E4F1CC08];
        }

        v159 = v45;
        unint64_t v6 = 0x1E4F1C000uLL;
      }
      long long v55 = [selfa kemProtocols];
      if (selfa) {
        id v56 = objc_getProperty(selfa, v54, 112, 1);
      }
      else {
        id v56 = 0;
      }
      id v57 = v56;

      if (v57)
      {
        id v59 = selfa;
        if (selfa) {
          id v59 = objc_getProperty(selfa, v58, 112, 1);
        }
        id v60 = v59;
        id v205 = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v205 count:1];

        unsigned int v62 = (void *)v61;
        v34 = v152;
      }
      else
      {
        unsigned int v62 = v55;
      }
      v148 = v62;
      if (![v62 count])
      {
        v63 = ne_log_obj();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "IKE SA proposal missing KE protocol", buf, 2u);
        }
        int v78 = 0;
        goto LABEL_151;
      }
      v63 = objc_alloc_init(*(Class *)(v6 + 2648));
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      v64 = v21;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v182 objects:v204 count:16];
      if (!v65)
      {
        char v67 = 0;
        LOBYTE(v68) = 0;
LABEL_84:

        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        v79 = v34;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v177 objects:v203 count:16];
        if (v80)
        {
          unint64_t v81 = v80;
          uint64_t v82 = 0;
          uint64_t v83 = *(void *)v178;
          for (uint64_t k = *(void *)v178; ; uint64_t k = *(void *)v178)
          {
            if (k != v83) {
              objc_enumerationMutation(v79);
            }
            v85 = *(void **)(*((void *)&v177 + 1) + 8 * v82);
            *(void *)buf = 0;
            unsigned int v86 = [v85 type];
            buf[0] = 3;
            uint8_t buf[4] = 2;
            *(_WORD *)&buf[6] = bswap32(v86) >> 16;
            *(_WORD *)&buf[2] = 2048;
            [v63 appendBytes:buf length:8];
            LOBYTE(v68) = v68 + 1;
            if (++v82 >= v81)
            {
              uint64_t v87 = [v79 countByEnumeratingWithState:&v177 objects:v203 count:16];
              if (!v87) {
                break;
              }
              unint64_t v81 = v87;
              uint64_t v82 = 0;
            }
          }
        }

        if (v67)
        {
          v88 = v159;
        }
        else
        {
          v90 = [selfa integrityProtocols];
          v2 = v149;
          if (selfa) {
            id v91 = objc_getProperty(selfa, v89, 96, 1);
          }
          else {
            id v91 = 0;
          }
          id v92 = v91;

          if (v92)
          {
            id v94 = selfa;
            if (selfa) {
              id v94 = objc_getProperty(selfa, v93, 96, 1);
            }
            id v95 = v94;
            id v202 = v95;
            uint64_t v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v202 count:1];

            v90 = (void *)v96;
          }
          if (![v90 count])
          {
            v106 = ne_log_obj();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v106, OS_LOG_TYPE_ERROR, "IKE SA proposal missing integrity protocol", buf, 2u);
            }

            int v78 = 0;
            id v13 = v145;
            id v8 = v146;
            v34 = v152;
            goto LABEL_151;
          }
          long long v175 = 0u;
          long long v176 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          id v97 = v90;
          uint64_t v98 = [v97 countByEnumeratingWithState:&v173 objects:v201 count:16];
          if (v98)
          {
            unint64_t v99 = v98;
            uint64_t v100 = 0;
            uint64_t v101 = *(void *)v174;
            uint64_t v102 = *(void *)v174;
            v88 = v159;
            while (1)
            {
              if (v102 != v101) {
                objc_enumerationMutation(v97);
              }
              v103 = *(void **)(*((void *)&v173 + 1) + 8 * v100);
              *(void *)buf = 0;
              unsigned int v104 = [v103 type];
              buf[0] = 3;
              uint8_t buf[4] = 3;
              *(_WORD *)&buf[6] = bswap32(v104) >> 16;
              *(_WORD *)&buf[2] = 2048;
              [v63 appendBytes:buf length:8];
              LOBYTE(v68) = v68 + 1;
              if (++v100 >= v99)
              {
                uint64_t v105 = [v97 countByEnumeratingWithState:&v173 objects:v201 count:16];
                if (!v105) {
                  goto LABEL_113;
                }
                unint64_t v99 = v105;
                uint64_t v100 = 0;
              }
              uint64_t v102 = *(void *)v174;
            }
          }
          v88 = v159;
LABEL_113:
        }
        if ([v88 count])
        {
          v107 = [v88 allKeys];
          v108 = [v107 sortedArrayUsingSelector:sel_compare_];

          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          obuint64_t j = v108;
          uint64_t v109 = [obj countByEnumeratingWithState:&v169 objects:v200 count:16];
          if (v109)
          {
            unint64_t v110 = v109;
            unint64_t v111 = 0;
            uint64_t v112 = *(void *)v170;
            uint64_t v156 = *(void *)v170;
            while (1)
            {
              if (v112 != v156) {
                objc_enumerationMutation(obj);
              }
              v113 = *(void **)(*((void *)&v169 + 1) + 8 * v111);
              uint8_t v114 = [v113 unsignedCharValue];
              long long v165 = 0u;
              long long v166 = 0u;
              long long v167 = 0u;
              long long v168 = 0u;
              v115 = [v159 objectForKeyedSubscript:v113];
              uint64_t v116 = [v115 countByEnumeratingWithState:&v165 objects:v199 count:16];
              if (v116)
              {
                unint64_t v117 = v116;
                uint64_t v118 = 0;
                uint64_t v119 = *(void *)v166;
                for (uint64_t m = *(void *)v166; ; uint64_t m = *(void *)v166)
                {
                  if (m != v119) {
                    objc_enumerationMutation(v115);
                  }
                  v121 = *(void **)(*((void *)&v165 + 1) + 8 * v118);
                  *(void *)buf = 0;
                  unsigned int v122 = [v121 method];
                  buf[0] = 3;
                  uint8_t buf[4] = v114;
                  *(_WORD *)&buf[6] = bswap32(v122) >> 16;
                  *(_WORD *)&buf[2] = 2048;
                  [v63 appendBytes:buf length:8];
                  LOBYTE(v68) = v68 + 1;
                  if (++v118 >= v117)
                  {
                    uint64_t v123 = [v115 countByEnumeratingWithState:&v165 objects:v199 count:16];
                    if (!v123) {
                      break;
                    }
                    unint64_t v117 = v123;
                    uint64_t v118 = 0;
                  }
                }
              }

              ++v111;
              id v21 = v158;
              if (v111 >= v110)
              {
                uint64_t v124 = [obj countByEnumeratingWithState:&v169 objects:v200 count:16];
                if (!v124) {
                  break;
                }
                unint64_t v110 = v124;
                unint64_t v111 = 0;
              }
              uint64_t v112 = *(void *)v170;
            }
          }
        }
        v2 = v149;
        unsigned __int8 v125 = [v148 count];
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        id v126 = v148;
        uint64_t v127 = [v126 countByEnumeratingWithState:&v161 objects:v198 count:16];
        if (!v127) {
          goto LABEL_144;
        }
        unint64_t v128 = v127;
        uint64_t v129 = 0;
        uint64_t v130 = *(void *)v162;
        unsigned __int8 v131 = 1;
        for (uint64_t n = *(void *)v162; ; uint64_t n = *(void *)v162)
        {
          if (n != v130) {
            objc_enumerationMutation(v126);
          }
          v133 = *(void **)(*((void *)&v161 + 1) + 8 * v129);
          *(void *)buf = 0;
          unsigned int v134 = [v133 method];
          if (v125 <= v131) {
            uint8_t v135 = 0;
          }
          else {
            uint8_t v135 = 3;
          }
          buf[0] = v135;
          uint8_t buf[4] = 4;
          *(_WORD *)&buf[6] = bswap32(v134) >> 16;
          *(_WORD *)&buf[2] = 2048;
          [v63 appendBytes:buf length:8];
          LOBYTE(v68) = v68 + 1;
          if (++v129 >= v128)
          {
            uint64_t v136 = [v126 countByEnumeratingWithState:&v161 objects:v198 count:16];
            if (!v136)
            {
              v2 = v149;
              id v21 = v158;
LABEL_144:

              *(void *)buf = 0x10000000000;
              buf[0] = 2 * (v147 > v151);
              v34 = v152;
              uint8_t v138 = selfa;
              if (selfa) {
                uint8_t v138 = selfa[8];
              }
              uint8_t buf[4] = v138;
              if (v2 && objc_getProperty(v2, v137, 32, 1))
              {
                uint64_t v160 = 0;
                uint64_t v160 = objc_msgSend(objc_getProperty(v2, v139, 32, 1), "value");
                buf[6] = 8;
                -[NSObject replaceBytesInRange:withBytes:length:](v63, "replaceBytesInRange:withBytes:length:", 0, 0, &v160, 8);
              }
              else
              {
                buf[6] = 0;
              }
              buf[7] = v68;
              *(_WORD *)&buf[2] = bswap32([v63 length] + 8) >> 16;
              id v8 = v146;
              [v146 appendBytes:buf length:8];
              [v146 appendData:v63];
              ++v151;
              int v78 = 1;
              id v13 = v145;
LABEL_151:

              if (!v78) {
                goto LABEL_168;
              }
              uint64_t v140 = v154;
              uint64_t v15 = v153 + 1;
              unint64_t v6 = 0x1E4F1C000;
              if (v153 + 1 < v154) {
                goto LABEL_155;
              }
              uint64_t v140 = [v13 countByEnumeratingWithState:&v194 objects:v211 count:16];
              if (!v140) {
                goto LABEL_170;
              }
              uint64_t v15 = 0;
LABEL_155:
              unint64_t v154 = v140;
              uint64_t v17 = *(void *)v195;
              uint64_t v16 = v150;
              goto LABEL_12;
            }
            unint64_t v128 = v136;
            uint64_t v129 = 0;
          }
          ++v131;
        }
      }
      unint64_t v66 = v65;
      char v67 = 0;
      int v68 = 0;
      uint64_t v69 = 0;
      uint64_t v70 = *(void *)v183;
      for (iuint64_t i = *(void *)v183; ; iuint64_t i = *(void *)v183)
      {
        if (ii != v70) {
          objc_enumerationMutation(v64);
        }
        uint64_t v72 = *(void *)(*((void *)&v182 + 1) + 8 * v69);
        *(void *)buf = 0;
        LODWORD(v160) = 0;
        if (!v72) {
          break;
        }
        unint64_t v73 = *(void *)(v72 + 16);
        if (v73 != 12 && (v73 > 0x1E || ((0x401C0000u >> v73) & 1) == 0)) {
          goto LABEL_65;
        }
        if (*(unsigned char *)(v72 + 8)) {
          unsigned int v74 = 256;
        }
        else {
          unsigned int v74 = 128;
        }
        buf[0] = 3;
        uint8_t buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v73) >> 16;
        LOWORD(v160) = 3712;
        WORD1(v160) = __rev16(v74);
        *(_WORD *)&buf[2] = 3072;
        [v63 appendBytes:buf length:8];
        [v63 appendBytes:&v160 length:4];
        ++v68;
LABEL_71:
        unint64_t v75 = *(void *)(v72 + 16);
        if (v75 <= 0x1F)
        {
          unsigned int v76 = (0xD01C0000 >> v75) & 1;
          goto LABEL_74;
        }
LABEL_73:
        LOBYTE(v76) = 0;
LABEL_74:
        v67 |= v76;
        if (++v69 >= v66)
        {
          uint64_t v77 = [v64 countByEnumeratingWithState:&v182 objects:v204 count:16];
          if (!v77)
          {
            id v21 = v158;
            v34 = v152;
            goto LABEL_84;
          }
          unint64_t v66 = v77;
          uint64_t v69 = 0;
        }
      }
      LODWORD(v73) = 0;
LABEL_65:
      buf[0] = 3;
      uint8_t buf[4] = 1;
      *(_WORD *)&buf[6] = bswap32(v73) >> 16;
      *(_WORD *)&buf[2] = 2048;
      [v63 appendBytes:buf length:8];
      ++v68;
      if (!v72) {
        goto LABEL_73;
      }
      goto LABEL_71;
    }
    v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "IKE SA proposal missing encryption protocol", buf, 2u);
    }
LABEL_167:

LABEL_168:
  }
  else
  {
    v141 = ne_log_obj();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v141, OS_LOG_TYPE_ERROR, "IKE SA payload missing required fields", buf, 2u);
    }
  }
  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2IKESAPayload *)objc_getProperty(self, a2, 24, 1);
  }
  return [(NEIKEv2IKESAPayload *)self count] != 0;
}

- (id)description
{
  return [(NEIKEv2IKESAPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  id v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 32, 1), @"Rekey SPI", v5, a4);
    id Property = objc_getProperty(self, v10, 24, 1);
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"Rekey SPI" andIndent:v5 options:a4];
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
  return @"SA(IKE)";
}

@end