@interface BMIntelligencePlatformMessageTerms
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformMessageTerms)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMIntelligencePlatformMessageTerms)initWithProtoVersion:(id)a3 bundleID:(id)a4 domain:(id)a5 spotlightIdentifier:(id)a6 timestamp:(id)a7 sender:(id)a8 recipients:(id)a9 termCount:(id)a10;
- (BOOL)hasProtoVersion;
- (BOOL)isEqual:(id)a3;
- (NSArray)recipients;
- (NSArray)termCount;
- (NSDate)timestamp;
- (NSString)bundleID;
- (NSString)description;
- (NSString)domain;
- (NSString)sender;
- (NSString)spotlightIdentifier;
- (id)_recipientsJSONArray;
- (id)_termCountJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)protoVersion;
- (unsigned)dataVersion;
- (void)setHasProtoVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformMessageTerms

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termCount, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSArray)termCount
{
  return self->_termCount;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSString)sender
{
  return self->_sender;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setHasProtoVersion:(BOOL)a3
{
  self->_hasProtoVersion = a3;
}

- (BOOL)hasProtoVersion
{
  return self->_hasProtoVersion;
}

- (int)protoVersion
{
  return self->_protoVersion;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMIntelligencePlatformMessageTerms *)self hasProtoVersion]
      || [v5 hasProtoVersion])
    {
      if (![(BMIntelligencePlatformMessageTerms *)self hasProtoVersion]) {
        goto LABEL_30;
      }
      if (![v5 hasProtoVersion]) {
        goto LABEL_30;
      }
      int v6 = [(BMIntelligencePlatformMessageTerms *)self protoVersion];
      if (v6 != [v5 protoVersion]) {
        goto LABEL_30;
      }
    }
    v7 = [(BMIntelligencePlatformMessageTerms *)self bundleID];
    uint64_t v8 = [v5 bundleID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMIntelligencePlatformMessageTerms *)self bundleID];
      v11 = [v5 bundleID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_30;
      }
    }
    v14 = [(BMIntelligencePlatformMessageTerms *)self domain];
    uint64_t v15 = [v5 domain];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMIntelligencePlatformMessageTerms *)self domain];
      v18 = [v5 domain];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_30;
      }
    }
    v20 = [(BMIntelligencePlatformMessageTerms *)self spotlightIdentifier];
    uint64_t v21 = [v5 spotlightIdentifier];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMIntelligencePlatformMessageTerms *)self spotlightIdentifier];
      v24 = [v5 spotlightIdentifier];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_30;
      }
    }
    v26 = [(BMIntelligencePlatformMessageTerms *)self timestamp];
    uint64_t v27 = [v5 timestamp];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMIntelligencePlatformMessageTerms *)self timestamp];
      v30 = [v5 timestamp];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_30;
      }
    }
    v32 = [(BMIntelligencePlatformMessageTerms *)self sender];
    uint64_t v33 = [v5 sender];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMIntelligencePlatformMessageTerms *)self sender];
      v36 = [v5 sender];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_30;
      }
    }
    v38 = [(BMIntelligencePlatformMessageTerms *)self recipients];
    uint64_t v39 = [v5 recipients];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMIntelligencePlatformMessageTerms *)self recipients];
      v42 = [v5 recipients];
      int v43 = [v41 isEqual:v42];

      if (!v43)
      {
LABEL_30:
        char v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v45 = [(BMIntelligencePlatformMessageTerms *)self termCount];
    v46 = [v5 termCount];
    if (v45 == v46)
    {
      char v13 = 1;
    }
    else
    {
      v47 = [(BMIntelligencePlatformMessageTerms *)self termCount];
      v48 = [v5 termCount];
      char v13 = [v47 isEqual:v48];
    }
    goto LABEL_31;
  }
  char v13 = 0;
LABEL_32:

  return v13;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v32[8] = *MEMORY[0x1E4F143B8];
  if ([(BMIntelligencePlatformMessageTerms *)self hasProtoVersion])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformMessageTerms protoVersion](self, "protoVersion"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(BMIntelligencePlatformMessageTerms *)self bundleID];
  uint64_t v5 = [(BMIntelligencePlatformMessageTerms *)self domain];
  uint64_t v6 = [(BMIntelligencePlatformMessageTerms *)self spotlightIdentifier];
  v7 = [(BMIntelligencePlatformMessageTerms *)self timestamp];
  if (v7)
  {
    uint64_t v8 = NSNumber;
    v9 = [(BMIntelligencePlatformMessageTerms *)self timestamp];
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  v11 = [(BMIntelligencePlatformMessageTerms *)self sender];
  int v12 = [(BMIntelligencePlatformMessageTerms *)self _recipientsJSONArray];
  char v13 = [(BMIntelligencePlatformMessageTerms *)self _termCountJSONArray];
  v31[0] = @"protoVersion";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v14;
  v32[0] = v14;
  v31[1] = @"bundleID";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v25 = (void *)v15;
  v32[1] = v15;
  v31[2] = @"domain";
  uint64_t v16 = v5;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v3;
  v24 = (void *)v16;
  v32[2] = v16;
  v31[3] = @"spotlightIdentifier";
  v17 = (void *)v6;
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v4;
  v32[3] = v17;
  v31[4] = @"timestamp";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v5;
  v32[4] = v18;
  v31[5] = @"sender";
  int v19 = v11;
  if (!v11)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v6;
  v32[5] = v19;
  v31[6] = @"recipients";
  uint64_t v21 = v12;
  if (!v12)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[6] = v21;
  v31[7] = @"termCount";
  v22 = v13;
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[7] = v22;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:8];
  if (v13)
  {
    if (v12) {
      goto LABEL_25;
    }
LABEL_37:

    if (v11) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }

  if (!v12) {
    goto LABEL_37;
  }
LABEL_25:
  if (v11) {
    goto LABEL_26;
  }
LABEL_38:

LABEL_26:
  if (!v10) {

  }
  if (!v20) {
  if (v28)
  }
  {
    if (v29) {
      goto LABEL_32;
    }
LABEL_40:

    if (v30) {
      goto LABEL_33;
    }
    goto LABEL_41;
  }

  if (!v29) {
    goto LABEL_40;
  }
LABEL_32:
  if (v30) {
    goto LABEL_33;
  }
LABEL_41:

LABEL_33:

  return v27;
}

- (id)_termCountJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMIntelligencePlatformMessageTerms *)self termCount];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_recipientsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMIntelligencePlatformMessageTerms *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMIntelligencePlatformMessageTerms)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v188[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"protoVersion"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v187 = *MEMORY[0x1E4F28568];
        v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"protoVersion"];
        v188[0] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:&v187 count:1];
        v26 = v22;
        v9 = (void *)v25;
        id v27 = (id)[v26 initWithDomain:v23 code:2 userInfo:v25];
        id v8 = 0;
        v28 = a4;
        a4 = 0;
        id *v28 = v27;
        goto LABEL_113;
      }
      id v8 = 0;
      goto LABEL_114;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"bundleID"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v29 = v9;
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v185 = *MEMORY[0x1E4F28568];
        id v32 = v8;
        id v33 = [NSString alloc];
        uint64_t v132 = objc_opt_class();
        v34 = v33;
        id v8 = v32;
        v35 = (void *)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v132, @"bundleID"];
        v186 = v35;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v186 forKeys:&v185 count:1];
        int v37 = v30;
        v9 = v29;
        uint64_t v38 = v31;
        long long v10 = (void *)v36;
        id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v36];
        v24 = 0;
        v40 = a4;
        a4 = 0;
        id *v40 = v39;
        goto LABEL_112;
      }
      v24 = 0;
      goto LABEL_113;
    }
    id v151 = v9;
  }
  else
  {
    id v151 = 0;
  }
  long long v10 = [v6 objectForKeyedSubscript:@"domain"];
  v152 = self;
  v153 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v41 = v9;
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v183 = *MEMORY[0x1E4F28568];
        id v44 = v8;
        id v45 = [NSString alloc];
        uint64_t v133 = objc_opt_class();
        v46 = v45;
        id v8 = v44;
        id v11 = (id)[v46 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v133, @"domain"];
        id v184 = v11;
        uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
        v48 = v42;
        v9 = v41;
        uint64_t v49 = v43;
        long long v10 = v153;
        v150 = (void *)v47;
        id v50 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v49, 2);
        v35 = 0;
        v51 = a4;
        a4 = 0;
        id *v51 = v50;
        v24 = v151;
        goto LABEL_111;
      }
      v35 = 0;
      v24 = v151;
      goto LABEL_112;
    }
    id v147 = v10;
  }
  else
  {
    id v147 = 0;
  }
  id v11 = [v6 objectForKeyedSubscript:@"spotlightIdentifier"];
  v150 = v11;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v24 = v151;
          v35 = v147;
          goto LABEL_111;
        }
        v52 = v9;
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v54 = *MEMORY[0x1E4F502C8];
        uint64_t v181 = *MEMORY[0x1E4F28568];
        id v55 = v8;
        id v56 = [NSString alloc];
        uint64_t v134 = objc_opt_class();
        v57 = v56;
        id v8 = v55;
        uint64_t v58 = [v57 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v134, @"spotlightIdentifier"];
        uint64_t v182 = v58;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
        v60 = v53;
        v9 = v52;
        v61 = (void *)v58;
        uint64_t v62 = v54;
        long long v10 = v153;
        v146 = (void *)v59;
        id v63 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v62, 2);
        id v11 = 0;
        v64 = a4;
        a4 = 0;
        id *v64 = v63;
        goto LABEL_35;
      }
      id v11 = v11;
    }
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"timestamp"];
  v146 = (void *)v12;
  if (v12)
  {
    long long v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v14 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v15 = v13;
        uint64_t v16 = v9;
        id v17 = v15;
        id v18 = [v14 alloc];
        [v17 doubleValue];
        double v20 = v19;

        v9 = v16;
        id v21 = (id)[v18 initWithTimeIntervalSince1970:v20];
LABEL_26:
        uint64_t v142 = (uint64_t)v21;
        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v65 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        uint64_t v142 = [v65 dateFromString:v13];

        goto LABEL_38;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v13;
        goto LABEL_26;
      }
      if (a4)
      {
        v121 = v9;
        id v122 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v123 = *MEMORY[0x1E4F502C8];
        uint64_t v179 = *MEMORY[0x1E4F28568];
        id v124 = v8;
        id v125 = [NSString alloc];
        uint64_t v135 = objc_opt_class();
        v126 = v125;
        id v8 = v124;
        id v143 = (id)[v126 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v135, @"timestamp"];
        id v180 = v143;
        uint64_t v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
        v128 = v122;
        v9 = v121;
        uint64_t v129 = v123;
        long long v10 = v153;
        v144 = (void *)v127;
        id v130 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
        v61 = 0;
        v131 = a4;
        a4 = 0;
        id *v131 = v130;
        v24 = v151;
        v35 = v147;
        goto LABEL_109;
      }
      v61 = 0;
LABEL_35:
      v24 = v151;
      v35 = v147;
      goto LABEL_110;
    }
  }
  uint64_t v142 = 0;
LABEL_38:
  uint64_t v66 = [v6 objectForKeyedSubscript:@"sender"];
  v140 = v9;
  id v141 = v8;
  v144 = (void *)v66;
  if (v66 && (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
        v88 = v7;
        uint64_t v89 = *MEMORY[0x1E4F502C8];
        uint64_t v177 = *MEMORY[0x1E4F28568];
        id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sender"];
        id v178 = v68;
        v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
        v90 = v87;
        long long v10 = v153;
        uint64_t v91 = v89;
        uint64_t v7 = v88;
        id v92 = (id)[v90 initWithDomain:v91 code:2 userInfo:v71];
        id v143 = 0;
        v93 = a4;
        a4 = 0;
        id *v93 = v92;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        goto LABEL_107;
      }
      id v143 = 0;
      v24 = v151;
      v35 = v147;
      v61 = (void *)v142;
      goto LABEL_109;
    }
    id v143 = v67;
  }
  else
  {
    id v143 = 0;
  }
  id v68 = [v6 objectForKeyedSubscript:@"recipients"];
  v69 = [MEMORY[0x1E4F1CA98] null];
  int v70 = [v68 isEqual:v69];

  id v139 = v11;
  if (v70)
  {
    v138 = v6;

    id v68 = 0;
  }
  else
  {
    if (v68)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v24 = v151;
          long long v10 = v153;
          v35 = v147;
          v61 = (void *)v142;
          goto LABEL_108;
        }
        id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v109 = *MEMORY[0x1E4F502C8];
        uint64_t v175 = *MEMORY[0x1E4F28568];
        v71 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"recipients"];
        v176 = v71;
        id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
        id v110 = (id)[v108 initWithDomain:v109 code:2 userInfo:v77];
        v111 = a4;
        a4 = 0;
        id *v111 = v110;
        goto LABEL_85;
      }
    }
    v138 = v6;
  }
  v71 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v68, "count"));
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v68 = v68;
  uint64_t v72 = [v68 countByEnumeratingWithState:&v159 objects:v174 count:16];
  v145 = a4;
  if (!v72) {
    goto LABEL_55;
  }
  uint64_t v73 = v72;
  uint64_t v74 = *(void *)v160;
  v136 = v7;
  do
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      if (*(void *)v160 != v74) {
        objc_enumerationMutation(v68);
      }
      uint64_t v76 = *(void *)(*((void *)&v159 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v81 = *MEMORY[0x1E4F502C8];
          uint64_t v172 = *MEMORY[0x1E4F28568];
          v148 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"recipients"];
          v173 = v148;
          v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
          v83 = v80;
          uint64_t v84 = v81;
LABEL_63:
          id v6 = v138;
          v24 = v151;
          v61 = (void *)v142;
          *a4 = (id)[v83 initWithDomain:v84 code:2 userInfo:v82];

          a4 = 0;
          id v77 = v68;
          uint64_t v7 = v136;
          long long v10 = v153;
          v35 = v147;
          goto LABEL_105;
        }
LABEL_64:
        id v77 = v68;
        uint64_t v7 = v136;
        id v6 = v138;
LABEL_85:
        v24 = v151;
        long long v10 = v153;
LABEL_86:
        v35 = v147;
        v61 = (void *)v142;
        goto LABEL_106;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v86 = *MEMORY[0x1E4F502C8];
          uint64_t v170 = *MEMORY[0x1E4F28568];
          v148 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recipients"];
          v171 = v148;
          v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
          v83 = v85;
          uint64_t v84 = v86;
          a4 = v145;
          goto LABEL_63;
        }
        goto LABEL_64;
      }
      [v71 addObject:v76];
    }
    uint64_t v73 = [v68 countByEnumeratingWithState:&v159 objects:v174 count:16];
    uint64_t v7 = v136;
  }
  while (v73);
LABEL_55:

  id v77 = [v138 objectForKeyedSubscript:@"termCount"];
  v78 = [MEMORY[0x1E4F1CA98] null];
  int v79 = [v77 isEqual:v78];

  if (v79)
  {

    id v77 = 0;
    goto LABEL_71;
  }
  if (v77)
  {
    objc_opt_class();
    long long v10 = v153;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v95 = *MEMORY[0x1E4F502C8];
        uint64_t v168 = *MEMORY[0x1E4F28568];
        v149 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"termCount"];
        v169 = v149;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
        v97 = v96 = v7;
        uint64_t v98 = v95;
        long long v10 = v153;
        *a4 = (id)[v94 initWithDomain:v98 code:2 userInfo:v97];

        uint64_t v7 = v96;
        a4 = 0;
        id v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;

        goto LABEL_106;
      }
      id v6 = v138;
      v24 = v151;
      goto LABEL_86;
    }
  }
  else
  {
LABEL_71:
    long long v10 = v153;
  }
  v148 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v77, "count"));
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v77 = v77;
  uint64_t v99 = [v77 countByEnumeratingWithState:&v155 objects:v167 count:16];
  if (!v99) {
    goto LABEL_82;
  }
  uint64_t v100 = v99;
  uint64_t v101 = *(void *)v156;
  v137 = v7;
  while (2)
  {
    uint64_t v102 = 0;
    while (2)
    {
      if (*(void *)v156 != v101) {
        objc_enumerationMutation(v77);
      }
      v103 = *(void **)(*((void *)&v155 + 1) + 8 * v102);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        if (a4)
        {
          id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v113 = *MEMORY[0x1E4F502C8];
          uint64_t v165 = *MEMORY[0x1E4F28568];
          v114 = a4;
          id v104 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"termCount"];
          id v166 = v104;
          v115 = (void *)MEMORY[0x1E4F1C9E8];
          v116 = &v166;
          v117 = &v165;
LABEL_99:
          v118 = [v115 dictionaryWithObjects:v116 forKeys:v117 count:1];
          v119 = v112;
          v35 = v147;
          id *v114 = (id)[v119 initWithDomain:v113 code:2 userInfo:v118];
LABEL_103:
          v61 = (void *)v142;

          long long v10 = v153;
        }
LABEL_104:

        a4 = 0;
        uint64_t v7 = v137;
        goto LABEL_105;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v138;
        v24 = v151;
        v35 = v147;
        v61 = (void *)v142;
        if (a4)
        {
          id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v113 = *MEMORY[0x1E4F502C8];
          uint64_t v163 = *MEMORY[0x1E4F28568];
          v114 = a4;
          id v104 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"termCount"];
          id v164 = v104;
          v115 = (void *)MEMORY[0x1E4F1C9E8];
          v116 = &v164;
          v117 = &v163;
          goto LABEL_99;
        }
        goto LABEL_104;
      }
      id v104 = v103;
      v105 = [BMIntelligencePlatformMessageTermsTermCount alloc];
      id v154 = 0;
      v106 = [(BMIntelligencePlatformMessageTermsTermCount *)v105 initWithJSONDictionary:v104 error:&v154];
      id v107 = v154;
      if (v107)
      {
        v118 = v107;
        if (v145) {
          id *v145 = v107;
        }

        id v6 = v138;
        v24 = v151;
        v35 = v147;
        goto LABEL_103;
      }
      [v148 addObject:v106];

      ++v102;
      long long v10 = v153;
      a4 = v145;
      if (v100 != v102) {
        continue;
      }
      break;
    }
    uint64_t v100 = [v77 countByEnumeratingWithState:&v155 objects:v167 count:16];
    uint64_t v7 = v137;
    if (v100) {
      continue;
    }
    break;
  }
LABEL_82:

  v35 = v147;
  v24 = v151;
  v61 = (void *)v142;
  a4 = [(BMIntelligencePlatformMessageTerms *)v152 initWithProtoVersion:v141 bundleID:v151 domain:v147 spotlightIdentifier:v139 timestamp:v142 sender:v143 recipients:v71 termCount:v148];
  v152 = (BMIntelligencePlatformMessageTerms *)a4;
  id v6 = v138;
LABEL_105:

LABEL_106:
  id v11 = v139;
LABEL_107:

  id v8 = v141;
LABEL_108:

  v9 = v140;
LABEL_109:

LABEL_110:
LABEL_111:

  self = v152;
LABEL_112:

LABEL_113:
LABEL_114:

  return (BMIntelligencePlatformMessageTerms *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMIntelligencePlatformMessageTerms *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasProtoVersion) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_spotlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sender) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_recipients;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v10 = self->_termCount;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        [v15 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMIntelligencePlatformMessageTerms;
  uint64_t v5 = [(BMEventBase *)&v45 init];
  if (!v5)
  {
LABEL_52:
    uint64_t v43 = v5;
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_50:
    uint64_t v38 = [v6 copy];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v38;

    uint64_t v40 = [v7 copy];
    termCount = v5->_termCount;
    v5->_termCount = (NSArray *)v40;

    int v42 = v4[*v10];
    if (v42) {
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_50;
    }
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v8;
      uint64_t v16 = *(void *)&v4[v15];
      unint64_t v17 = v16 + 1;
      if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
      *(void *)&v4[v15] = v17;
      v14 |= (unint64_t)(v18 & 0x7F) << v12;
      if ((v18 & 0x80) == 0) {
        goto LABEL_13;
      }
      v12 += 7;
      BOOL v19 = v13++ >= 9;
      if (v19)
      {
        unint64_t v14 = 0;
        int v20 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    int v20 = v4[*v10];
    if (v4[*v10]) {
      unint64_t v14 = 0;
    }
LABEL_15:
    if (v20 || (v14 & 7) == 4) {
      goto LABEL_50;
    }
    switch((v14 >> 3))
    {
      case 1u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        v5->_hasProtoVersion = 1;
        while (1)
        {
          uint64_t v25 = *v8;
          uint64_t v26 = *(void *)&v4[v25];
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)&v4[*v9]) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)&v4[*v11] + v26);
          *(void *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0) {
            goto LABEL_44;
          }
          v22 += 7;
          BOOL v19 = v23++ >= 9;
          if (v19)
          {
            LODWORD(v24) = 0;
            goto LABEL_46;
          }
        }
        v4[*v10] = 1;
LABEL_44:
        if (v4[*v10]) {
          LODWORD(v24) = 0;
        }
LABEL_46:
        v5->_protoVersion = v24;
        goto LABEL_49;
      case 2u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 48;
        goto LABEL_36;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 56;
        goto LABEL_36;
      case 4u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 64;
        goto LABEL_36;
      case 5u:
        v5->_hasRaw_timestamp = 1;
        uint64_t v31 = *v8;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)&v4[*v9])
        {
          double v33 = *(double *)(*(void *)&v4[*v11] + v32);
          *(void *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v10] = 1;
          double v33 = 0.0;
        }
        v5->_raw_timestamp = v33;
        goto LABEL_49;
      case 6u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 72;
LABEL_36:
        v34 = *(Class *)((char *)&v5->super.super.isa + v30);
        *(Class *)((char *)&v5->super.super.isa + v30) = (Class)v29;

        goto LABEL_49;
      case 7u:
        uint64_t v35 = PBReaderReadString();
        if (!v35) {
          goto LABEL_54;
        }
        uint64_t v36 = (void *)v35;
        [v6 addObject:v35];
        goto LABEL_42;
      case 8u:
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_54;
        }
        id v37 = [[BMIntelligencePlatformMessageTermsTermCount alloc] initByReadFrom:v4];
        if (!v37) {
          goto LABEL_54;
        }
        uint64_t v36 = v37;
        [v7 addObject:v37];
        PBReaderRecallMark();
LABEL_42:

        goto LABEL_49;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_49:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_50;
          }
          continue;
        }
LABEL_54:

LABEL_51:
        uint64_t v43 = 0;
LABEL_53:

        return v43;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformMessageTerms protoVersion](self, "protoVersion"));
  uint64_t v5 = [(BMIntelligencePlatformMessageTerms *)self bundleID];
  uint64_t v6 = [(BMIntelligencePlatformMessageTerms *)self domain];
  uint64_t v7 = [(BMIntelligencePlatformMessageTerms *)self spotlightIdentifier];
  uint64_t v8 = [(BMIntelligencePlatformMessageTerms *)self timestamp];
  v9 = [(BMIntelligencePlatformMessageTerms *)self sender];
  long long v10 = [(BMIntelligencePlatformMessageTerms *)self recipients];
  uint64_t v11 = [(BMIntelligencePlatformMessageTerms *)self termCount];
  char v12 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformMessageTerms with protoVersion: %@, bundleID: %@, domain: %@, spotlightIdentifier: %@, timestamp: %@, sender: %@, recipients: %@, termCount: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMIntelligencePlatformMessageTerms)initWithProtoVersion:(id)a3 bundleID:(id)a4 domain:(id)a5 spotlightIdentifier:(id)a6 timestamp:(id)a7 sender:(id)a8 recipients:(id)a9 termCount:(id)a10
{
  id v16 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v24 = a8;
  id v23 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMIntelligencePlatformMessageTerms;
  BOOL v19 = [(BMEventBase *)&v28 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v19->_hasProtoVersion = 1;
      int v20 = [v16 intValue];
    }
    else
    {
      v19->_hasProtoVersion = 0;
      int v20 = -1;
    }
    v19->_protoVersion = v20;
    objc_storeStrong((id *)&v19->_bundleID, a4);
    objc_storeStrong((id *)&v19->_domain, a5);
    objc_storeStrong((id *)&v19->_spotlightIdentifier, a6);
    if (v17)
    {
      v19->_hasRaw_timestamp = 1;
      [v17 timeIntervalSince1970];
    }
    else
    {
      v19->_hasRaw_timestamp = 0;
      double v21 = -1.0;
    }
    v19->_raw_timestamp = v21;
    objc_storeStrong((id *)&v19->_sender, a8);
    objc_storeStrong((id *)&v19->_recipients, a9);
    objc_storeStrong((id *)&v19->_termCount, a10);
  }

  return v19;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"protoVersion" number:1 type:2 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domain" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"spotlightIdentifier" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:5 type:0 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sender" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recipients" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"termCount" number:8 type:14 subMessageClass:objc_opt_class()];
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4860;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"protoVersion" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:2 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domain" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"spotlightIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sender" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"recipients_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_244];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"termCount_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_246];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

id __45__BMIntelligencePlatformMessageTerms_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _termCountJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __45__BMIntelligencePlatformMessageTerms_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _recipientsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMIntelligencePlatformMessageTerms alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end