@interface BMDeviceAccessoryChargingSession
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceAccessoryChargingSession)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDeviceAccessoryChargingSession)initWithProductID:(id)a3 firmwareVersion:(id)a4 startTimestamp:(id)a5 endTimestamp:(id)a6 side:(int)a7;
- (BOOL)hasEndTimestamp;
- (BOOL)hasFirmwareVersion;
- (BOOL)hasProductID;
- (BOOL)hasStartTimestamp;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)endTimestamp;
- (double)startTimestamp;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)side;
- (unsigned)dataVersion;
- (unsigned)firmwareVersion;
- (unsigned)productID;
- (void)setHasEndTimestamp:(BOOL)a3;
- (void)setHasFirmwareVersion:(BOOL)a3;
- (void)setHasProductID:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceAccessoryChargingSession

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productID" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firmwareVersion" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startTimestamp" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endTimestamp" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"side" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (int)side
{
  return self->_side;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  self->_hasEndTimestamp = a3;
}

- (BOOL)hasEndTimestamp
{
  return self->_hasEndTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  self->_hasStartTimestamp = a3;
}

- (BOOL)hasStartTimestamp
{
  return self->_hasStartTimestamp;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setHasFirmwareVersion:(BOOL)a3
{
  self->_hasFirmwareVersion = a3;
}

- (BOOL)hasFirmwareVersion
{
  return self->_hasFirmwareVersion;
}

- (unsigned)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setHasProductID:(BOOL)a3
{
  self->_hasProductID = a3;
}

- (BOOL)hasProductID
{
  return self->_hasProductID;
}

- (unsigned)productID
{
  return self->_productID;
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
    if ([(BMDeviceAccessoryChargingSession *)self hasProductID]
      || [v5 hasProductID])
    {
      if (![(BMDeviceAccessoryChargingSession *)self hasProductID]) {
        goto LABEL_24;
      }
      if (![v5 hasProductID]) {
        goto LABEL_24;
      }
      unsigned int v6 = [(BMDeviceAccessoryChargingSession *)self productID];
      if (v6 != [v5 productID]) {
        goto LABEL_24;
      }
    }
    if ((![(BMDeviceAccessoryChargingSession *)self hasFirmwareVersion]
       && ![v5 hasFirmwareVersion]
       || [(BMDeviceAccessoryChargingSession *)self hasFirmwareVersion]
       && [v5 hasFirmwareVersion]
       && (unsigned int v7 = [(BMDeviceAccessoryChargingSession *)self firmwareVersion],
           v7 == [v5 firmwareVersion]))
      && (![(BMDeviceAccessoryChargingSession *)self hasStartTimestamp]
       && ![v5 hasStartTimestamp]
       || [(BMDeviceAccessoryChargingSession *)self hasStartTimestamp]
       && [v5 hasStartTimestamp]
       && ([(BMDeviceAccessoryChargingSession *)self startTimestamp],
           double v9 = v8,
           [v5 startTimestamp],
           v9 == v10))
      && (![(BMDeviceAccessoryChargingSession *)self hasEndTimestamp]
       && ![v5 hasEndTimestamp]
       || [(BMDeviceAccessoryChargingSession *)self hasEndTimestamp]
       && [v5 hasEndTimestamp]
       && ([(BMDeviceAccessoryChargingSession *)self endTimestamp],
           double v12 = v11,
           [v5 endTimestamp],
           v12 == v13)))
    {
      int v14 = [(BMDeviceAccessoryChargingSession *)self side];
      BOOL v15 = v14 == [v5 side];
    }
    else
    {
LABEL_24:
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceAccessoryChargingSession *)self hasProductID])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession productID](self, "productID"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMDeviceAccessoryChargingSession *)self hasFirmwareVersion])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession firmwareVersion](self, "firmwareVersion"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMDeviceAccessoryChargingSession *)self hasStartTimestamp]
    || ([(BMDeviceAccessoryChargingSession *)self startTimestamp], fabs(v5) == INFINITY))
  {
    unsigned int v7 = 0;
  }
  else
  {
    [(BMDeviceAccessoryChargingSession *)self startTimestamp];
    unsigned int v6 = NSNumber;
    [(BMDeviceAccessoryChargingSession *)self startTimestamp];
    unsigned int v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  if (![(BMDeviceAccessoryChargingSession *)self hasEndTimestamp]
    || ([(BMDeviceAccessoryChargingSession *)self endTimestamp], fabs(v8) == INFINITY))
  {
    double v10 = 0;
  }
  else
  {
    [(BMDeviceAccessoryChargingSession *)self endTimestamp];
    double v9 = NSNumber;
    [(BMDeviceAccessoryChargingSession *)self endTimestamp];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
  }
  double v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAccessoryChargingSession side](self, "side"));
  uint64_t v19 = v3;
  v21[0] = @"productID";
  double v12 = (void *)v3;
  if (!v3)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[0] = v12;
  v21[1] = @"firmwareVersion";
  double v13 = v4;
  if (!v4)
  {
    double v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v13;
  v21[2] = @"startTimestamp";
  int v14 = v7;
  if (!v7)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v14;
  v21[3] = @"endTimestamp";
  BOOL v15 = v10;
  if (!v10)
  {
    BOOL v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v15;
  v21[4] = @"side";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 5, v19);
  if (v11)
  {
    if (v10) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v10)
    {
LABEL_27:
      if (v7) {
        goto LABEL_28;
      }
LABEL_36:

      if (v4) {
        goto LABEL_29;
      }
      goto LABEL_37;
    }
  }

  if (!v7) {
    goto LABEL_36;
  }
LABEL_28:
  if (v4) {
    goto LABEL_29;
  }
LABEL_37:

LABEL_29:
  if (!v20) {

  }
  return v17;
}

- (BMDeviceAccessoryChargingSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"productID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"firmwareVersion"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v39 = 0;
          v20 = 0;
          goto LABEL_41;
        }
        v33 = a4;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firmwareVersion"];
        id v47 = v37;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v39 = 0;
        v20 = 0;
        id *v33 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
        goto LABEL_40;
      }
      id v39 = v9;
    }
    else
    {
      id v39 = 0;
    }
    double v10 = [v6 objectForKeyedSubscript:@"startTimestamp"];
    id v36 = v8;
    v38 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v37 = 0;
          v20 = 0;
          goto LABEL_40;
        }
        v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startTimestamp"];
        id v45 = v13;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v37 = 0;
        v20 = 0;
        id *v23 = (id)[v24 initWithDomain:v25 code:2 userInfo:v11];
LABEL_39:

        self = v38;
        id v8 = v36;
LABEL_40:

        goto LABEL_41;
      }
      id v37 = v10;
    }
    else
    {
      id v37 = 0;
    }
    double v11 = [v6 objectForKeyedSubscript:@"endTimestamp"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          v20 = 0;
          goto LABEL_39;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v27 = a4;
        BOOL v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endTimestamp"];
        v43 = v15;
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v28 = (id)[v34 initWithDomain:v26 code:2 userInfo:v14];
        id v13 = 0;
        v20 = 0;
        id *v27 = v28;
        goto LABEL_38;
      }
      double v12 = a4;
      id v13 = v11;
    }
    else
    {
      double v12 = a4;
      id v13 = 0;
    }
    int v14 = [v6 objectForKeyedSubscript:@"side"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v12)
          {
            id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v32 = *MEMORY[0x1E4F502C8];
            uint64_t v40 = *MEMORY[0x1E4F28568];
            v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"side"];
            v41 = v30;
            v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            *double v12 = (id)[v35 initWithDomain:v32 code:2 userInfo:v31];
          }
          BOOL v15 = 0;
          v20 = 0;
          goto LABEL_38;
        }
        id v16 = [NSNumber numberWithInt:BMDeviceAccessoryChargingSessionSideFromString(v14)];
      }
      BOOL v15 = v16;
    }
    else
    {
      BOOL v15 = 0;
    }
    v20 = -[BMDeviceAccessoryChargingSession initWithProductID:firmwareVersion:startTimestamp:endTimestamp:side:](v38, "initWithProductID:firmwareVersion:startTimestamp:endTimestamp:side:", v36, v39, v37, v13, [v15 intValue]);
    v38 = v20;
LABEL_38:

    goto LABEL_39;
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
    v20 = 0;
    goto LABEL_42;
  }
  v17 = a4;
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v48 = *MEMORY[0x1E4F28568];
  id v39 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"productID"];
  v49[0] = v39;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
  id v8 = 0;
  v20 = 0;
  id *v17 = (id)[v18 initWithDomain:v19 code:2 userInfo:v9];
LABEL_41:

LABEL_42:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceAccessoryChargingSession *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasProductID) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFirmwareVersion) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStartTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasEndTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMDeviceAccessoryChargingSession;
  double v5 = [(BMEventBase *)&v49 init];
  if (!v5) {
    goto LABEL_72;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          v5->_hasProductID = 1;
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
              goto LABEL_50;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_52:
          uint64_t v45 = 24;
          goto LABEL_57;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          v5->_hasFirmwareVersion = 1;
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
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          uint64_t v45 = 28;
LABEL_57:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
          continue;
        case 3u:
          v5->_hasStartTimestamp = 1;
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v7])
          {
            id v35 = *(objc_class **)(*(void *)&v4[*v9] + v34);
            *(void *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v35 = 0;
          }
          uint64_t v46 = 40;
          goto LABEL_68;
        case 4u:
          v5->_hasEndTimestamp = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            id v35 = *(objc_class **)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v35 = 0;
          }
          uint64_t v46 = 48;
LABEL_68:
          *(Class *)((char *)&v5->super.super.isa + v46) = v35;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_71;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        uint64_t v42 = *(void *)&v4[v41];
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)&v4[*v7]) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0) {
          goto LABEL_59;
        }
        v38 += 7;
        BOOL v17 = v39++ >= 9;
        if (v17)
        {
          LODWORD(v40) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8]) {
        LODWORD(v40) = 0;
      }
LABEL_61:
      if (v40 >= 3) {
        LODWORD(v40) = 0;
      }
      v5->_side = v40;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_71:
  }
    id v47 = 0;
  else {
LABEL_72:
  }
    id v47 = v5;

  return v47;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession productID](self, "productID"));
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession firmwareVersion](self, "firmwareVersion"));
  id v6 = NSNumber;
  [(BMDeviceAccessoryChargingSession *)self startTimestamp];
  unsigned int v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMDeviceAccessoryChargingSession *)self endTimestamp];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = BMDeviceAccessoryChargingSessionSideAsString([(BMDeviceAccessoryChargingSession *)self side]);
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMDeviceAccessoryChargingSession with productID: %@, firmwareVersion: %@, startTimestamp: %@, endTimestamp: %@, side: %@", v4, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (BMDeviceAccessoryChargingSession)initWithProductID:(id)a3 firmwareVersion:(id)a4 startTimestamp:(id)a5 endTimestamp:(id)a6 side:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMDeviceAccessoryChargingSession;
  char v16 = [(BMEventBase *)&v22 init];
  if (v16)
  {
    v16->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      v16->_hasProductID = 1;
      unsigned int v17 = [v12 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v16->_hasProductID = 0;
    }
    v16->_productID = v17;
    if (v13)
    {
      v16->_hasFirmwareVersion = 1;
      unsigned int v18 = [v13 unsignedIntValue];
    }
    else
    {
      unsigned int v18 = 0;
      v16->_hasFirmwareVersion = 0;
    }
    v16->_firmwareVersion = v18;
    if (v14)
    {
      v16->_hasStartTimestamp = 1;
      [v14 doubleValue];
    }
    else
    {
      v16->_hasStartTimestamp = 0;
      double v19 = -1.0;
    }
    v16->_startTimestamp = v19;
    if (v15)
    {
      v16->_hasEndTimestamp = 1;
      [v15 doubleValue];
    }
    else
    {
      v16->_hasEndTimestamp = 0;
      double v20 = -1.0;
    }
    v16->_endTimestamp = v20;
    v16->_side = a7;
  }

  return v16;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productID" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"firmwareVersion", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startTimestamp" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endTimestamp" number:4 type:0 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"side" number:5 type:4 subMessageClass:0];
  v9[4] = v6;
  unsigned int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF34F8;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    double v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    unsigned int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDeviceAccessoryChargingSession alloc] initByReadFrom:v7];
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