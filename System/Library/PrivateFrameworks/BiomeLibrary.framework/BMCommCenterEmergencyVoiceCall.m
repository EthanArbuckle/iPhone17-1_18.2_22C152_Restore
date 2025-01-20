@interface BMCommCenterEmergencyVoiceCall
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCommCenterEmergencyVoiceCall)initWithEmNum:(id)a3 MCC:(id)a4 MNC:(id)a5 matchedEmNumSource:(int)a6 sip380Procedure:(int)a7 sip380RedirectedURN:(int)a8 callDuration:(id)a9;
- (BMCommCenterEmergencyVoiceCall)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCallDuration;
- (BOOL)isEqual:(id)a3;
- (NSString)MCC;
- (NSString)MNC;
- (NSString)description;
- (NSString)emNum;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)callDuration;
- (int)matchedEmNumSource;
- (int)sip380Procedure;
- (int)sip380RedirectedURN;
- (unsigned)dataVersion;
- (void)setHasCallDuration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMCommCenterEmergencyVoiceCall

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MNC, 0);
  objc_storeStrong((id *)&self->_MCC, 0);

  objc_storeStrong((id *)&self->_emNum, 0);
}

- (void)setHasCallDuration:(BOOL)a3
{
  self->_hasCallDuration = a3;
}

- (BOOL)hasCallDuration
{
  return self->_hasCallDuration;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (int)sip380RedirectedURN
{
  return self->_sip380RedirectedURN;
}

- (int)sip380Procedure
{
  return self->_sip380Procedure;
}

- (int)matchedEmNumSource
{
  return self->_matchedEmNumSource;
}

- (NSString)MNC
{
  return self->_MNC;
}

- (NSString)MCC
{
  return self->_MCC;
}

- (NSString)emNum
{
  return self->_emNum;
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
    v6 = [(BMCommCenterEmergencyVoiceCall *)self emNum];
    uint64_t v7 = [v5 emNum];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMCommCenterEmergencyVoiceCall *)self emNum];
      v10 = [v5 emNum];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_23;
      }
    }
    v13 = [(BMCommCenterEmergencyVoiceCall *)self MCC];
    uint64_t v14 = [v5 MCC];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMCommCenterEmergencyVoiceCall *)self MCC];
      v17 = [v5 MCC];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    v19 = [(BMCommCenterEmergencyVoiceCall *)self MNC];
    uint64_t v20 = [v5 MNC];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMCommCenterEmergencyVoiceCall *)self MNC];
      v23 = [v5 MNC];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_23;
      }
    }
    int v25 = [(BMCommCenterEmergencyVoiceCall *)self matchedEmNumSource];
    if (v25 == [v5 matchedEmNumSource])
    {
      int v26 = [(BMCommCenterEmergencyVoiceCall *)self sip380Procedure];
      if (v26 == [v5 sip380Procedure])
      {
        int v27 = [(BMCommCenterEmergencyVoiceCall *)self sip380RedirectedURN];
        if (v27 == [v5 sip380RedirectedURN])
        {
          if (![(BMCommCenterEmergencyVoiceCall *)self hasCallDuration]
            && ![v5 hasCallDuration])
          {
            BOOL v12 = 1;
            goto LABEL_24;
          }
          if ([(BMCommCenterEmergencyVoiceCall *)self hasCallDuration]
            && [v5 hasCallDuration])
          {
            int v28 = [(BMCommCenterEmergencyVoiceCall *)self callDuration];
            BOOL v12 = v28 == [v5 callDuration];
LABEL_24:

            goto LABEL_25;
          }
        }
      }
    }
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_24;
  }
  BOOL v12 = 0;
LABEL_25:

  return v12;
}

- (id)jsonDictionary
{
  v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMCommCenterEmergencyVoiceCall *)self emNum];
  uint64_t v4 = [(BMCommCenterEmergencyVoiceCall *)self MCC];
  id v5 = [(BMCommCenterEmergencyVoiceCall *)self MNC];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCommCenterEmergencyVoiceCall matchedEmNumSource](self, "matchedEmNumSource"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCommCenterEmergencyVoiceCall sip380Procedure](self, "sip380Procedure"));
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCommCenterEmergencyVoiceCall sip380RedirectedURN](self, "sip380RedirectedURN"));
  if ([(BMCommCenterEmergencyVoiceCall *)self hasCallDuration])
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCommCenterEmergencyVoiceCall callDuration](self, "callDuration"));
  }
  else
  {
    v9 = 0;
  }
  v24[0] = @"emNum";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = @"MCC";
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = @"MNC";
  uint64_t v12 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = @"matchedEmNumSource";
  v13 = v6;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v4;
  v25[3] = v13;
  v24[4] = @"sip380Procedure";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v14;
  v24[5] = @"sip380RedirectedURN";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v15;
  v24[6] = @"callDuration";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (v9)
  {
    if (v8) {
      goto LABEL_20;
    }
LABEL_30:

    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }

  if (!v8) {
    goto LABEL_30;
  }
LABEL_20:
  if (v7) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v6) {

  }
  if (v5)
  {
    if (v22) {
      goto LABEL_25;
    }
LABEL_33:

    if (v23) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }

  if (!v22) {
    goto LABEL_33;
  }
LABEL_25:
  if (v23) {
    goto LABEL_26;
  }
LABEL_34:

LABEL_26:

  return v17;
}

- (BMCommCenterEmergencyVoiceCall)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"emNum"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v63 = 0;
LABEL_4:
    uint64_t v7 = [v5 objectForKeyedSubscript:@"MCC"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v20 = 0;
          goto LABEL_55;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        v22 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        id v62 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"MCC"];
        id v76 = v62;
        int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        id v25 = (id)[v21 initWithDomain:v23 code:2 userInfo:v24];
        a4 = 0;
        uint64_t v20 = 0;
        id *v22 = v25;
        goto LABEL_54;
      }
      v53 = a4;
      a4 = v7;
    }
    else
    {
      v53 = a4;
      a4 = 0;
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:@"MNC"];
    v58 = (void *)v8;
    if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          id v62 = 0;
          uint64_t v20 = 0;
          int v24 = v58;
          goto LABEL_54;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        v59 = a4;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v73 = *MEMORY[0x1E4F28568];
        v57 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"MNC"];
        v74 = v57;
        int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        uint64_t v29 = v27;
        a4 = v59;
        id v62 = 0;
        uint64_t v20 = 0;
        id *v53 = (id)[v26 initWithDomain:v29 code:2 userInfo:v28];
        int v24 = v58;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      id v62 = v9;
    }
    else
    {
      id v62 = 0;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"matchedEmNumSource"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v57 = 0;
            uint64_t v20 = 0;
            int v24 = v58;
            int v28 = v10;
            goto LABEL_53;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v71 = *MEMORY[0x1E4F28568];
          int v28 = v10;
          v61 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"matchedEmNumSource"];
          v72 = v61;
          uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
          id v46 = (id)[v43 initWithDomain:v44 code:2 userInfo:v45];
          v57 = 0;
          uint64_t v20 = 0;
          id *v53 = v46;
          v37 = (void *)v45;
          int v24 = v58;
          goto LABEL_52;
        }
        id v11 = [NSNumber numberWithInt:BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString(v10)];
      }
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:@"sip380Procedure"];
    v54 = v6;
    v55 = v10;
    v56 = (void *)v12;
    v57 = v11;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v61 = 0;
            uint64_t v20 = 0;
            goto LABEL_51;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v69 = *MEMORY[0x1E4F28568];
          v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sip380Procedure"];
          v70 = v60;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id v49 = (id)[v47 initWithDomain:v48 code:2 userInfo:v30];
          v61 = 0;
          uint64_t v20 = 0;
          id *v53 = v49;
LABEL_50:

          v6 = v54;
LABEL_51:
          int v24 = v58;
          int v28 = v55;
          v37 = v56;
LABEL_52:

          goto LABEL_53;
        }
        id v14 = [NSNumber numberWithInt:BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString(v13)];
      }
      v61 = v14;
    }
    else
    {
      v61 = 0;
    }
    v30 = [v5 objectForKeyedSubscript:@"sip380RedirectedURN"];
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v30;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v60 = 0;
            uint64_t v20 = 0;
            goto LABEL_50;
          }
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v67 = *MEMORY[0x1E4F28568];
          id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sip380RedirectedURN"];
          id v68 = v36;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          id v52 = (id)[v50 initWithDomain:v51 code:2 userInfo:v32];
          v60 = 0;
          uint64_t v20 = 0;
          id *v53 = v52;
          goto LABEL_49;
        }
        id v31 = [NSNumber numberWithInt:BMCommCenterEmergencyVoiceCallEmergencyURNFromString(v30)];
      }
      v60 = v31;
    }
    else
    {
      v60 = 0;
    }
    v32 = [v5 objectForKeyedSubscript:@"callDuration"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v53)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v65 = *MEMORY[0x1E4F28568];
          v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"callDuration"];
          v66 = v41;
          v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          id *v53 = (id)[v39 initWithDomain:v40 code:2 userInfo:v42];
        }
        id v36 = 0;
        uint64_t v20 = 0;
        goto LABEL_49;
      }
      v33 = v7;
      id v35 = v63;
      v34 = self;
      id v36 = v32;
    }
    else
    {
      v33 = v7;
      id v35 = v63;
      v34 = self;
      id v36 = 0;
    }
    id v63 = v35;
    uint64_t v20 = -[BMCommCenterEmergencyVoiceCall initWithEmNum:MCC:MNC:matchedEmNumSource:sip380Procedure:sip380RedirectedURN:callDuration:](v34, "initWithEmNum:MCC:MNC:matchedEmNumSource:sip380Procedure:sip380RedirectedURN:callDuration:", v35, a4, v62, [v11 intValue], objc_msgSend(v61, "intValue"), objc_msgSend(v60, "intValue"), v36);
    self = v20;
    uint64_t v7 = v33;
LABEL_49:

    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v63 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v63 = 0;
    uint64_t v20 = 0;
    goto LABEL_56;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  v16 = a4;
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v77 = *MEMORY[0x1E4F28568];
  int v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"emNum"];
  v78[0] = v18;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
  uint64_t v19 = v17;
  a4 = v18;
  id v63 = 0;
  uint64_t v20 = 0;
  id *v16 = (id)[v15 initWithDomain:v19 code:2 userInfo:v7];
LABEL_55:

LABEL_56:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMCommCenterEmergencyVoiceCall *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_emNum) {
    PBDataWriterWriteStringField();
  }
  if (self->_MCC) {
    PBDataWriterWriteStringField();
  }
  if (self->_MNC) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasCallDuration) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMCommCenterEmergencyVoiceCall;
  id v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_80;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_25;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_25;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
LABEL_25:
          id v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_57:
          if (v24 >= 0x12) {
            LODWORD(v24) = 0;
          }
          uint64_t v44 = 24;
          goto LABEL_72;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v30 = *v6;
            unint64_t v31 = *(void *)&v4[v30];
            if (v31 == -1 || v31 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v31 + 1;
              v24 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_63:
          if (v24 >= 5) {
            LODWORD(v24) = 0;
          }
          uint64_t v44 = 28;
          goto LABEL_72;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v36 + 1;
              v24 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_69:
          if (v24 >= 7) {
            LODWORD(v24) = 0;
          }
          uint64_t v44 = 32;
LABEL_72:
          *(_DWORD *)((char *)&v5->super.super.isa + v44) = v24;
          continue;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasCallDuration = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_79;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        unint64_t v42 = *(void *)&v4[v41];
        if (v42 == -1 || v42 >= *(void *)&v4[*v7]) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_74;
        }
        v38 += 7;
        BOOL v16 = v39++ >= 9;
        if (v16)
        {
          LODWORD(v40) = 0;
          goto LABEL_76;
        }
      }
      v4[*v8] = 1;
LABEL_74:
      if (v4[*v8]) {
        LODWORD(v40) = 0;
      }
LABEL_76:
      v5->_callDuration = v40;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_79:
  }
    uint64_t v45 = 0;
  else {
LABEL_80:
  }
    uint64_t v45 = v5;

  return v45;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMCommCenterEmergencyVoiceCall *)self emNum];
  id v5 = [(BMCommCenterEmergencyVoiceCall *)self MCC];
  v6 = [(BMCommCenterEmergencyVoiceCall *)self MNC];
  uint64_t v7 = BMCommCenterEmergencyVoiceCallMatchedEmNumSourceAsString([(BMCommCenterEmergencyVoiceCall *)self matchedEmNumSource]);
  uint64_t v8 = BMCommCenterEmergencyVoiceCallSIP380ProcedureAsString([(BMCommCenterEmergencyVoiceCall *)self sip380Procedure]);
  v9 = BMCommCenterEmergencyVoiceCallEmergencyURNAsString([(BMCommCenterEmergencyVoiceCall *)self sip380RedirectedURN]);
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMCommCenterEmergencyVoiceCall callDuration](self, "callDuration"));
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMCommCenterEmergencyVoiceCall with emNum: %@, MCC: %@, MNC: %@, matchedEmNumSource: %@, sip380Procedure: %@, sip380RedirectedURN: %@, callDuration: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMCommCenterEmergencyVoiceCall)initWithEmNum:(id)a3 MCC:(id)a4 MNC:(id)a5 matchedEmNumSource:(int)a6 sip380Procedure:(int)a7 sip380RedirectedURN:(int)a8 callDuration:(id)a9
{
  id v22 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BMCommCenterEmergencyVoiceCall;
  uint64_t v19 = [(BMEventBase *)&v23 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_emNum, a3);
    objc_storeStrong((id *)&v19->_MCC, a4);
    objc_storeStrong((id *)&v19->_MNC, a5);
    v19->_matchedEmNumSource = a6;
    v19->_sip380Procedure = a7;
    v19->_sip380RedirectedURN = a8;
    if (v18)
    {
      v19->_hasCallDuration = 1;
      int v20 = [v18 intValue];
    }
    else
    {
      v19->_hasCallDuration = 0;
      int v20 = -1;
    }
    v19->_callDuration = v20;
  }

  return v19;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"emNum" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"MCC", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"MNC" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"matchedEmNumSource" number:4 type:4 subMessageClass:0];
  v11[3] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sip380Procedure" number:5 type:4 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sip380RedirectedURN" number:6 type:4 subMessageClass:0];
  v11[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"callDuration" number:7 type:2 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3918;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"emNum" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"MCC" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"MNC" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"matchedEmNumSource" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sip380Procedure" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sip380RedirectedURN" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"callDuration" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMCommCenterEmergencyVoiceCall alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[5] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end