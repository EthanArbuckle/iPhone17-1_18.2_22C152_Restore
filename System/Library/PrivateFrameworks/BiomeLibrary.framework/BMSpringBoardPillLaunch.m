@interface BMSpringBoardPillLaunch
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSpringBoardPillLaunch)initWithChildAccount:(id)a3 firstUpdate:(id)a4 firstUpdateAnyGesture:(id)a5 gesture:(id)a6 pillClicked:(id)a7 totalTimesShown:(id)a8;
- (BMSpringBoardPillLaunch)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)childAccount;
- (BOOL)firstUpdate;
- (BOOL)firstUpdateAnyGesture;
- (BOOL)hasChildAccount;
- (BOOL)hasFirstUpdate;
- (BOOL)hasFirstUpdateAnyGesture;
- (BOOL)hasPillClicked;
- (BOOL)hasTotalTimesShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)pillClicked;
- (NSString)description;
- (NSString)gesture;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)totalTimesShown;
- (void)setHasChildAccount:(BOOL)a3;
- (void)setHasFirstUpdate:(BOOL)a3;
- (void)setHasFirstUpdateAnyGesture:(BOOL)a3;
- (void)setHasPillClicked:(BOOL)a3;
- (void)setHasTotalTimesShown:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSpringBoardPillLaunch

- (void).cxx_destruct
{
}

- (void)setHasTotalTimesShown:(BOOL)a3
{
  self->_hasTotalTimesShown = a3;
}

- (BOOL)hasTotalTimesShown
{
  return self->_hasTotalTimesShown;
}

- (unsigned)totalTimesShown
{
  return self->_totalTimesShown;
}

- (void)setHasPillClicked:(BOOL)a3
{
  self->_hasPillClicked = a3;
}

- (BOOL)hasPillClicked
{
  return self->_hasPillClicked;
}

- (BOOL)pillClicked
{
  return self->_pillClicked;
}

- (NSString)gesture
{
  return self->_gesture;
}

- (void)setHasFirstUpdateAnyGesture:(BOOL)a3
{
  self->_hasFirstUpdateAnyGesture = a3;
}

- (BOOL)hasFirstUpdateAnyGesture
{
  return self->_hasFirstUpdateAnyGesture;
}

- (BOOL)firstUpdateAnyGesture
{
  return self->_firstUpdateAnyGesture;
}

- (void)setHasFirstUpdate:(BOOL)a3
{
  self->_hasFirstUpdate = a3;
}

- (BOOL)hasFirstUpdate
{
  return self->_hasFirstUpdate;
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (void)setHasChildAccount:(BOOL)a3
{
  self->_hasChildAccount = a3;
}

- (BOOL)hasChildAccount
{
  return self->_hasChildAccount;
}

- (BOOL)childAccount
{
  return self->_childAccount;
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
    if ([(BMSpringBoardPillLaunch *)self hasChildAccount]
      || [v5 hasChildAccount])
    {
      if (![(BMSpringBoardPillLaunch *)self hasChildAccount]) {
        goto LABEL_32;
      }
      if (![v5 hasChildAccount]) {
        goto LABEL_32;
      }
      int v6 = [(BMSpringBoardPillLaunch *)self childAccount];
      if (v6 != [v5 childAccount]) {
        goto LABEL_32;
      }
    }
    if ([(BMSpringBoardPillLaunch *)self hasFirstUpdate]
      || [v5 hasFirstUpdate])
    {
      if (![(BMSpringBoardPillLaunch *)self hasFirstUpdate]) {
        goto LABEL_32;
      }
      if (![v5 hasFirstUpdate]) {
        goto LABEL_32;
      }
      int v7 = [(BMSpringBoardPillLaunch *)self firstUpdate];
      if (v7 != [v5 firstUpdate]) {
        goto LABEL_32;
      }
    }
    if ([(BMSpringBoardPillLaunch *)self hasFirstUpdateAnyGesture]
      || [v5 hasFirstUpdateAnyGesture])
    {
      if (![(BMSpringBoardPillLaunch *)self hasFirstUpdateAnyGesture]) {
        goto LABEL_32;
      }
      if (![v5 hasFirstUpdateAnyGesture]) {
        goto LABEL_32;
      }
      int v8 = [(BMSpringBoardPillLaunch *)self firstUpdateAnyGesture];
      if (v8 != [v5 firstUpdateAnyGesture]) {
        goto LABEL_32;
      }
    }
    v9 = [(BMSpringBoardPillLaunch *)self gesture];
    uint64_t v10 = [v5 gesture];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = [(BMSpringBoardPillLaunch *)self gesture];
      v13 = [v5 gesture];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_32;
      }
    }
    if (![(BMSpringBoardPillLaunch *)self hasPillClicked]
      && ![v5 hasPillClicked]
      || [(BMSpringBoardPillLaunch *)self hasPillClicked]
      && [v5 hasPillClicked]
      && (int v16 = [(BMSpringBoardPillLaunch *)self pillClicked],
          v16 == [v5 pillClicked]))
    {
      if (![(BMSpringBoardPillLaunch *)self hasTotalTimesShown]
        && ![v5 hasTotalTimesShown])
      {
        BOOL v15 = 1;
        goto LABEL_33;
      }
      if ([(BMSpringBoardPillLaunch *)self hasTotalTimesShown]
        && [v5 hasTotalTimesShown])
      {
        unsigned int v17 = [(BMSpringBoardPillLaunch *)self totalTimesShown];
        BOOL v15 = v17 == [v5 totalTimesShown];
LABEL_33:

        goto LABEL_34;
      }
    }
LABEL_32:
    BOOL v15 = 0;
    goto LABEL_33;
  }
  BOOL v15 = 0;
LABEL_34:

  return v15;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMSpringBoardPillLaunch *)self hasChildAccount])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch childAccount](self, "childAccount"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMSpringBoardPillLaunch *)self hasFirstUpdate])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdate](self, "firstUpdate"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMSpringBoardPillLaunch *)self hasFirstUpdateAnyGesture])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdateAnyGesture](self, "firstUpdateAnyGesture"));
  }
  else
  {
    id v5 = 0;
  }
  int v6 = [(BMSpringBoardPillLaunch *)self gesture];
  if ([(BMSpringBoardPillLaunch *)self hasPillClicked])
  {
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch pillClicked](self, "pillClicked"));
  }
  else
  {
    int v7 = 0;
  }
  if ([(BMSpringBoardPillLaunch *)self hasTotalTimesShown])
  {
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSpringBoardPillLaunch totalTimesShown](self, "totalTimesShown"));
  }
  else
  {
    int v8 = 0;
  }
  v21[0] = @"childAccount";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = @"firstUpdate";
  uint64_t v10 = (void *)v4;
  if (!v4)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9);
  }
  v22[1] = v10;
  v21[2] = @"firstUpdateAnyGesture";
  v11 = v5;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"gesture";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"pillClicked";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"totalTimesShown";
  int v14 = v8;
  if (!v8)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  BOOL v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_30;
    }
LABEL_39:

    if (v6) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }

  if (!v7) {
    goto LABEL_39;
  }
LABEL_30:
  if (v6) {
    goto LABEL_31;
  }
LABEL_40:

LABEL_31:
  if (!v5) {

  }
  if (v19)
  {
    if (v20) {
      goto LABEL_35;
    }
  }
  else
  {

    if (v20) {
      goto LABEL_35;
    }
  }

LABEL_35:

  return v15;
}

- (BMSpringBoardPillLaunch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"childAccount"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"firstUpdate"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          uint64_t v17 = 0;
          goto LABEL_50;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v52 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        v24 = v7;
        id v25 = v8;
        id v26 = [NSString alloc];
        uint64_t v49 = objc_opt_class();
        v27 = v26;
        id v8 = v25;
        int v7 = v24;
        v28 = (id *)[v27 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v49, @"firstUpdate"];
        v70 = v28;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        uint64_t v29 = v23;
        a4 = v28;
        uint64_t v17 = 0;
        v21 = 0;
        id *v52 = (id)[v22 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v59 = v9;
    }
    else
    {
      id v59 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"firstUpdateAnyGesture"];
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v33 = v7;
        id v34 = v8;
        id v35 = [NSString alloc];
        uint64_t v50 = objc_opt_class();
        v36 = v35;
        id v8 = v34;
        int v7 = v33;
        id v58 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v50, @"firstUpdateAnyGesture"];
        id v68 = v58;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v37 = (id)[v30 initWithDomain:v32 code:2 userInfo:v11];
        uint64_t v17 = 0;
        a4 = 0;
        id *v31 = v37;
        uint64_t v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    v11 = [v6 objectForKeyedSubscript:@"gesture"];
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v58 = 0;
          uint64_t v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        id v38 = v8;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"gesture"];
        id v66 = v14;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v41 = v39;
        id v8 = v38;
        int v7 = v55;
        id v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v12];
        uint64_t v17 = 0;
        id v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      id v58 = v11;
    }
    else
    {
      id v58 = 0;
    }
    v12 = [v6 objectForKeyedSubscript:@"pillClicked"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = v8;
      id v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v14 = v12;
LABEL_16:
      BOOL v15 = [v6 objectForKeyedSubscript:@"totalTimesShown"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v16 = 0;
LABEL_19:
        a4 = v56;
        uint64_t v17 = [(BMSpringBoardPillLaunch *)v60 initWithChildAccount:v13 firstUpdate:v59 firstUpdateAnyGesture:v56 gesture:v58 pillClicked:v14 totalTimesShown:v16];
        v60 = v17;
LABEL_46:

        id v8 = v13;
        int v7 = v55;
LABEL_47:

        v21 = v59;
        uint64_t v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalTimesShown"];
        v62 = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        *a4 = (id)[v54 initWithDomain:v51 code:2 userInfo:v47];
      }
      id v16 = 0;
      uint64_t v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      id v13 = v8;
      v53 = a4;
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pillClicked"];
      id v64 = v16;
      BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v15];
      uint64_t v17 = 0;
      id v14 = 0;
      id *v53 = v45;
      goto LABEL_45;
    }
    id v14 = 0;
    uint64_t v17 = 0;
LABEL_57:
    a4 = v56;
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
    uint64_t v17 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  v19 = a4;
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"childAccount"];
  v72[0] = v21;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  uint64_t v17 = 0;
  id v8 = 0;
  id *v19 = (id)[v18 initWithDomain:v20 code:2 userInfo:v9];
LABEL_50:

LABEL_51:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSpringBoardPillLaunch *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasChildAccount)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasFirstUpdate)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasFirstUpdateAnyGesture)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_gesture)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasPillClicked)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasTotalTimesShown)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSpringBoardPillLaunch;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_82;
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
          v5->_hasChildAccount = 1;
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
              goto LABEL_59;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_61:
          BOOL v51 = v21 != 0;
          uint64_t v52 = 16;
          goto LABEL_74;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasFirstUpdate = 1;
          while (2)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  uint64_t v27 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_65:
          BOOL v51 = v27 != 0;
          uint64_t v52 = 18;
          goto LABEL_74;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasFirstUpdateAnyGesture = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v16 = v32++ >= 9;
                if (v16)
                {
                  uint64_t v33 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v33 = 0;
          }
LABEL_69:
          BOOL v51 = v33 != 0;
          uint64_t v52 = 20;
          goto LABEL_74;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          gesture = v5->_gesture;
          v5->_gesture = (NSString *)v37;

          continue;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasPillClicked = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            unint64_t v43 = *(void *)&v4[v42];
            if (v43 == -1 || v43 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v16 = v40++ >= 9;
                if (v16)
                {
                  uint64_t v41 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v41 = 0;
          }
LABEL_73:
          BOOL v51 = v41 != 0;
          uint64_t v52 = 22;
LABEL_74:
          *((unsigned char *)&v5->super.super.isa + v52) = v51;
          continue;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasTotalTimesShown = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_81;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v6;
        unint64_t v49 = *(void *)&v4[v48];
        if (v49 == -1 || v49 >= *(void *)&v4[*v7]) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
        *(void *)&v4[v48] = v49 + 1;
        v47 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0) {
          goto LABEL_76;
        }
        v45 += 7;
        BOOL v16 = v46++ >= 9;
        if (v16)
        {
          LODWORD(v47) = 0;
          goto LABEL_78;
        }
      }
      v4[*v8] = 1;
LABEL_76:
      if (v4[*v8]) {
        LODWORD(v47) = 0;
      }
LABEL_78:
      v5->_totalTimesShown = v47;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_81:
  }
    v53 = 0;
  else {
LABEL_82:
  }
    v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch childAccount](self, "childAccount"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdate](self, "firstUpdate"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdateAnyGesture](self, "firstUpdateAnyGesture"));
  int v7 = [(BMSpringBoardPillLaunch *)self gesture];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSpringBoardPillLaunch pillClicked](self, "pillClicked"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSpringBoardPillLaunch totalTimesShown](self, "totalTimesShown"));
  char v10 = (void *)[v3 initWithFormat:@"BMSpringBoardPillLaunch with childAccount: %@, firstUpdate: %@, firstUpdateAnyGesture: %@, gesture: %@, pillClicked: %@, totalTimesShown: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSpringBoardPillLaunch)initWithChildAccount:(id)a3 firstUpdate:(id)a4 firstUpdateAnyGesture:(id)a5 gesture:(id)a6 pillClicked:(id)a7 totalTimesShown:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSpringBoardPillLaunch;
  unsigned int v20 = [(BMEventBase *)&v23 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasChildAccount = 1;
      v20->_childAccount = [v14 BOOLValue];
    }
    else
    {
      v20->_hasChildAccount = 0;
      v20->_childAccount = 0;
    }
    if (v15)
    {
      v20->_hasFirstUpdate = 1;
      v20->_firstUpdate = [v15 BOOLValue];
    }
    else
    {
      v20->_hasFirstUpdate = 0;
      v20->_firstUpdate = 0;
    }
    if (v16)
    {
      v20->_hasFirstUpdateAnyGesture = 1;
      v20->_firstUpdateAnyGesture = [v16 BOOLValue];
    }
    else
    {
      v20->_hasFirstUpdateAnyGesture = 0;
      v20->_firstUpdateAnyGesture = 0;
    }
    objc_storeStrong((id *)&v20->_gesture, a6);
    if (v18)
    {
      v20->_hasPillClicked = 1;
      v20->_pillClicked = [v18 BOOLValue];
    }
    else
    {
      v20->_hasPillClicked = 0;
      v20->_pillClicked = 0;
    }
    if (v19)
    {
      v20->_hasTotalTimesShown = 1;
      unsigned int v21 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v20->_hasTotalTimesShown = 0;
    }
    v20->_totalTimesShown = v21;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childAccount" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstUpdate" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstUpdateAnyGesture" number:3 type:12 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gesture" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pillClicked" number:5 type:12 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalTimesShown" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4428;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childAccount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstUpdate" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstUpdateAnyGesture" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"gesture" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pillClicked" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalTimesShown" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
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

    id v8 = [[BMSpringBoardPillLaunch alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end