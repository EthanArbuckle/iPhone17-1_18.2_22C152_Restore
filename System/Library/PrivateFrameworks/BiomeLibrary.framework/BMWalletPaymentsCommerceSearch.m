@interface BMWalletPaymentsCommerceSearch
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWalletPaymentsCommerceSearch)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMWalletPaymentsCommerceSearch)initWithTagSource:(int)a3 tagType:(int)a4 passType:(int)a5 tagClickDate:(id)a6;
- (BOOL)hasTagClickDate;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)tagClickDate;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)passType;
- (int)tagSource;
- (int)tagType;
- (unsigned)dataVersion;
- (void)setHasTagClickDate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMWalletPaymentsCommerceSearch

- (void)setHasTagClickDate:(BOOL)a3
{
  self->_hasTagClickDate = a3;
}

- (BOOL)hasTagClickDate
{
  return self->_hasTagClickDate;
}

- (double)tagClickDate
{
  return self->_tagClickDate;
}

- (int)passType
{
  return self->_passType;
}

- (int)tagType
{
  return self->_tagType;
}

- (int)tagSource
{
  return self->_tagSource;
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
    int v6 = [(BMWalletPaymentsCommerceSearch *)self tagSource];
    if (v6 != [v5 tagSource]) {
      goto LABEL_11;
    }
    int v7 = [(BMWalletPaymentsCommerceSearch *)self tagType];
    if (v7 != [v5 tagType]) {
      goto LABEL_11;
    }
    int v8 = [(BMWalletPaymentsCommerceSearch *)self passType];
    if (v8 != [v5 passType]) {
      goto LABEL_11;
    }
    if (![(BMWalletPaymentsCommerceSearch *)self hasTagClickDate]
      && ![v5 hasTagClickDate])
    {
      BOOL v12 = 1;
      goto LABEL_12;
    }
    if ([(BMWalletPaymentsCommerceSearch *)self hasTagClickDate]
      && [v5 hasTagClickDate])
    {
      [(BMWalletPaymentsCommerceSearch *)self tagClickDate];
      double v10 = v9;
      [v5 tagClickDate];
      BOOL v12 = v10 == v11;
    }
    else
    {
LABEL_11:
      BOOL v12 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceSearch tagSource](self, "tagSource"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceSearch tagType](self, "tagType"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletPaymentsCommerceSearch passType](self, "passType"));
  if (![(BMWalletPaymentsCommerceSearch *)self hasTagClickDate]
    || ([(BMWalletPaymentsCommerceSearch *)self tagClickDate], fabs(v6) == INFINITY))
  {
    int v8 = 0;
  }
  else
  {
    [(BMWalletPaymentsCommerceSearch *)self tagClickDate];
    int v7 = NSNumber;
    [(BMWalletPaymentsCommerceSearch *)self tagClickDate];
    int v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  v15[0] = @"tagSource";
  double v9 = v3;
  if (!v3)
  {
    double v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"tagType";
  double v10 = v4;
  if (!v4)
  {
    double v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"passType";
  double v11 = v5;
  if (!v5)
  {
    double v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"tagClickDate";
  BOOL v12 = v8;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v8)
  {
    if (v5) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v5)
    {
LABEL_15:
      if (v4) {
        goto LABEL_16;
      }
LABEL_22:

      if (v3) {
        goto LABEL_17;
      }
      goto LABEL_23;
    }
  }

  if (!v4) {
    goto LABEL_22;
  }
LABEL_16:
  if (v3) {
    goto LABEL_17;
  }
LABEL_23:

LABEL_17:

  return v13;
}

- (BMWalletPaymentsCommerceSearch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"tagSource"];
  v30 = self;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v32 = 0;
          v15 = 0;
          goto LABEL_31;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v21 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"tagSource"];
        v40[0] = v21;
        int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        id v32 = 0;
        v15 = 0;
        *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v8];
        a4 = v21;
        goto LABEL_45;
      }
      id v32 = [NSNumber numberWithInt:BMWalletPaymentsCommerceSearchTagSourceFromString(v7)];
    }
  }
  else
  {
    id v32 = 0;
  }
  int v8 = [v6 objectForKeyedSubscript:@"tagType"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v9 = v8;
LABEL_15:
        v29 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v9 = [NSNumber numberWithInt:BMWalletPaymentsCommerceSearchTagTypeFromString(v8)];
        goto LABEL_15;
      }
      if (a4)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        double v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"tagType"];
        v38 = v11;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v15 = 0;
        *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v10];
        a4 = 0;
        self = v30;
        goto LABEL_29;
      }
      v15 = 0;
LABEL_45:
      self = v30;
      goto LABEL_30;
    }
  }
  v29 = 0;
LABEL_16:
  double v10 = [v6 objectForKeyedSubscript:@"passType"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v11 = 0;
          v15 = 0;
          a4 = v29;
          goto LABEL_29;
        }
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"passType"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v27 = (id)[v24 initWithDomain:v26 code:2 userInfo:v13];
        double v11 = 0;
        v15 = 0;
        id *v25 = v27;
        a4 = v29;
        self = v30;
        goto LABEL_28;
      }
      id v12 = [NSNumber numberWithInt:BMWalletPaymentsCommerceSearchPassTypeFromString(v10)];
    }
    double v11 = v12;
  }
  else
  {
    double v11 = 0;
  }
  v13 = [v6 objectForKeyedSubscript:@"tagClickDate"];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tagClickDate"];
        v34 = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        *a4 = (id)[v31 initWithDomain:v28 code:2 userInfo:v18];
      }
      id v14 = 0;
      v15 = 0;
      a4 = v29;
      goto LABEL_28;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }
  a4 = v29;
  self = -[BMWalletPaymentsCommerceSearch initWithTagSource:tagType:passType:tagClickDate:](self, "initWithTagSource:tagType:passType:tagClickDate:", [v32 intValue], objc_msgSend(v29, "intValue"), objc_msgSend(v11, "intValue"), v14);
  v15 = self;
LABEL_28:

LABEL_29:
LABEL_30:

LABEL_31:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMWalletPaymentsCommerceSearch *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasTagClickDate) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMWalletPaymentsCommerceSearch;
  id v5 = [(BMEventBase *)&v45 init];
  if (!v5) {
    goto LABEL_70;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_47;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_49:
          if (v22 >= 3) {
            LODWORD(v22) = 0;
          }
          uint64_t v42 = 24;
          goto LABEL_64;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_55:
          if (v22 >= 0x12) {
            LODWORD(v22) = 0;
          }
          uint64_t v42 = 28;
          goto LABEL_64;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          break;
        case 4u:
          v5->_hasTagClickDate = 1;
          uint64_t v39 = *v6;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)&v4[*v7])
          {
            double v41 = *(double *)(*(void *)&v4[*v9] + v40);
            *(void *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v41 = 0.0;
          }
          v5->_tagClickDate = v41;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_69;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v6;
        uint64_t v36 = *(void *)&v4[v35];
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)&v4[*v7]) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
        *(void *)&v4[v35] = v37;
        v22 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0) {
          goto LABEL_59;
        }
        v33 += 7;
        BOOL v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_61:
      if (v22 >= 3) {
        LODWORD(v22) = 0;
      }
      uint64_t v42 = 32;
LABEL_64:
      *(_DWORD *)((char *)&v5->super.super.isa + v42) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_69:
  }
    v43 = 0;
  else {
LABEL_70:
  }
    v43 = v5;

  return v43;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMWalletPaymentsCommerceSearchTagSourceAsString([(BMWalletPaymentsCommerceSearch *)self tagSource]);
  id v5 = BMWalletPaymentsCommerceSearchTagTypeAsString([(BMWalletPaymentsCommerceSearch *)self tagType]);
  id v6 = BMWalletPaymentsCommerceSearchPassTypeAsString([(BMWalletPaymentsCommerceSearch *)self passType]);
  int v7 = NSNumber;
  [(BMWalletPaymentsCommerceSearch *)self tagClickDate];
  int v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = (void *)[v3 initWithFormat:@"BMWalletPaymentsCommerceSearch with tagSource: %@, tagType: %@, passType: %@, tagClickDate: %@", v4, v5, v6, v8];

  return (NSString *)v9;
}

- (BMWalletPaymentsCommerceSearch)initWithTagSource:(int)a3 tagType:(int)a4 passType:(int)a5 tagClickDate:(id)a6
{
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)BMWalletPaymentsCommerceSearch;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_tagSource = a3;
    v11->_tagType = a4;
    v11->_passType = a5;
    if (v10)
    {
      v11->_hasTagClickDate = 1;
      [v10 doubleValue];
    }
    else
    {
      v11->_hasTagClickDate = 0;
      double v12 = -1.0;
    }
    v11->_tagClickDate = v12;
  }

  return v11;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tagSource" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tagType" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passType" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tagClickDate" number:4 type:0 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF68B8;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tagSource" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tagType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tagClickDate" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
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

    int v8 = [[BMWalletPaymentsCommerceSearch alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end