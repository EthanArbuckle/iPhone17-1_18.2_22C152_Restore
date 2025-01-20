@interface BMContextualUnderstandingPeopleDiscoveryPerson
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithContactID:(id)a3 identifier:(id)a4 name:(id)a5 flags:(id)a6 activityLevel:(id)a7 proximity:(id)a8;
- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasActivityLevel;
- (BOOL)hasFlags;
- (BOOL)hasProximity;
- (BOOL)isEqual:(id)a3;
- (NSString)contactID;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)activityLevel;
- (unsigned)dataVersion;
- (unsigned)flags;
- (unsigned)proximity;
- (void)setHasActivityLevel:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasProximity:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextualUnderstandingPeopleDiscoveryPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_contactID, 0);
}

- (void)setHasProximity:(BOOL)a3
{
  self->_hasProximity = a3;
}

- (BOOL)hasProximity
{
  return self->_hasProximity;
}

- (unsigned)proximity
{
  return self->_proximity;
}

- (void)setHasActivityLevel:(BOOL)a3
{
  self->_hasActivityLevel = a3;
}

- (BOOL)hasActivityLevel
{
  return self->_hasActivityLevel;
}

- (unsigned)activityLevel
{
  return self->_activityLevel;
}

- (void)setHasFlags:(BOOL)a3
{
  self->_hasFlags = a3;
}

- (BOOL)hasFlags
{
  return self->_hasFlags;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)contactID
{
  return self->_contactID;
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
    v6 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self contactID];
    uint64_t v7 = [v5 contactID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self contactID];
      v10 = [v5 contactID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_30;
      }
    }
    v13 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self identifier];
    uint64_t v14 = [v5 identifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self identifier];
      v17 = [v5 identifier];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_30;
      }
    }
    v19 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self name];
    uint64_t v20 = [v5 name];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self name];
      v23 = [v5 name];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_30;
      }
    }
    if (![(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasFlags]
      && ![v5 hasFlags]
      || [(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasFlags]
      && [v5 hasFlags]
      && (unsigned int v25 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self flags],
          v25 == [v5 flags]))
    {
      if (![(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasActivityLevel]
        && ![v5 hasActivityLevel]
        || [(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasActivityLevel]
        && [v5 hasActivityLevel]
        && (unsigned int v26 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self activityLevel],
            v26 == [v5 activityLevel]))
      {
        if (![(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasProximity]
          && ![v5 hasProximity])
        {
          BOOL v12 = 1;
          goto LABEL_31;
        }
        if ([(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasProximity]
          && [v5 hasProximity])
        {
          unsigned int v27 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self proximity];
          BOOL v12 = v27 == [v5 proximity];
LABEL_31:

          goto LABEL_32;
        }
      }
    }
LABEL_30:
    BOOL v12 = 0;
    goto LABEL_31;
  }
  BOOL v12 = 0;
LABEL_32:

  return v12;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self contactID];
  uint64_t v4 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self identifier];
  id v5 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self name];
  if ([(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasFlags])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson flags](self, "flags"));
  }
  else
  {
    v6 = 0;
  }
  if ([(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasActivityLevel])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson activityLevel](self, "activityLevel"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMContextualUnderstandingPeopleDiscoveryPerson *)self hasProximity])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson proximity](self, "proximity"));
  }
  else
  {
    v8 = 0;
  }
  v21[0] = @"contactID";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = @"identifier";
  v10 = (void *)v4;
  if (!v4)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9);
  }
  v22[1] = v10;
  v21[2] = @"name";
  int v11 = v5;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"flags";
  BOOL v12 = v6;
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"activityLevel";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"proximity";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_24;
    }
LABEL_33:

    if (v6) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }

  if (!v7) {
    goto LABEL_33;
  }
LABEL_24:
  if (v6) {
    goto LABEL_25;
  }
LABEL_34:

LABEL_25:
  if (!v5) {

  }
  if (v19)
  {
    if (v20) {
      goto LABEL_29;
    }
  }
  else
  {

    if (v20) {
      goto LABEL_29;
    }
  }

LABEL_29:

  return v15;
}

- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"contactID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"identifier"];
    v51 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        unsigned int v25 = a4;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v27 = v8;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        uint64_t v29 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        uint64_t v63 = v29;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        uint64_t v30 = v28;
        id v8 = v27;
        v19 = 0;
        v23 = 0;
        *unsigned int v25 = (id)[v26 initWithDomain:v30 code:2 userInfo:v10];
        id v11 = (id)v29;
        goto LABEL_49;
      }
      id v52 = v9;
    }
    else
    {
      id v52 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"name"];
    v53 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v19 = 0;
          v23 = v52;
          goto LABEL_49;
        }
        v31 = a4;
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v33 = v8;
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
        id v61 = v14;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        uint64_t v35 = v34;
        id v8 = v33;
        v19 = 0;
        id *v31 = (id)[v32 initWithDomain:v35 code:2 userInfo:v12];
        id v11 = 0;
LABEL_48:
        v23 = v52;

        self = v53;
LABEL_49:

        uint64_t v7 = v51;
        goto LABEL_50;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"flags"];
    id v50 = v8;
    id v48 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v14 = 0;
          v19 = 0;
          goto LABEL_48;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        v38 = a4;
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"flags"];
        id v59 = v16;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        id v39 = (id)[v36 initWithDomain:v37 code:2 userInfo:v15];
        v19 = 0;
        id v14 = 0;
        id *v38 = v39;
        goto LABEL_57;
      }
      v13 = a4;
      id v14 = v12;
    }
    else
    {
      v13 = a4;
      id v14 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"activityLevel"];
    id v49 = v14;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
LABEL_16:
      uint64_t v17 = [v6 objectForKeyedSubscript:@"proximity"];
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v18 = 0;
LABEL_19:
        id v11 = v48;
        v19 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)v53 initWithContactID:v50 identifier:v52 name:v48 flags:v49 activityLevel:v16 proximity:v18];
        v53 = v19;
LABEL_46:

        id v14 = v49;
LABEL_47:

        id v8 = v50;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        goto LABEL_19;
      }
      if (v13)
      {
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v43 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"proximity"];
        v55 = v43;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id *v13 = (id)[v47 initWithDomain:v46 code:2 userInfo:v44];
      }
      id v18 = 0;
      v19 = 0;
LABEL_45:
      id v11 = v48;
      goto LABEL_46;
    }
    if (v13)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activityLevel"];
      id v57 = v18;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v17];
      v19 = 0;
      id v16 = 0;
      id *v13 = v42;
      goto LABEL_45;
    }
    id v16 = 0;
    v19 = 0;
LABEL_57:
    id v11 = v48;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v19 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  uint64_t v20 = a4;
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v64 = *MEMORY[0x1E4F28568];
  v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactID"];
  v65[0] = v23;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
  id v24 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
  v19 = 0;
  id v8 = 0;
  *uint64_t v20 = v24;
LABEL_50:

LABEL_51:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMContextualUnderstandingPeopleDiscoveryPerson *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contactID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasFlags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasActivityLevel)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasProximity)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMContextualUnderstandingPeopleDiscoveryPerson;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_63;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
          v5->_hasFlags = 1;
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
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_50:
          uint64_t v38 = 24;
          goto LABEL_59;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v24 = 0;
          v5->_hasActivityLevel = 1;
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
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_54:
          uint64_t v38 = 28;
          goto LABEL_59;
        case 6u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v24 = 0;
          v5->_hasProximity = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_62;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v6;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 == -1 || v36 >= *(void *)&v4[*v7]) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
        *(void *)&v4[v35] = v36 + 1;
        v24 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0) {
          goto LABEL_56;
        }
        v33 += 7;
        BOOL v16 = v34++ >= 9;
        if (v16)
        {
          LODWORD(v24) = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_56:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_58:
      uint64_t v38 = 32;
LABEL_59:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_62:
  }
    id v39 = 0;
  else {
LABEL_63:
  }
    id v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self contactID];
  id v5 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self identifier];
  id v6 = [(BMContextualUnderstandingPeopleDiscoveryPerson *)self name];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson flags](self, "flags"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson activityLevel](self, "activityLevel"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson proximity](self, "proximity"));
  char v10 = (void *)[v3 initWithFormat:@"BMContextualUnderstandingPeopleDiscoveryPerson with contactID: %@, identifier: %@, name: %@, flags: %@, activityLevel: %@, proximity: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithContactID:(id)a3 identifier:(id)a4 name:(id)a5 flags:(id)a6 activityLevel:(id)a7 proximity:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMContextualUnderstandingPeopleDiscoveryPerson;
  uint64_t v20 = [(BMEventBase *)&v26 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v20->_contactID, a3);
    objc_storeStrong((id *)&v20->_identifier, a4);
    objc_storeStrong((id *)&v20->_name, a5);
    if (v17)
    {
      v20->_hasFlags = 1;
      unsigned int v21 = [v17 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v20->_hasFlags = 0;
    }
    v20->_flags = v21;
    if (v18)
    {
      v20->_hasActivityLevel = 1;
      unsigned int v22 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v22 = 0;
      v20->_hasActivityLevel = 0;
    }
    v20->_activityLevel = v22;
    if (v19)
    {
      v20->_hasProximity = 1;
      unsigned int v23 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v23 = 0;
      v20->_hasProximity = 0;
    }
    v20->_proximity = v23;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactID" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flags" number:4 type:4 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityLevel" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"proximity" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4AB8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flags" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityLevel" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"proximity" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMContextualUnderstandingPeopleDiscoveryPerson alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end