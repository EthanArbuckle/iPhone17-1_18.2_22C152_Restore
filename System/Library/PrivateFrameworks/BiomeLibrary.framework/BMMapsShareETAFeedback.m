@interface BMMapsShareETAFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMapsShareETAFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 handle:(id)a5 startLocationId:(id)a6 endLocationId:(id)a7 contactId:(id)a8 groupId:(id)a9;
- (BMMapsShareETAFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSString)contactId;
- (NSString)description;
- (NSString)endLocationId;
- (NSString)groupId;
- (NSString)handle;
- (NSString)identifier;
- (NSString)startLocationId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMapsShareETAFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_endLocationId, 0);
  objc_storeStrong((id *)&self->_startLocationId, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSString)endLocationId
{
  return self->_endLocationId;
}

- (NSString)startLocationId
{
  return self->_startLocationId;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMMapsShareETAFeedback *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMapsShareETAFeedback *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v13 = [(BMMapsShareETAFeedback *)self bundleId];
    uint64_t v14 = [v5 bundleId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMapsShareETAFeedback *)self bundleId];
      v17 = [v5 bundleId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_25;
      }
    }
    v19 = [(BMMapsShareETAFeedback *)self handle];
    uint64_t v20 = [v5 handle];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMapsShareETAFeedback *)self handle];
      v23 = [v5 handle];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_25;
      }
    }
    v25 = [(BMMapsShareETAFeedback *)self startLocationId];
    uint64_t v26 = [v5 startLocationId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMapsShareETAFeedback *)self startLocationId];
      v29 = [v5 startLocationId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_25;
      }
    }
    v31 = [(BMMapsShareETAFeedback *)self endLocationId];
    uint64_t v32 = [v5 endLocationId];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMMapsShareETAFeedback *)self endLocationId];
      v35 = [v5 endLocationId];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_25;
      }
    }
    v37 = [(BMMapsShareETAFeedback *)self contactId];
    uint64_t v38 = [v5 contactId];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMMapsShareETAFeedback *)self contactId];
      v41 = [v5 contactId];
      int v42 = [v40 isEqual:v41];

      if (!v42)
      {
LABEL_25:
        char v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v44 = [(BMMapsShareETAFeedback *)self groupId];
    v45 = [v5 groupId];
    if (v44 == v45)
    {
      char v12 = 1;
    }
    else
    {
      v46 = [(BMMapsShareETAFeedback *)self groupId];
      v47 = [v5 groupId];
      char v12 = [v46 isEqual:v47];
    }
    goto LABEL_26;
  }
  char v12 = 0;
LABEL_27:

  return v12;
}

- (id)jsonDictionary
{
  v25[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMapsShareETAFeedback *)self identifier];
  uint64_t v4 = [(BMMapsShareETAFeedback *)self bundleId];
  id v5 = [(BMMapsShareETAFeedback *)self handle];
  v6 = [(BMMapsShareETAFeedback *)self startLocationId];
  uint64_t v7 = [(BMMapsShareETAFeedback *)self endLocationId];
  v8 = [(BMMapsShareETAFeedback *)self contactId];
  v9 = [(BMMapsShareETAFeedback *)self groupId];
  v24[0] = @"identifier";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = @"bundleId";
  uint64_t v11 = v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  uint64_t v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = @"handle";
  uint64_t v12 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v4;
  v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = @"startLocationId";
  v13 = v6;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v13;
  v24[4] = @"endLocationId";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v14;
  v24[5] = @"contactId";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v15;
  v24[6] = @"groupId";
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
      goto LABEL_17;
    }
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v7) {
        goto LABEL_18;
      }
LABEL_28:

      if (v6) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }
  }

  if (!v7) {
    goto LABEL_28;
  }
LABEL_18:
  if (v6) {
    goto LABEL_19;
  }
LABEL_29:

LABEL_19:
  if (!v5) {

  }
  if (v22)
  {
    if (v23) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v23) {
      goto LABEL_23;
    }
  }

LABEL_23:

  return v17;
}

- (BMMapsShareETAFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"bundleId"];
    v54 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v19 = 0;
          goto LABEL_29;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v56 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleId"];
        id v68 = v56;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        uint64_t v11 = v29 = a4;
        id v30 = (id)[v27 initWithDomain:v28 code:2 userInfo:v11];
        v19 = 0;
        id v10 = 0;
        id *v29 = v30;
        goto LABEL_28;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"handle"];
    v52 = v9;
    id v55 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          id v56 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"handle"];
        v66 = v20;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v33 = v31;
        id v10 = v55;
        id v34 = (id)[v33 initWithDomain:v32 code:2 userInfo:v12];
        v19 = 0;
        id v56 = 0;
        id *v54 = v34;
LABEL_27:

        v9 = v52;
LABEL_28:

        goto LABEL_29;
      }
      id v56 = v11;
    }
    else
    {
      id v56 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"startLocationId"];
    v49 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          uint64_t v20 = 0;
          v19 = 0;
          goto LABEL_27;
        }
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        id v53 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"startLocationId"];
        id v64 = v53;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        v37 = v35;
        id v10 = v55;
        id v38 = (id)[v37 initWithDomain:v36 code:2 userInfo:v13];
        v19 = 0;
        uint64_t v20 = 0;
        id *v54 = v38;
        goto LABEL_26;
      }
      id v51 = v12;
    }
    else
    {
      id v51 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"endLocationId"];
    id v50 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          id v53 = 0;
          v19 = 0;
          goto LABEL_25;
        }
        v15 = self;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"endLocationId"];
        id v62 = v16;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        id v41 = (id)[v39 initWithDomain:v40 code:2 userInfo:v14];
        v19 = 0;
        id v53 = 0;
        id *v54 = v41;
LABEL_24:

        self = v15;
        id v8 = v50;
        id v10 = v55;
LABEL_25:
        uint64_t v20 = v51;
LABEL_26:

        uint64_t v7 = v49;
        goto LABEL_27;
      }
      id v53 = v13;
    }
    else
    {
      id v53 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"contactId"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v15 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v54)
        {
          id v16 = 0;
          v19 = 0;
          goto LABEL_24;
        }
        id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactId"];
        id v60 = v18;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v17];
        v19 = 0;
        id v16 = 0;
        id *v54 = v44;
        goto LABEL_23;
      }
      id v16 = v14;
    }
    else
    {
      v15 = self;
      id v16 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"groupId"];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v54)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupId"];
          v58 = v45;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          id *v54 = (id)[v48 initWithDomain:v47 code:2 userInfo:v46];
        }
        id v18 = 0;
        v19 = 0;
        goto LABEL_23;
      }
      id v18 = v17;
    }
    else
    {
      id v18 = 0;
    }
    v19 = [(BMMapsShareETAFeedback *)v15 initWithIdentifier:v50 bundleId:v55 handle:v56 startLocationId:v51 endLocationId:v53 contactId:v16 groupId:v18];
    v15 = v19;
LABEL_23:

    goto LABEL_24;
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
    goto LABEL_30;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v69 = *MEMORY[0x1E4F28568];
  uint64_t v24 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v70[0] = v24;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
  v25 = v22;
  id v10 = (id)v24;
  id v26 = (id)[v25 initWithDomain:v23 code:2 userInfo:v9];
  v19 = 0;
  id v8 = 0;
  *a4 = v26;
LABEL_29:

LABEL_30:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMapsShareETAFeedback *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_startLocationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_endLocationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_contactId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMMapsShareETAFeedback;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_33;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
          uint64_t v20 = 24;
          goto LABEL_29;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_29;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_29;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_29;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_29;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_29;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
LABEL_29:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_32;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_32:
  }
    id v22 = 0;
  else {
LABEL_33:
  }
    id v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMapsShareETAFeedback *)self identifier];
  id v5 = [(BMMapsShareETAFeedback *)self bundleId];
  id v6 = [(BMMapsShareETAFeedback *)self handle];
  uint64_t v7 = [(BMMapsShareETAFeedback *)self startLocationId];
  id v8 = [(BMMapsShareETAFeedback *)self endLocationId];
  v9 = [(BMMapsShareETAFeedback *)self contactId];
  char v10 = [(BMMapsShareETAFeedback *)self groupId];
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMapsShareETAFeedback with identifier: %@, bundleId: %@, handle: %@, startLocationId: %@, endLocationId: %@, contactId: %@, groupId: %@", v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMMapsShareETAFeedback)initWithIdentifier:(id)a3 bundleId:(id)a4 handle:(id)a5 startLocationId:(id)a6 endLocationId:(id)a7 contactId:(id)a8 groupId:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  id v20 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)BMMapsShareETAFeedback;
  id v18 = [(BMEventBase *)&v25 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_handle, a5);
    objc_storeStrong((id *)&v18->_startLocationId, a6);
    objc_storeStrong((id *)&v18->_endLocationId, a7);
    objc_storeStrong((id *)&v18->_contactId, a8);
    objc_storeStrong((id *)&v18->_groupId, a9);
  }

  return v18;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"bundleId", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"handle" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startLocationId" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endLocationId" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactId" number:6 type:13 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupId" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7500;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"handle" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startLocationId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endLocationId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactId" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
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
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMapsShareETAFeedback alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end