@interface BMAdPlatformsDiscardReasons
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAdPlatformsDiscardReasons)initWithDiscardReason:(int)a3 placement:(int)a4 bundleID:(id)a5 brandIdentifier:(id)a6 displayOrder:(id)a7 searchTerms:(id)a8;
- (BMAdPlatformsDiscardReasons)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasBrandIdentifier;
- (BOOL)hasDisplayOrder;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (NSString)description;
- (NSString)searchTerms;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)discardReason;
- (int)displayOrder;
- (int)placement;
- (unint64_t)brandIdentifier;
- (unsigned)dataVersion;
- (void)setHasBrandIdentifier:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAdPlatformsDiscardReasons

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)searchTerms
{
  return self->_searchTerms;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  self->_hasDisplayOrder = a3;
}

- (BOOL)hasDisplayOrder
{
  return self->_hasDisplayOrder;
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (void)setHasBrandIdentifier:(BOOL)a3
{
  self->_hasBrandIdentifier = a3;
}

- (BOOL)hasBrandIdentifier
{
  return self->_hasBrandIdentifier;
}

- (unint64_t)brandIdentifier
{
  return self->_brandIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)placement
{
  return self->_placement;
}

- (int)discardReason
{
  return self->_discardReason;
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
    int v6 = [(BMAdPlatformsDiscardReasons *)self discardReason];
    if (v6 != [v5 discardReason]) {
      goto LABEL_21;
    }
    int v7 = [(BMAdPlatformsDiscardReasons *)self placement];
    if (v7 != [v5 placement]) {
      goto LABEL_21;
    }
    v8 = [(BMAdPlatformsDiscardReasons *)self bundleID];
    uint64_t v9 = [v5 bundleID];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      v10 = (void *)v9;
      v11 = [(BMAdPlatformsDiscardReasons *)self bundleID];
      v12 = [v5 bundleID];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_21;
      }
    }
    if (![(BMAdPlatformsDiscardReasons *)self hasBrandIdentifier]
      && ![v5 hasBrandIdentifier]
      || [(BMAdPlatformsDiscardReasons *)self hasBrandIdentifier]
      && [v5 hasBrandIdentifier]
      && (unint64_t v15 = [(BMAdPlatformsDiscardReasons *)self brandIdentifier],
          v15 == [v5 brandIdentifier]))
    {
      if (![(BMAdPlatformsDiscardReasons *)self hasDisplayOrder]
        && ![v5 hasDisplayOrder]
        || [(BMAdPlatformsDiscardReasons *)self hasDisplayOrder]
        && [v5 hasDisplayOrder]
        && (int v16 = [(BMAdPlatformsDiscardReasons *)self displayOrder],
            v16 == [v5 displayOrder]))
      {
        v17 = [(BMAdPlatformsDiscardReasons *)self searchTerms];
        v18 = [v5 searchTerms];
        if (v17 == v18)
        {
          char v14 = 1;
        }
        else
        {
          v19 = [(BMAdPlatformsDiscardReasons *)self searchTerms];
          v20 = [v5 searchTerms];
          char v14 = [v19 isEqual:v20];
        }
        goto LABEL_22;
      }
    }
LABEL_21:
    char v14 = 0;
LABEL_22:

    goto LABEL_23;
  }
  char v14 = 0;
LABEL_23:

  return v14;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAdPlatformsDiscardReasons discardReason](self, "discardReason"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAdPlatformsDiscardReasons placement](self, "placement"));
  id v5 = [(BMAdPlatformsDiscardReasons *)self bundleID];
  if ([(BMAdPlatformsDiscardReasons *)self hasBrandIdentifier])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier"));
  }
  else
  {
    int v6 = 0;
  }
  if ([(BMAdPlatformsDiscardReasons *)self hasDisplayOrder])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder"));
  }
  else
  {
    int v7 = 0;
  }
  v8 = [(BMAdPlatformsDiscardReasons *)self searchTerms];
  v21[0] = @"discardReason";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = @"placement";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"bundleID";
  v11 = v5;
  if (!v5)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v22[2] = v11;
  v21[3] = @"brandIdentifier";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"displayOrder";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"searchTerms";
  char v14 = v8;
  if (!v8)
  {
    char v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5) {
      goto LABEL_23;
    }
LABEL_32:

    if (v4) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_31:

  if (!v5) {
    goto LABEL_32;
  }
LABEL_23:
  if (v4) {
    goto LABEL_24;
  }
LABEL_33:

LABEL_24:
  if (!v20) {

  }
  return v15;
}

- (BMAdPlatformsDiscardReasons)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"discardReason"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v48 = 0;
LABEL_9:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"placement"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v47 = 0;
            v20 = 0;
            goto LABEL_34;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          v46 = a4;
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placement"];
          id v58 = v12;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v47 = 0;
          v20 = 0;
          id *v46 = (id)[v37 initWithDomain:v38 code:2 userInfo:v11];
          goto LABEL_33;
        }
        id v10 = [NSNumber numberWithInt:BMAdPlatformsDiscardReasonsPlacementFromString(v9)];
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"bundleID"];
    v43 = v9;
    v44 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v20 = 0;
          goto LABEL_33;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v23 = a4;
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        id v45 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
        id v56 = v45;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v20 = 0;
        id v12 = 0;
        id *v23 = (id)[v22 initWithDomain:v24 code:2 userInfo:v13];
        uint64_t v9 = v43;
LABEL_32:

        int v7 = v44;
LABEL_33:

        goto LABEL_34;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    int v13 = [v6 objectForKeyedSubscript:@"brandIdentifier"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v45 = 0;
          v20 = 0;
          goto LABEL_32;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v26 = v12;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v53 = *MEMORY[0x1E4F28568];
        v28 = a4;
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brandIdentifier"];
        id v54 = v17;
        unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v29 = v27;
        id v12 = v26;
        v20 = 0;
        id v45 = 0;
        id *v28 = (id)[v25 initWithDomain:v29 code:2 userInfo:v15];
        goto LABEL_60;
      }
      char v14 = a4;
      id v45 = v13;
    }
    else
    {
      char v14 = a4;
      id v45 = 0;
    }
    unint64_t v15 = [v6 objectForKeyedSubscript:@"displayOrder"];
    id v42 = v12;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v16 = self;
      id v17 = 0;
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v16 = self;
      id v17 = v15;
LABEL_26:
      v18 = [v6 objectForKeyedSubscript:@"searchTerms"];
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v14)
          {
            id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v39 = *MEMORY[0x1E4F502C8];
            uint64_t v49 = *MEMORY[0x1E4F28568];
            v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"searchTerms"];
            v50 = v32;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            *char v14 = (id)[v41 initWithDomain:v39 code:2 userInfo:v33];
          }
          id v19 = 0;
          v20 = 0;
          goto LABEL_30;
        }
        id v19 = v18;
      }
      else
      {
        id v19 = 0;
      }
      v20 = -[BMAdPlatformsDiscardReasons initWithDiscardReason:placement:bundleID:brandIdentifier:displayOrder:searchTerms:](v16, "initWithDiscardReason:placement:bundleID:brandIdentifier:displayOrder:searchTerms:", [v48 intValue], objc_msgSend(v47, "intValue"), v42, v45, v17, v19);
      int v16 = v20;
LABEL_30:
      uint64_t v9 = v43;

      self = v16;
      id v12 = v42;
LABEL_31:

      goto LABEL_32;
    }
    if (v14)
    {
      int v16 = self;
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F502C8];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"displayOrder"];
      id v52 = v19;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      id v31 = (id)[v40 initWithDomain:v30 code:2 userInfo:v18];
      v20 = 0;
      id v17 = 0;
      *char v14 = v31;
      goto LABEL_30;
    }
    id v17 = 0;
    v20 = 0;
LABEL_60:
    uint64_t v9 = v43;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v48 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMAdPlatformsDiscardReasonsDiscardReasonFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v48 = 0;
    v20 = 0;
    goto LABEL_35;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
  v35 = a4;
  uint64_t v36 = *MEMORY[0x1E4F502C8];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"discardReason"];
  v60[0] = v47;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  v48 = 0;
  v20 = 0;
  id *v35 = (id)[v34 initWithDomain:v36 code:2 userInfo:v9];
LABEL_34:

LABEL_35:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAdPlatformsDiscardReasons *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBrandIdentifier) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = v5;
  if (self->_hasDisplayOrder)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_searchTerms)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAdPlatformsDiscardReasons;
  id v5 = [(BMEventBase *)&v51 init];
  if (!v5) {
    goto LABEL_78;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_54;
            }
            v19 += 7;
            if (v20++ > 8) {
              goto LABEL_60;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
          if ((v21 - 2700) >= 2 && v21 != 0) {
LABEL_60:
          }
            LODWORD(v21) = 0;
          v5->_discardReason = v21;
          continue;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v16 = v27++ >= 9;
                if (v16)
                {
                  uint64_t v32 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
          else {
            uint64_t v32 = v28;
          }
LABEL_66:
          v5->_placement = BMAdPlatformsDiscardReasonsPlacementDecode(v32);
          continue;
        case 3u:
          uint64_t v33 = PBReaderReadString();
          uint64_t v34 = 40;
          goto LABEL_52;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          unint64_t v37 = 0;
          v5->_hasBrandIdentifier = 1;
          while (2)
          {
            uint64_t v38 = *v6;
            unint64_t v39 = *(void *)&v4[v38];
            if (v39 == -1 || v39 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
              *(void *)&v4[v38] = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                BOOL v16 = v36++ >= 9;
                if (v16)
                {
                  unint64_t v37 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v37 = 0;
          }
LABEL_70:
          v5->_brandIdentifier = v37;
          continue;
        case 5u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          v5->_hasDisplayOrder = 1;
          break;
        case 6u:
          uint64_t v33 = PBReaderReadString();
          uint64_t v34 = 56;
LABEL_52:
          v47 = *(Class *)((char *)&v5->super.super.isa + v34);
          *(Class *)((char *)&v5->super.super.isa + v34) = (Class)v33;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_77;
          }
          continue;
      }
      while (1)
      {
        uint64_t v44 = *v6;
        unint64_t v45 = *(void *)&v4[v44];
        if (v45 == -1 || v45 >= *(void *)&v4[*v7]) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v45);
        *(void *)&v4[v44] = v45 + 1;
        v43 |= (unint64_t)(v46 & 0x7F) << v41;
        if ((v46 & 0x80) == 0) {
          goto LABEL_72;
        }
        v41 += 7;
        BOOL v16 = v42++ >= 9;
        if (v16)
        {
          LODWORD(v43) = 0;
          goto LABEL_74;
        }
      }
      v4[*v8] = 1;
LABEL_72:
      if (v4[*v8]) {
        LODWORD(v43) = 0;
      }
LABEL_74:
      v5->_displayOrder = v43;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_77:
  }
    uint64_t v49 = 0;
  else {
LABEL_78:
  }
    uint64_t v49 = v5;

  return v49;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMAdPlatformsDiscardReasonsDiscardReasonAsString([(BMAdPlatformsDiscardReasons *)self discardReason]);
  id v5 = BMAdPlatformsDiscardReasonsPlacementAsString([(BMAdPlatformsDiscardReasons *)self placement]);
  id v6 = [(BMAdPlatformsDiscardReasons *)self bundleID];
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier"));
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder"));
  uint64_t v9 = [(BMAdPlatformsDiscardReasons *)self searchTerms];
  char v10 = (void *)[v3 initWithFormat:@"BMAdPlatformsDiscardReasons with discardReason: %@, placement: %@, bundleID: %@, brandIdentifier: %@, displayOrder: %@, searchTerms: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMAdPlatformsDiscardReasons)initWithDiscardReason:(int)a3 placement:(int)a4 bundleID:(id)a5 brandIdentifier:(id)a6 displayOrder:(id)a7 searchTerms:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMAdPlatformsDiscardReasons;
  char v19 = [(BMEventBase *)&v23 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v19->_discardReason = a3;
    v19->_placement = a4;
    objc_storeStrong((id *)&v19->_bundleID, a5);
    if (v16)
    {
      v19->_hasBrandIdentifier = 1;
      uint64_t v20 = [v16 unsignedLongLongValue];
    }
    else
    {
      uint64_t v20 = 0;
      v19->_hasBrandIdentifier = 0;
    }
    v19->_brandIdentifier = v20;
    if (v17)
    {
      v19->_hasDisplayOrder = 1;
      int v21 = [v17 intValue];
    }
    else
    {
      v19->_hasDisplayOrder = 0;
      int v21 = -1;
    }
    v19->_displayOrder = v21;
    objc_storeStrong((id *)&v19->_searchTerms, a8);
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"discardReason" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placement" number:2 type:4 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brandIdentifier" number:4 type:5 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayOrder" number:5 type:2 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"searchTerms" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3930;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"discardReason" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placement" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brandIdentifier" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:5 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"displayOrder" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"searchTerms" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMAdPlatformsDiscardReasons alloc] initByReadFrom:v7];
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