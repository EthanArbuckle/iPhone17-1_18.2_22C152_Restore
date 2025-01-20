@interface BMCarouselCompanion
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCarouselCompanion)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMCarouselCompanion)initWithStarting:(id)a3 connected:(id)a4 nearby:(id)a5 cloud:(id)a6;
- (BOOL)cloud;
- (BOOL)connected;
- (BOOL)hasCloud;
- (BOOL)hasConnected;
- (BOOL)hasNearby;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)nearby;
- (BOOL)starting;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasCloud:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasNearby:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMCarouselCompanion

- (void)setHasCloud:(BOOL)a3
{
  self->_hasCloud = a3;
}

- (BOOL)hasCloud
{
  return self->_hasCloud;
}

- (BOOL)cloud
{
  return self->_cloud;
}

- (void)setHasNearby:(BOOL)a3
{
  self->_hasNearby = a3;
}

- (BOOL)hasNearby
{
  return self->_hasNearby;
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
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
    if (-[BMCarouselCompanion hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMCarouselCompanion *)self hasStarting]) {
        goto LABEL_23;
      }
      if (![v5 hasStarting]) {
        goto LABEL_23;
      }
      int v6 = [(BMCarouselCompanion *)self starting];
      if (v6 != [v5 starting]) {
        goto LABEL_23;
      }
    }
    if (-[BMCarouselCompanion hasConnected](self, "hasConnected") || [v5 hasConnected])
    {
      if (![(BMCarouselCompanion *)self hasConnected]) {
        goto LABEL_23;
      }
      if (![v5 hasConnected]) {
        goto LABEL_23;
      }
      int v7 = [(BMCarouselCompanion *)self connected];
      if (v7 != [v5 connected]) {
        goto LABEL_23;
      }
    }
    if (-[BMCarouselCompanion hasNearby](self, "hasNearby") || [v5 hasNearby])
    {
      if (![(BMCarouselCompanion *)self hasNearby]) {
        goto LABEL_23;
      }
      if (![v5 hasNearby]) {
        goto LABEL_23;
      }
      int v8 = [(BMCarouselCompanion *)self nearby];
      if (v8 != [v5 nearby]) {
        goto LABEL_23;
      }
    }
    if (!-[BMCarouselCompanion hasCloud](self, "hasCloud") && ![v5 hasCloud])
    {
      LOBYTE(v10) = 1;
      goto LABEL_24;
    }
    if (-[BMCarouselCompanion hasCloud](self, "hasCloud") && [v5 hasCloud])
    {
      BOOL v9 = [(BMCarouselCompanion *)self cloud];
      int v10 = v9 ^ [v5 cloud] ^ 1;
    }
    else
    {
LABEL_23:
      LOBYTE(v10) = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(v10) = 0;
LABEL_25:

  return v10;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  if ([(BMCarouselCompanion *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMCarouselCompanion *)self hasConnected])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion connected](self, "connected"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMCarouselCompanion *)self hasNearby])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion nearby](self, "nearby"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMCarouselCompanion *)self hasCloud])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion cloud](self, "cloud"));
  }
  else
  {
    int v6 = 0;
  }
  v13[0] = @"starting";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"connected";
  int v8 = v4;
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"nearby";
  BOOL v9 = v5;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"cloud";
  int v10 = v6;
  if (!v6)
  {
    int v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_23;
    }
  }
  else
  {

    if (v5)
    {
LABEL_23:
      if (v4) {
        goto LABEL_24;
      }
LABEL_30:

      if (v3) {
        goto LABEL_25;
      }
      goto LABEL_31;
    }
  }

  if (!v4) {
    goto LABEL_30;
  }
LABEL_24:
  if (v3) {
    goto LABEL_25;
  }
LABEL_31:

LABEL_25:

  return v11;
}

- (BMCarouselCompanion)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    BOOL v9 = [v6 objectForKeyedSubscript:@"connected"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"connected"];
        id v38 = v12;
        int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    int v10 = [v6 objectForKeyedSubscript:@"nearby"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nearby"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      id v12 = v10;
    }
    else
    {
      v11 = self;
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"cloud"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMCarouselCompanion *)v11 initWithStarting:v8 connected:v31 nearby:v12 cloud:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      int v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cloud"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
  v40[0] = v18;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMCarouselCompanion *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasConnected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasNearby)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasCloud)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMCarouselCompanion;
  id v5 = [(BMEventBase *)&v44 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    BOOL v9 = (int *)MEMORY[0x1E4F940B8];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasStarting = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
              goto LABEL_54;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v19 += 7;
            BOOL v25 = v20++ > 8;
            if (v25)
            {
              uint64_t v21 = 0;
              v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
              goto LABEL_57;
            }
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
          goto LABEL_55;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v21 = 0;
          v5->_hasConnected = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
              goto LABEL_54;
            }
            char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 1;
            v21 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v25 = v28++ > 8;
              if (v25)
              {
                uint64_t v21 = 0;
                v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
          goto LABEL_55;
        case 3u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v21 = 0;
          v5->_hasNearby = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
              goto LABEL_54;
            }
            char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 1;
            v21 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v25 = v33++ > 8;
              if (v25)
              {
                uint64_t v21 = 0;
                v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
          goto LABEL_55;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v21 = 0;
          v5->_hasCloud = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        unint64_t v40 = *(void *)&v4[v39];
        if (v40 == -1 || v40 >= *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v40 + 1;
        v21 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
          goto LABEL_55;
        }
        v37 += 7;
        BOOL v25 = v38++ > 8;
        if (v25)
        {
          uint64_t v21 = 0;
          v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
          goto LABEL_57;
        }
      }
      v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
LABEL_54:
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8]) {
        uint64_t v21 = 0;
      }
LABEL_57:
      *((unsigned char *)&v5->super.super.isa + *v26) = v21 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    v42 = 0;
  else {
LABEL_66:
  }
    v42 = v5;

  return v42;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion starting](self, "starting"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion connected](self, "connected"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion nearby](self, "nearby"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCarouselCompanion cloud](self, "cloud"));
  id v8 = (void *)[v3 initWithFormat:@"BMCarouselCompanion with starting: %@, connected: %@, nearby: %@, cloud: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMCarouselCompanion)initWithStarting:(id)a3 connected:(id)a4 nearby:(id)a5 cloud:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMCarouselCompanion;
  unint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasStarting = 1;
      v14->_starting = [v10 BOOLValue];
    }
    else
    {
      v14->_hasStarting = 0;
      v14->_starting = 0;
    }
    if (v11)
    {
      v14->_hasConnected = 1;
      v14->_connected = [v11 BOOLValue];
    }
    else
    {
      v14->_hasConnected = 0;
      v14->_connected = 0;
    }
    if (v12)
    {
      v14->_hasNearby = 1;
      v14->_nearby = [v12 BOOLValue];
    }
    else
    {
      v14->_hasNearby = 0;
      v14->_nearby = 0;
    }
    if (v13)
    {
      v14->_hasCloud = 1;
      v14->_cloud = [v13 BOOLValue];
    }
    else
    {
      v14->_hasCloud = 0;
      v14->_cloud = 0;
    }
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"connected" number:2 type:12 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nearby" number:3 type:12 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cloud" number:4 type:12 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3DB0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"connected" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nearby" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cloud" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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

    id v8 = [[BMCarouselCompanion alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end