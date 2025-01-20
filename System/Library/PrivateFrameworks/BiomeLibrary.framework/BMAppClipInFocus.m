@interface BMAppClipInFocus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppClipInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppClipInFocus)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10;
- (BOOL)isEqual:(id)a3;
- (NSString)URLHash;
- (NSString)appBundleID;
- (NSString)clipBundleID;
- (NSString)description;
- (NSString)fullURL;
- (NSString)launchReason;
- (NSString)referrerBundleID;
- (NSString)referrerURL;
- (NSString)webAppBundleID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppClipInFocus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);

  objc_storeStrong((id *)&self->_URLHash, 0);
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (NSString)fullURL
{
  return self->_fullURL;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)URLHash
{
  return self->_URLHash;
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
    v6 = [(BMAppClipInFocus *)self URLHash];
    uint64_t v7 = [v5 URLHash];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppClipInFocus *)self URLHash];
      v10 = [v5 URLHash];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_29;
      }
    }
    v13 = [(BMAppClipInFocus *)self clipBundleID];
    uint64_t v14 = [v5 clipBundleID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppClipInFocus *)self clipBundleID];
      v17 = [v5 clipBundleID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_29;
      }
    }
    v19 = [(BMAppClipInFocus *)self appBundleID];
    uint64_t v20 = [v5 appBundleID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMAppClipInFocus *)self appBundleID];
      v23 = [v5 appBundleID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_29;
      }
    }
    v25 = [(BMAppClipInFocus *)self webAppBundleID];
    uint64_t v26 = [v5 webAppBundleID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMAppClipInFocus *)self webAppBundleID];
      v29 = [v5 webAppBundleID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_29;
      }
    }
    v31 = [(BMAppClipInFocus *)self launchReason];
    uint64_t v32 = [v5 launchReason];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMAppClipInFocus *)self launchReason];
      v35 = [v5 launchReason];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_29;
      }
    }
    v37 = [(BMAppClipInFocus *)self fullURL];
    uint64_t v38 = [v5 fullURL];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMAppClipInFocus *)self fullURL];
      v41 = [v5 fullURL];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_29;
      }
    }
    v43 = [(BMAppClipInFocus *)self referrerURL];
    uint64_t v44 = [v5 referrerURL];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMAppClipInFocus *)self referrerURL];
      v47 = [v5 referrerURL];
      int v48 = [v46 isEqual:v47];

      if (!v48)
      {
LABEL_29:
        char v12 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v50 = [(BMAppClipInFocus *)self referrerBundleID];
    v51 = [v5 referrerBundleID];
    if (v50 == v51)
    {
      char v12 = 1;
    }
    else
    {
      v52 = [(BMAppClipInFocus *)self referrerBundleID];
      v53 = [v5 referrerBundleID];
      char v12 = [v52 isEqual:v53];
    }
    goto LABEL_30;
  }
  char v12 = 0;
LABEL_31:

  return v12;
}

- (id)jsonDictionary
{
  v28[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAppClipInFocus *)self URLHash];
  uint64_t v4 = [(BMAppClipInFocus *)self clipBundleID];
  uint64_t v5 = [(BMAppClipInFocus *)self appBundleID];
  v6 = [(BMAppClipInFocus *)self webAppBundleID];
  uint64_t v7 = [(BMAppClipInFocus *)self launchReason];
  v8 = [(BMAppClipInFocus *)self fullURL];
  v9 = [(BMAppClipInFocus *)self referrerURL];
  v10 = [(BMAppClipInFocus *)self referrerBundleID];
  v27[0] = @"URLHash";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v11;
  v28[0] = v11;
  v27[1] = @"clipBundleID";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v12;
  v28[1] = v12;
  v27[2] = @"appBundleID";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v3;
  uint64_t v20 = (void *)v13;
  v28[2] = v13;
  v27[3] = @"webAppBundleID";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v4;
  v28[3] = v14;
  v27[4] = @"launchReason";
  v15 = v7;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v5;
  v28[4] = v15;
  v27[5] = @"fullURL";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v16;
  v27[6] = @"referrerURL";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v17;
  v27[7] = @"referrerBundleID";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
LABEL_31:

    if (v8) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }

  if (!v9) {
    goto LABEL_31;
  }
LABEL_19:
  if (v8) {
    goto LABEL_20;
  }
LABEL_32:

LABEL_20:
  if (!v7) {

  }
  if (!v6) {
  if (v24)
  }
  {
    if (v25) {
      goto LABEL_26;
    }
LABEL_34:

    if (v26) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }

  if (!v25) {
    goto LABEL_34;
  }
LABEL_26:
  if (v26) {
    goto LABEL_27;
  }
LABEL_35:

LABEL_27:

  return v23;
}

- (BMAppClipInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"URLHash"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"clipBundleID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          goto LABEL_33;
        }
        v28 = a4;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v78 = *MEMORY[0x1E4F28568];
        v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clipBundleID"];
        v79 = v22;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        uint64_t v32 = v30;
        uint64_t v11 = (void *)v31;
        id v33 = (id)[v29 initWithDomain:v32 code:2 userInfo:v31];
        a4 = 0;
        v21 = 0;
        id *v28 = v33;
        goto LABEL_32;
      }
      id v65 = v9;
    }
    else
    {
      id v65 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"appBundleID"];
    v60 = (void *)v10;
    if (v10 && (uint64_t v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v21 = v65;
          goto LABEL_32;
        }
        v56 = a4;
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        id v64 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appBundleID"];
        id v77 = v64;
        v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        id v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2);
        a4 = 0;
        v22 = 0;
        id *v56 = v36;
        v21 = v65;
LABEL_31:

        uint64_t v11 = v60;
LABEL_32:

        goto LABEL_33;
      }
      id v63 = v11;
    }
    else
    {
      id v63 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"webAppBundleID"];
    v62 = (void *)v12;
    if (v12 && (uint64_t v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v64 = 0;
          v21 = v65;
          goto LABEL_30;
        }
        v37 = a4;
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        id v61 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"webAppBundleID"];
        id v75 = v61;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        id v40 = (id)[v38 initWithDomain:v39 code:2 userInfo:v14];
        a4 = 0;
        id v64 = 0;
        id *v37 = v40;
        goto LABEL_73;
      }
      id v64 = v13;
    }
    else
    {
      id v64 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"launchReason"];
    id v59 = v8;
    v55 = a4;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v61 = 0;
LABEL_16:
      v15 = [v6 objectForKeyedSubscript:@"fullURL"];
      v54 = v7;
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v57 = 0;
            a4 = 0;
            goto LABEL_28;
          }
          v17 = self;
          id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v45 = *MEMORY[0x1E4F502C8];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"fullURL"];
          id v71 = v18;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          id v46 = (id)[v58 initWithDomain:v45 code:2 userInfo:v16];
          a4 = 0;
          id v57 = 0;
          id *v55 = v46;
          goto LABEL_27;
        }
        id v57 = v15;
      }
      else
      {
        id v57 = 0;
      }
      v16 = [v6 objectForKeyedSubscript:@"referrerURL"];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        v17 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v18 = 0;
            a4 = 0;
            goto LABEL_27;
          }
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v68 = *MEMORY[0x1E4F28568];
          id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"referrerURL"];
          id v69 = v20;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          id v48 = (id)[v52 initWithDomain:v47 code:2 userInfo:v19];
          a4 = 0;
          id v18 = 0;
          id *v55 = v48;
          goto LABEL_26;
        }
        id v18 = v16;
      }
      else
      {
        v17 = self;
        id v18 = 0;
      }
      v19 = [v6 objectForKeyedSubscript:@"referrerBundleID"];
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v51 = *MEMORY[0x1E4F502C8];
            uint64_t v66 = *MEMORY[0x1E4F28568];
            v49 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"referrerBundleID"];
            v67 = v49;
            v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
            id *v55 = (id)[v53 initWithDomain:v51 code:2 userInfo:v50];
          }
          id v20 = 0;
          a4 = 0;
          goto LABEL_26;
        }
        id v20 = v19;
      }
      else
      {
        id v20 = 0;
      }
      a4 = [(BMAppClipInFocus *)v17 initWithURLHash:v59 clipBundleID:v65 appBundleID:v63 webAppBundleID:v64 launchReason:v61 fullURL:v57 referrerURL:v18 referrerBundleID:v20];
      v17 = (BMAppClipInFocus *)a4;
LABEL_26:

LABEL_27:
      self = v17;
      uint64_t v7 = v54;
LABEL_28:
      v21 = v65;

      id v8 = v59;
LABEL_29:

LABEL_30:
      v22 = v63;
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v61 = v14;
      goto LABEL_16;
    }
    if (a4)
    {
      v41 = a4;
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v43 = *MEMORY[0x1E4F502C8];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      id v57 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"launchReason"];
      id v73 = v57;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v15];
      a4 = 0;
      id v61 = 0;
      id *v41 = v44;
      goto LABEL_28;
    }
    id v61 = 0;
LABEL_73:
    v21 = v65;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    goto LABEL_34;
  }
  int v24 = a4;
  id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v26 = *MEMORY[0x1E4F502C8];
  uint64_t v80 = *MEMORY[0x1E4F28568];
  v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"URLHash"];
  v81[0] = v21;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
  id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v9];
  a4 = 0;
  id v8 = 0;
  *int v24 = v27;
LABEL_33:

LABEL_34:
  return (BMAppClipInFocus *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAppClipInFocus *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_URLHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clipBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fullURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referrerURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMAppClipInFocus;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_34;
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
          goto LABEL_30;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_30;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_30;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_30;
        case 5u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_30;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_30;
        case 7u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
          goto LABEL_30;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 80;
LABEL_30:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_33;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_33:
  }
    v22 = 0;
  else {
LABEL_34:
  }
    v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppClipInFocus *)self URLHash];
  id v5 = [(BMAppClipInFocus *)self clipBundleID];
  id v6 = [(BMAppClipInFocus *)self appBundleID];
  uint64_t v7 = [(BMAppClipInFocus *)self webAppBundleID];
  id v8 = [(BMAppClipInFocus *)self launchReason];
  v9 = [(BMAppClipInFocus *)self fullURL];
  char v10 = [(BMAppClipInFocus *)self referrerURL];
  unsigned int v11 = [(BMAppClipInFocus *)self referrerBundleID];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMAppClipInFocus with URLHash: %@, clipBundleID: %@, appBundleID: %@, webAppBundleID: %@, launchReason: %@, fullURL: %@, referrerURL: %@, referrerBundleID: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMAppClipInFocus)initWithURLHash:(id)a3 clipBundleID:(id)a4 appBundleID:(id)a5 webAppBundleID:(id)a6 launchReason:(id)a7 fullURL:(id)a8 referrerURL:(id)a9 referrerBundleID:(id)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v20 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMAppClipInFocus;
  id v18 = [(BMEventBase *)&v27 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_URLHash, a3);
    objc_storeStrong((id *)&v18->_clipBundleID, a4);
    objc_storeStrong((id *)&v18->_appBundleID, a5);
    objc_storeStrong((id *)&v18->_webAppBundleID, a6);
    objc_storeStrong((id *)&v18->_launchReason, a7);
    objc_storeStrong((id *)&v18->_fullURL, a8);
    objc_storeStrong((id *)&v18->_referrerURL, a9);
    objc_storeStrong((id *)&v18->_referrerBundleID, a10);
  }

  return v18;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"URLHash" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clipBundleID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appBundleID" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webAppBundleID" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"launchReason" number:5 type:13 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullURL" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"referrerURL" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"referrerBundleID" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6810;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"URLHash" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clipBundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appBundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webAppBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"launchReason" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fullURL" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"referrerURL" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"referrerBundleID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMAppClipInFocus alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[4] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end