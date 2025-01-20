@interface BMGeneratedImageUserInteraction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMGeneratedImageUserInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMGeneratedImageUserInteraction)initWithTimestamp:(id)a3 prompt:(id)a4 tokenLength:(id)a5 identifier:(id)a6 topic:(id)a7 usage:(id)a8 userInterfaceLanguage:(id)a9 userSetRegionFormat:(id)a10 personalization:(int)a11 result:(int)a12 feature:(int)a13;
- (BOOL)hasTokenLength;
- (BOOL)hasUsage;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)prompt;
- (NSString)topic;
- (NSString)userInterfaceLanguage;
- (NSString)userSetRegionFormat;
- (NSUUID)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)feature;
- (int)personalization;
- (int)result;
- (int)tokenLength;
- (int)usage;
- (unsigned)dataVersion;
- (void)setHasTokenLength:(BOOL)a3;
- (void)setHasUsage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMGeneratedImageUserInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSetRegionFormat, 0);
  objc_storeStrong((id *)&self->_userInterfaceLanguage, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_raw_identifier, 0);
}

- (int)feature
{
  return self->_feature;
}

- (int)result
{
  return self->_result;
}

- (int)personalization
{
  return self->_personalization;
}

- (NSString)userSetRegionFormat
{
  return self->_userSetRegionFormat;
}

- (NSString)userInterfaceLanguage
{
  return self->_userInterfaceLanguage;
}

- (void)setHasUsage:(BOOL)a3
{
  self->_hasUsage = a3;
}

- (BOOL)hasUsage
{
  return self->_hasUsage;
}

- (int)usage
{
  return self->_usage;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setHasTokenLength:(BOOL)a3
{
  self->_hasTokenLength = a3;
}

- (BOOL)hasTokenLength
{
  return self->_hasTokenLength;
}

- (int)tokenLength
{
  return self->_tokenLength;
}

- (NSString)prompt
{
  return self->_prompt;
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
    v6 = [(BMGeneratedImageUserInteraction *)self timestamp];
    uint64_t v7 = [v5 timestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMGeneratedImageUserInteraction *)self timestamp];
      v10 = [v5 timestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_40;
      }
    }
    v13 = [(BMGeneratedImageUserInteraction *)self prompt];
    uint64_t v14 = [v5 prompt];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMGeneratedImageUserInteraction *)self prompt];
      v17 = [v5 prompt];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_40;
      }
    }
    if ([(BMGeneratedImageUserInteraction *)self hasTokenLength]
      || [v5 hasTokenLength])
    {
      if (![(BMGeneratedImageUserInteraction *)self hasTokenLength]) {
        goto LABEL_40;
      }
      if (![v5 hasTokenLength]) {
        goto LABEL_40;
      }
      int v19 = [(BMGeneratedImageUserInteraction *)self tokenLength];
      if (v19 != [v5 tokenLength]) {
        goto LABEL_40;
      }
    }
    v20 = [(BMGeneratedImageUserInteraction *)self identifier];
    uint64_t v21 = [v5 identifier];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMGeneratedImageUserInteraction *)self identifier];
      v24 = [v5 identifier];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_40;
      }
    }
    v26 = [(BMGeneratedImageUserInteraction *)self topic];
    uint64_t v27 = [v5 topic];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMGeneratedImageUserInteraction *)self topic];
      v30 = [v5 topic];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_40;
      }
    }
    if (-[BMGeneratedImageUserInteraction hasUsage](self, "hasUsage") || [v5 hasUsage])
    {
      if (![(BMGeneratedImageUserInteraction *)self hasUsage]) {
        goto LABEL_40;
      }
      if (![v5 hasUsage]) {
        goto LABEL_40;
      }
      int v32 = [(BMGeneratedImageUserInteraction *)self usage];
      if (v32 != [v5 usage]) {
        goto LABEL_40;
      }
    }
    v33 = [(BMGeneratedImageUserInteraction *)self userInterfaceLanguage];
    uint64_t v34 = [v5 userInterfaceLanguage];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(BMGeneratedImageUserInteraction *)self userInterfaceLanguage];
      v37 = [v5 userInterfaceLanguage];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_40;
      }
    }
    v39 = [(BMGeneratedImageUserInteraction *)self userSetRegionFormat];
    uint64_t v40 = [v5 userSetRegionFormat];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMGeneratedImageUserInteraction *)self userSetRegionFormat];
      v43 = [v5 userSetRegionFormat];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_40;
      }
    }
    int v45 = [(BMGeneratedImageUserInteraction *)self personalization];
    if (v45 == [v5 personalization])
    {
      int v46 = [(BMGeneratedImageUserInteraction *)self result];
      if (v46 == [v5 result])
      {
        int v47 = [(BMGeneratedImageUserInteraction *)self feature];
        BOOL v12 = v47 == [v5 feature];
LABEL_41:

        goto LABEL_42;
      }
    }
LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }
  BOOL v12 = 0;
LABEL_42:

  return v12;
}

- (NSUUID)identifier
{
  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_identifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
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
  v42[11] = *MEMORY[0x1E4F143B8];
  v3 = [(BMGeneratedImageUserInteraction *)self timestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMGeneratedImageUserInteraction *)self timestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMGeneratedImageUserInteraction *)self prompt];
  if ([(BMGeneratedImageUserInteraction *)self hasTokenLength])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction tokenLength](self, "tokenLength"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(BMGeneratedImageUserInteraction *)self identifier];
  uint64_t v10 = [v9 UUIDString];

  uint64_t v11 = [(BMGeneratedImageUserInteraction *)self topic];
  if ([(BMGeneratedImageUserInteraction *)self hasUsage])
  {
    uint64_t v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction usage](self, "usage"));
  }
  else
  {
    uint64_t v40 = 0;
  }
  v39 = [(BMGeneratedImageUserInteraction *)self userInterfaceLanguage];
  int v38 = [(BMGeneratedImageUserInteraction *)self userSetRegionFormat];
  BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction personalization](self, "personalization"));
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction result](self, "result"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction feature](self, "feature"));
  v41[0] = @"timestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v15;
  v42[0] = v15;
  v41[1] = @"prompt";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v16;
  v42[1] = v16;
  v41[2] = @"tokenLength";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v17;
  v42[2] = v17;
  v41[3] = @"identifier";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v18;
  v42[3] = v18;
  v41[4] = @"topic";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v7;
  v37 = (void *)v6;
  v28 = (void *)v19;
  v42[4] = v19;
  v41[5] = @"usage";
  v20 = v40;
  if (!v40)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v8;
  v42[5] = v20;
  v41[6] = @"userInterfaceLanguage";
  uint64_t v21 = v39;
  if (!v39)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v34 = (void *)v10;
  v42[6] = v21;
  v41[7] = @"userSetRegionFormat";
  v22 = v38;
  if (!v38)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v42[7] = v22;
  v41[8] = @"personalization";
  v24 = v12;
  if (!v12)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[8] = v24;
  v41[9] = @"result";
  int v25 = v13;
  if (!v13)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[9] = v25;
  v41[10] = @"feature";
  v26 = v14;
  if (!v14)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[10] = v26;
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:11];
  if (v14)
  {
    if (v13) {
      goto LABEL_34;
    }
LABEL_50:

    if (v12) {
      goto LABEL_35;
    }
    goto LABEL_51;
  }

  if (!v13) {
    goto LABEL_50;
  }
LABEL_34:
  if (v12) {
    goto LABEL_35;
  }
LABEL_51:

LABEL_35:
  if (!v38) {

  }
  if (!v39) {
  if (!v40)
  }

  if (v23)
  {
    if (v34) {
      goto LABEL_43;
    }
  }
  else
  {

    if (v34)
    {
LABEL_43:
      if (v35) {
        goto LABEL_44;
      }
      goto LABEL_54;
    }
  }

  if (v35)
  {
LABEL_44:
    if (v36) {
      goto LABEL_45;
    }
LABEL_55:

    if (v37) {
      goto LABEL_46;
    }
    goto LABEL_56;
  }
LABEL_54:

  if (!v36) {
    goto LABEL_55;
  }
LABEL_45:
  if (v37) {
    goto LABEL_46;
  }
LABEL_56:

LABEL_46:

  return v33;
}

- (BMGeneratedImageUserInteraction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v154[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"timestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v129 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v7;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    v13 = (id *)[v10 initWithTimeIntervalSince1970:v12];
LABEL_6:
    v129 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v38 = 0;
        goto LABEL_108;
      }
      id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v93 = *MEMORY[0x1E4F502C8];
      uint64_t v153 = *MEMORY[0x1E4F28568];
      v37 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
      v154[0] = v37;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:&v153 count:1];
      id v94 = (id)[v92 initWithDomain:v93 code:2 userInfo:v15];
      int v38 = 0;
      *a4 = v94;
      a4 = 0;
      goto LABEL_107;
    }
    v13 = v7;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v129 = [v14 dateFromString:v7];

LABEL_9:
  uint64_t v15 = [v6 objectForKeyedSubscript:@"prompt"];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v130 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v130 = v15;
LABEL_12:
    uint64_t v16 = [v6 objectForKeyedSubscript:@"tokenLength"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v17 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
LABEL_15:
      id v18 = [v6 objectForKeyedSubscript:@"identifier"];
      v125 = self;
      id v126 = v18;
      id v127 = v17;
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v128 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v115 = v16;
        id v18 = v18;
        uint64_t v30 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
        if (!v30)
        {
          v128 = v18;
          if (a4)
          {
            v86 = a4;
            id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v88 = *MEMORY[0x1E4F502C8];
            uint64_t v147 = *MEMORY[0x1E4F28568];
            v89 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"identifier"];
            v148 = v89;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
            v91 = id v90 = v18;
            id *v86 = (id)[v87 initWithDomain:v88 code:2 userInfo:v91];

            int v38 = 0;
            id v18 = v90;
          }
          else
          {
            int v38 = 0;
          }
          uint64_t v16 = v115;
          self = v125;
          a4 = v129;
          v37 = v130;
          goto LABEL_103;
        }
        int v31 = (void *)v30;

        v128 = v31;
        uint64_t v16 = v115;
        id v18 = v126;
LABEL_18:
        uint64_t v19 = [v6 objectForKeyedSubscript:@"topic"];
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v124 = 0;
              int v38 = 0;
              a4 = v129;
              v37 = v130;
              id v18 = v126;
              goto LABEL_102;
            }
            v51 = v16;
            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v53 = *MEMORY[0x1E4F502C8];
            uint64_t v143 = *MEMORY[0x1E4F28568];
            id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"topic"];
            id v144 = v123;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
            v55 = v52;
            uint64_t v16 = v51;
            self = v125;
            v121 = (void *)v54;
            id v56 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v53, 2);
            id v124 = 0;
            int v38 = 0;
            *a4 = v56;
            a4 = v129;
            v37 = v130;
            id v18 = v126;
LABEL_101:

LABEL_102:
LABEL_103:
            id v17 = v127;
            goto LABEL_104;
          }
          v20 = a4;
          id v124 = v19;
          id v18 = v126;
        }
        else
        {
          v20 = a4;
          id v124 = 0;
        }
        uint64_t v21 = [v6 objectForKeyedSubscript:@"usage"];
        v121 = (void *)v21;
        if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v20)
            {
              id v123 = 0;
              int v38 = 0;
              a4 = v129;
              v37 = v130;
              self = v125;
              goto LABEL_101;
            }
            v57 = v20;
            v58 = v16;
            id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v60 = *MEMORY[0x1E4F502C8];
            uint64_t v141 = *MEMORY[0x1E4F28568];
            id v61 = [NSString alloc];
            uint64_t v107 = objc_opt_class();
            v62 = v61;
            id v18 = v126;
            id v122 = (id)[v62 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v107, @"usage"];
            id v142 = v122;
            uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
            v64 = v59;
            uint64_t v16 = v58;
            self = v125;
            v119 = (void *)v63;
            id v65 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v60, 2);
            id v123 = 0;
            int v38 = 0;
            id *v57 = v65;
            a4 = v129;
            v37 = v130;
            goto LABEL_100;
          }
          id v123 = v22;
        }
        else
        {
          id v123 = 0;
        }
        uint64_t v23 = [v6 objectForKeyedSubscript:@"userInterfaceLanguage"];
        v118 = v7;
        v119 = (void *)v23;
        if (v23 && (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v20)
            {
              id v122 = 0;
              int v38 = 0;
              a4 = v129;
              v37 = v130;
              self = v125;
              id v18 = v126;
              goto LABEL_100;
            }
            v117 = v20;
            v66 = v16;
            id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v139 = *MEMORY[0x1E4F28568];
            id v120 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userInterfaceLanguage"];
            id v140 = v120;
            uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            v70 = v67;
            uint64_t v16 = v66;
            self = v125;
            v113 = (void *)v69;
            id v71 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v68, 2);
            id v122 = 0;
            int v38 = 0;
            id *v117 = v71;
            a4 = v129;
            v37 = v130;
            goto LABEL_98;
          }
          int v25 = v15;
          id v122 = v24;
        }
        else
        {
          int v25 = v15;
          id v122 = 0;
        }
        uint64_t v26 = [v6 objectForKeyedSubscript:@"userSetRegionFormat"];
        v113 = (void *)v26;
        if (v26 && (uint64_t v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v20)
            {
              id v120 = 0;
              int v38 = 0;
              a4 = v129;
              v37 = v130;
              self = v125;
              id v18 = v126;
              uint64_t v15 = v25;
              uint64_t v7 = v118;
              goto LABEL_99;
            }
            v72 = v20;
            v73 = v16;
            id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v75 = *MEMORY[0x1E4F502C8];
            uint64_t v137 = *MEMORY[0x1E4F28568];
            v116 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userSetRegionFormat"];
            v138 = v116;
            uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
            v77 = v74;
            uint64_t v16 = v73;
            self = v125;
            v112 = (void *)v76;
            id v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v75, 2);
            id v120 = 0;
            int v38 = 0;
            id *v72 = v78;
            a4 = v129;
            v37 = v130;
            uint64_t v15 = v25;
            uint64_t v7 = v118;
            goto LABEL_97;
          }
          id v120 = v27;
        }
        else
        {
          id v120 = 0;
        }
        uint64_t v28 = [v6 objectForKeyedSubscript:@"personalization"];
        uint64_t v15 = v25;
        v114 = v16;
        v112 = (void *)v28;
        if (v28 && (v29 = (void *)v28, objc_opt_class(), uint64_t v7 = v118, (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v50 = v29;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v20)
              {
                v116 = 0;
                int v38 = 0;
                a4 = v129;
                v37 = v130;
                self = v125;
                goto LABEL_97;
              }
              id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v99 = *MEMORY[0x1E4F502C8];
              uint64_t v135 = *MEMORY[0x1E4F28568];
              id v80 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"personalization"];
              id v136 = v80;
              v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
              id v100 = (id)[v98 initWithDomain:v99 code:2 userInfo:v79];
              v116 = 0;
              int v38 = 0;
              id *v20 = v100;
              a4 = v129;
              v37 = v130;
              self = v125;
LABEL_96:

              uint64_t v7 = v118;
              uint64_t v16 = v114;
LABEL_97:

LABEL_98:
              id v18 = v126;
LABEL_99:

LABEL_100:
              goto LABEL_101;
            }
            id v50 = [NSNumber numberWithInt:BMGeneratedImageUserInteractionPersonalizationFromString(v29)];
          }
          v116 = v50;
        }
        else
        {
          v116 = 0;
        }
        v79 = [v6 objectForKeyedSubscript:@"result"];
        v110 = v15;
        v111 = v19;
        if (v79 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v83 = v125;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v20)
              {
                id v80 = 0;
                int v38 = 0;
                self = v125;
                a4 = v129;
                v37 = v130;
                goto LABEL_95;
              }
              id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v102 = *MEMORY[0x1E4F502C8];
              uint64_t v133 = *MEMORY[0x1E4F28568];
              v84 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"result"];
              v134 = v84;
              v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
              id v103 = (id)[v101 initWithDomain:v102 code:2 userInfo:v82];
              id v80 = 0;
              int v38 = 0;
              id *v20 = v103;
              goto LABEL_120;
            }
            id v80 = [NSNumber numberWithInt:BMGeneratedImageUserInteractionResultFromString(v79)];
            id v81 = v130;
LABEL_76:
            id v130 = v81;
            v82 = [v6 objectForKeyedSubscript:@"feature"];
            if (!v82 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v83 = v125;
              v84 = 0;
LABEL_93:
              unsigned int v95 = [v116 intValue];
              unsigned int v96 = [v80 intValue];
              LODWORD(v108) = [v84 intValue];
              a4 = v129;
              v37 = v130;
              self = -[BMGeneratedImageUserInteraction initWithTimestamp:prompt:tokenLength:identifier:topic:usage:userInterfaceLanguage:userSetRegionFormat:personalization:result:feature:](v83, "initWithTimestamp:prompt:tokenLength:identifier:topic:usage:userInterfaceLanguage:userSetRegionFormat:personalization:result:feature:", v129, v122, v120, __PAIR64__(v96, v95), v108);
              int v38 = self;
LABEL_94:

              uint64_t v15 = v110;
LABEL_95:
              uint64_t v19 = v111;
              goto LABEL_96;
            }
            v83 = v125;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v85 = v82;
LABEL_92:
              v84 = v85;
              goto LABEL_93;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v85 = [NSNumber numberWithInt:BMGeneratedImageUserInteractionFeatureFromString(v82)];
              goto LABEL_92;
            }
            if (v20)
            {
              id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v109 = *MEMORY[0x1E4F502C8];
              uint64_t v131 = *MEMORY[0x1E4F28568];
              v105 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"feature"];
              v132 = v105;
              v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
              id *v20 = (id)[v104 initWithDomain:v109 code:2 userInfo:v106];
            }
            v84 = 0;
            int v38 = 0;
LABEL_120:
            self = v83;
            a4 = v129;
            v37 = v130;
            goto LABEL_94;
          }
          id v80 = v79;
        }
        else
        {
          id v80 = 0;
        }
        id v81 = v130;
        goto LABEL_76;
      }
      if (!a4)
      {
        int v38 = 0;
        a4 = v129;
        v37 = v130;
LABEL_105:

        goto LABEL_106;
      }
      int v45 = v16;
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F502C8];
      uint64_t v145 = *MEMORY[0x1E4F28568];
      v128 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
      v146 = v128;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      v49 = v46;
      uint64_t v16 = v45;
      self = v125;
      *a4 = (id)[v49 initWithDomain:v47 code:2 userInfo:v48];

      int v38 = 0;
LABEL_52:
      a4 = v129;
      v37 = v130;
LABEL_104:

      goto LABEL_105;
    }
    if (a4)
    {
      v39 = self;
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v149 = *MEMORY[0x1E4F28568];
      id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tokenLength"];
      id v150 = v18;
      uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
      v43 = v40;
      self = v39;
      v128 = (void *)v42;
      id v44 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v41, 2);
      id v17 = 0;
      int v38 = 0;
      *a4 = v44;
      goto LABEL_52;
    }
    id v17 = 0;
    int v38 = 0;
    a4 = v129;
    v37 = v130;
LABEL_106:

    goto LABEL_107;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v33 = *MEMORY[0x1E4F502C8];
    uint64_t v151 = *MEMORY[0x1E4F28568];
    id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"prompt"];
    id v152 = v17;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    v35 = v32;
    uint64_t v16 = (void *)v34;
    id v36 = (id)[v35 initWithDomain:v33 code:2 userInfo:v34];
    v37 = 0;
    int v38 = 0;
    *a4 = v36;
    a4 = v129;
    goto LABEL_106;
  }
  v37 = 0;
  int v38 = 0;
  a4 = v129;
LABEL_107:

LABEL_108:
  return v38;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMGeneratedImageUserInteraction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_prompt) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTokenLength) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_raw_identifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_topic) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasUsage) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_userInterfaceLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_userSetRegionFormat) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)BMGeneratedImageUserInteraction;
  id v5 = [(BMEventBase *)&v70 init];
  if (!v5)
  {
LABEL_100:
    uint64_t v68 = v5;
    goto LABEL_101;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_98:
    if (v4[*v8]) {
      goto LABEL_99;
    }
    goto LABEL_100;
  }
  id v9 = &OBJC_IVAR___BMAeroMLPhotosSearchLabeledData__hasL1Score;
  id v10 = &OBJC_IVAR___BMAeroMLPhotosSearchLabeledData__hasL1Score;
  double v11 = (int *)MEMORY[0x1E4F940B8];
  double v12 = &OBJC_IVAR___BMAeroMLPhotosSearchLabeledData__hasL1Score;
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_98;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v6;
      uint64_t v17 = *(void *)&v4[v16];
      unint64_t v18 = v17 + 1;
      if (v17 == -1 || v18 > *(void *)&v4[*v7]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v4[*v11] + v17);
      *(void *)&v4[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0) {
        goto LABEL_13;
      }
      v13 += 7;
      BOOL v20 = v14++ >= 9;
      if (v20)
      {
        unint64_t v15 = 0;
        int v21 = v4[*v8];
        goto LABEL_15;
      }
    }
    v4[*v8] = 1;
LABEL_13:
    int v21 = v4[*v8];
    if (v4[*v8]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v21 || (v15 & 7) == 4) {
      goto LABEL_98;
    }
    switch((v15 >> 3))
    {
      case 1u:
        *((unsigned char *)&v5->super.super.isa + v9[875]) = 1;
        uint64_t v23 = *v6;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
        {
          int v25 = *(objc_class **)(*(void *)&v4[*v11] + v24);
          *(void *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v8] = 1;
          int v25 = 0;
        }
        *(Class *)((char *)&v5->super.super.isa + v10[876]) = v25;
        goto LABEL_97;
      case 2u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = v12[877];
        goto LABEL_43;
      case 3u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        v5->_hasTokenLength = 1;
        while (2)
        {
          uint64_t v31 = *v6;
          uint64_t v32 = *(void *)&v4[v31];
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)&v4[*v11] + v32);
            *(void *)&v4[v31] = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v20 = v29++ >= 9;
              if (v20)
              {
                LODWORD(v30) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v30) = 0;
        }
LABEL_70:
        uint64_t v66 = 48;
        goto LABEL_75;
      case 4u:
        v35 = v12;
        id v36 = v10;
        v37 = v9;
        PBReaderReadData();
        int v38 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v38 length] == 16)
        {
          raw_identifier = v5->_raw_identifier;
          v5->_raw_identifier = v38;

          id v9 = v37;
          id v10 = v36;
          double v12 = v35;
LABEL_97:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_98;
          }
          continue;
        }

LABEL_99:
        uint64_t v68 = 0;
LABEL_101:

        return v68;
      case 5u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 80;
        goto LABEL_43;
      case 6u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v30 = 0;
        v5->_hasUsage = 1;
        while (2)
        {
          uint64_t v42 = *v6;
          uint64_t v43 = *(void *)&v4[v42];
          unint64_t v44 = v43 + 1;
          if (v43 == -1 || v44 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)&v4[*v11] + v43);
            *(void *)&v4[v42] = v44;
            v30 |= (unint64_t)(v45 & 0x7F) << v40;
            if (v45 < 0)
            {
              v40 += 7;
              BOOL v20 = v41++ >= 9;
              if (v20)
              {
                LODWORD(v30) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v30) = 0;
        }
LABEL_74:
        uint64_t v66 = 52;
LABEL_75:
        *(_DWORD *)((char *)&v5->super.super.isa + v66) = v30;
        goto LABEL_97;
      case 7u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 88;
        goto LABEL_43;
      case 8u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 96;
LABEL_43:
        id v46 = *(Class *)((char *)&v5->super.super.isa + v27);
        *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

        goto LABEL_97;
      case 9u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0;
        while (2)
        {
          uint64_t v50 = *v6;
          uint64_t v51 = *(void *)&v4[v50];
          unint64_t v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)&v4[*v11] + v51);
            *(void *)&v4[v50] = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              BOOL v20 = v48++ >= 9;
              if (v20)
              {
                LODWORD(v49) = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v49) = 0;
        }
LABEL_79:
        if (v49 >= 4) {
          LODWORD(v49) = 0;
        }
        uint64_t v67 = 56;
        goto LABEL_94;
      case 0xAu:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v49 = 0;
        while (2)
        {
          uint64_t v56 = *v6;
          uint64_t v57 = *(void *)&v4[v56];
          unint64_t v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)&v4[*v11] + v57);
            *(void *)&v4[v56] = v58;
            v49 |= (unint64_t)(v59 & 0x7F) << v54;
            if (v59 < 0)
            {
              v54 += 7;
              BOOL v20 = v55++ >= 9;
              if (v20)
              {
                LODWORD(v49) = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v49) = 0;
        }
LABEL_85:
        if (v49 >= 4) {
          LODWORD(v49) = 0;
        }
        uint64_t v67 = 60;
        goto LABEL_94;
      case 0xBu:
        char v60 = 0;
        unsigned int v61 = 0;
        uint64_t v49 = 0;
        while (2)
        {
          uint64_t v62 = *v6;
          uint64_t v63 = *(void *)&v4[v62];
          unint64_t v64 = v63 + 1;
          if (v63 == -1 || v64 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v65 = *(unsigned char *)(*(void *)&v4[*v11] + v63);
            *(void *)&v4[v62] = v64;
            v49 |= (unint64_t)(v65 & 0x7F) << v60;
            if (v65 < 0)
            {
              v60 += 7;
              BOOL v20 = v61++ >= 9;
              if (v20)
              {
                LODWORD(v49) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v49) = 0;
        }
LABEL_91:
        if (v49 >= 4) {
          LODWORD(v49) = 0;
        }
        uint64_t v67 = 64;
LABEL_94:
        *(_DWORD *)((char *)&v5->super.super.isa + v67) = v49;
        goto LABEL_97;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_97;
    }
  }
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v16 = [(BMGeneratedImageUserInteraction *)self timestamp];
  char v13 = [(BMGeneratedImageUserInteraction *)self prompt];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction tokenLength](self, "tokenLength"));
  id v4 = [(BMGeneratedImageUserInteraction *)self identifier];
  id v5 = [(BMGeneratedImageUserInteraction *)self topic];
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGeneratedImageUserInteraction usage](self, "usage"));
  uint64_t v7 = [(BMGeneratedImageUserInteraction *)self userInterfaceLanguage];
  uint64_t v8 = [(BMGeneratedImageUserInteraction *)self userSetRegionFormat];
  id v9 = BMGeneratedImageUserInteractionPersonalizationAsString([(BMGeneratedImageUserInteraction *)self personalization]);
  id v10 = BMGeneratedImageUserInteractionResultAsString([(BMGeneratedImageUserInteraction *)self result]);
  double v11 = BMGeneratedImageUserInteractionFeatureAsString([(BMGeneratedImageUserInteraction *)self feature]);
  id v15 = (id)[v14 initWithFormat:@"BMGeneratedImageUserInteraction with timestamp: %@, prompt: %@, tokenLength: %@, identifier: %@, topic: %@, usage: %@, userInterfaceLanguage: %@, userSetRegionFormat: %@, personalization: %@, result: %@, feature: %@", v16, v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMGeneratedImageUserInteraction)initWithTimestamp:(id)a3 prompt:(id)a4 tokenLength:(id)a5 identifier:(id)a6 topic:(id)a7 usage:(id)a8 userInterfaceLanguage:(id)a9 userSetRegionFormat:(id)a10 personalization:(int)a11 result:(int)a12 feature:(int)a13
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id obj = a7;
  id v35 = a7;
  id v23 = a8;
  id v24 = a9;
  int v25 = v19;
  id v26 = a10;
  v36.receiver = self;
  v36.super_class = (Class)BMGeneratedImageUserInteraction;
  uint64_t v27 = [(BMEventBase *)&v36 init];
  if (v27)
  {
    v27->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v25)
    {
      v27->_hasRaw_timestamp = 1;
      [v25 timeIntervalSince1970];
    }
    else
    {
      v27->_hasRaw_timestamp = 0;
      double v28 = -1.0;
    }
    v27->_raw_timestamp = v28;
    objc_storeStrong((id *)&v27->_prompt, a4);
    if (v21)
    {
      v27->_hasTokenLength = 1;
      int v29 = [v21 intValue];
    }
    else
    {
      v27->_hasTokenLength = 0;
      int v29 = -1;
    }
    v27->_tokenLength = v29;
    if (v22)
    {
      v37[0] = 0;
      v37[1] = 0;
      [v22 getUUIDBytes:v37];
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v37 length:16];
      raw_identifier = v27->_raw_identifier;
      v27->_raw_identifier = (NSData *)v30;
    }
    else
    {
      raw_identifier = v27->_raw_identifier;
      v27->_raw_identifier = 0;
    }

    objc_storeStrong((id *)&v27->_topic, obj);
    if (v23)
    {
      v27->_hasUsage = 1;
      int v32 = [v23 intValue];
    }
    else
    {
      v27->_hasUsage = 0;
      int v32 = -1;
    }
    v27->_usage = v32;
    objc_storeStrong((id *)&v27->_userInterfaceLanguage, a9);
    objc_storeStrong((id *)&v27->_userSetRegionFormat, a10);
    v27->_personalization = a11;
    v27->_result = a12;
    v27->_feature = a13;
  }

  return v27;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:1 type:0 subMessageClass:0];
  v15[0] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prompt" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tokenLength" number:3 type:2 subMessageClass:0];
  v15[2] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:4 type:14 subMessageClass:0];
  v15[3] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topic" number:5 type:13 subMessageClass:0];
  v15[4] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usage" number:6 type:2 subMessageClass:0];
  v15[5] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userInterfaceLanguage" number:7 type:13 subMessageClass:0];
  v15[6] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSetRegionFormat" number:8 type:13 subMessageClass:0];
  v15[7] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personalization" number:9 type:4 subMessageClass:0];
  v15[8] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"result" number:10 type:4 subMessageClass:0];
  v15[9] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feature" number:11 type:4 subMessageClass:0];
  v15[10] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7AA0;
}

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prompt" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tokenLength" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:6 requestOnly:0 fieldNumber:4 protoDataType:14 convertedType:3];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"topic" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usage" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userInterfaceLanguage" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSetRegionFormat" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personalization" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"result" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feature" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMGeneratedImageUserInteraction alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[11] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end