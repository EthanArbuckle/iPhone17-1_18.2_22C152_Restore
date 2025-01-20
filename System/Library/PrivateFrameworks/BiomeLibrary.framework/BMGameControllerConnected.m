@interface BMGameControllerConnected
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMGameControllerConnected)initWithIsControllerConnected:(id)a3 numberOfControllersConnected:(id)a4;
- (BMGameControllerConnected)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsControllerConnected;
- (BOOL)hasNumberOfControllersConnected;
- (BOOL)isControllerConnected;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)numberOfControllersConnected;
- (unsigned)dataVersion;
- (void)setHasIsControllerConnected:(BOOL)a3;
- (void)setHasNumberOfControllersConnected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMGameControllerConnected

- (void)setHasNumberOfControllersConnected:(BOOL)a3
{
  self->_hasNumberOfControllersConnected = a3;
}

- (BOOL)hasNumberOfControllersConnected
{
  return self->_hasNumberOfControllersConnected;
}

- (int)numberOfControllersConnected
{
  return self->_numberOfControllersConnected;
}

- (void)setHasIsControllerConnected:(BOOL)a3
{
  self->_hasIsControllerConnected = a3;
}

- (BOOL)hasIsControllerConnected
{
  return self->_hasIsControllerConnected;
}

- (BOOL)isControllerConnected
{
  return self->_isControllerConnected;
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
    if ([(BMGameControllerConnected *)self hasIsControllerConnected]
      || [v5 hasIsControllerConnected])
    {
      if (![(BMGameControllerConnected *)self hasIsControllerConnected]) {
        goto LABEL_13;
      }
      if (![v5 hasIsControllerConnected]) {
        goto LABEL_13;
      }
      int v6 = [(BMGameControllerConnected *)self isControllerConnected];
      if (v6 != [v5 isControllerConnected]) {
        goto LABEL_13;
      }
    }
    if (![(BMGameControllerConnected *)self hasNumberOfControllersConnected]
      && ![v5 hasNumberOfControllersConnected])
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if ([(BMGameControllerConnected *)self hasNumberOfControllersConnected]
      && [v5 hasNumberOfControllersConnected])
    {
      int v7 = [(BMGameControllerConnected *)self numberOfControllersConnected];
      BOOL v8 = v7 == [v5 numberOfControllersConnected];
    }
    else
    {
LABEL_13:
      BOOL v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(BMGameControllerConnected *)self hasIsControllerConnected])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMGameControllerConnected isControllerConnected](self, "isControllerConnected"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMGameControllerConnected *)self hasNumberOfControllersConnected])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGameControllerConnected numberOfControllersConnected](self, "numberOfControllersConnected"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"isControllerConnected";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"numberOfControllersConnected";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v7;
}

- (BMGameControllerConnected)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"isControllerConnected"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        id v8 = 0;
        goto LABEL_9;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F502C8];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isControllerConnected"];
      v23[0] = v10;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v15 = (id)[v13 initWithDomain:v14 code:2 userInfo:v9];
      v11 = 0;
      id v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"numberOfControllersConnected"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfControllersConnected"];
        v21 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v19];
      }
      id v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  self = [(BMGameControllerConnected *)self initWithIsControllerConnected:v8 numberOfControllersConnected:v10];
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMGameControllerConnected *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsControllerConnected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasNumberOfControllersConnected)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMGameControllerConnected;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_48;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 2)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v5->_hasNumberOfControllersConnected = 1;
        while (1)
        {
          uint64_t v28 = *v6;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 == -1 || v29 >= *(void *)&v4[*v7]) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            goto LABEL_42;
          }
          v25 += 7;
          BOOL v16 = v26++ >= 9;
          if (v16)
          {
            LODWORD(v27) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8]) {
          LODWORD(v27) = 0;
        }
LABEL_44:
        v5->_numberOfControllersConnected = v27;
      }
      else if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        v5->_hasIsControllerConnected = 1;
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
            goto LABEL_38;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            uint64_t v21 = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          uint64_t v21 = 0;
        }
LABEL_40:
        v5->_isControllerConnected = v21 != 0;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_47;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v31 = 0;
  else {
LABEL_48:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMGameControllerConnected isControllerConnected](self, "isControllerConnected"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMGameControllerConnected numberOfControllersConnected](self, "numberOfControllersConnected"));
  id v6 = (void *)[v3 initWithFormat:@"BMGameControllerConnected with isControllerConnected: %@, numberOfControllersConnected: %@", v4, v5];

  return (NSString *)v6;
}

- (BMGameControllerConnected)initWithIsControllerConnected:(id)a3 numberOfControllersConnected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMGameControllerConnected;
  id v8 = [(BMEventBase *)&v11 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v8->_hasIsControllerConnected = 1;
      v8->_isControllerConnected = [v6 BOOLValue];
    }
    else
    {
      v8->_hasIsControllerConnected = 0;
      v8->_isControllerConnected = 0;
    }
    if (v7)
    {
      v8->_hasNumberOfControllersConnected = 1;
      int v9 = [v7 intValue];
    }
    else
    {
      v8->_hasNumberOfControllersConnected = 0;
      int v9 = -1;
    }
    v8->_numberOfControllersConnected = v9;
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isControllerConnected" number:1 type:12 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfControllersConnected" number:2 type:2 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3738;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isControllerConnected" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfControllersConnected" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMGameControllerConnected alloc] initByReadFrom:v7];
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