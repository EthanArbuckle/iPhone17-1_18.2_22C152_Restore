@interface BMAppIntent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13;
- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13 groupIdentifier:(id)a14;
- (BMAppIntent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)donatedBySiri;
- (BOOL)hasDonatedBySiri;
- (BOOL)isEqual:(id)a3;
- (NSData)interaction;
- (NSDate)absoluteTimestamp;
- (NSString)bundleID;
- (NSString)description;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)intentClass;
- (NSString)intentVerb;
- (NSString)itemID;
- (NSString)sourceID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)handlingStatus;
- (int)intentType;
- (int)interactionDirection;
- (unsigned)dataVersion;
- (void)setHasDonatedBySiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntent

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 11)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    v7 = BMAppIntent_v11;
  }
  else
  {
    if (a4 != 12)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    v7 = BMAppIntent;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 36) = a4;
  }

LABEL_9:

  return v9;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMAppIntent;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_89;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
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
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v22;
          continue;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_60;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_60;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_60;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_60;
        case 6u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v6;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_64:
          if (v27 >= 4) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 40;
          goto LABEL_83;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v34 = *v6;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_70:
          if (v27 >= 8) {
            LODWORD(v27) = 0;
          }
          uint64_t v52 = 44;
          goto LABEL_83;
        case 8u:
          uint64_t v23 = PBReaderReadData();
          uint64_t v24 = 88;
          goto LABEL_60;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_60;
        case 0xAu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasDonatedBySiri = 1;
          while (2)
          {
            uint64_t v41 = *v6;
            uint64_t v42 = *(void *)&v4[v41];
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
              *(void *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                BOOL v17 = v39++ >= 9;
                if (v17)
                {
                  uint64_t v40 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v40 = 0;
          }
LABEL_76:
          v5->_donatedBySiri = v40 != 0;
          continue;
        case 0xBu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v27 = 0;
          break;
        case 0xCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
LABEL_60:
          v51 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_88;
          }
          continue;
      }
      while (1)
      {
        uint64_t v47 = *v6;
        uint64_t v48 = *(void *)&v4[v47];
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)&v4[*v7]) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
        *(void *)&v4[v47] = v49;
        v27 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0) {
          goto LABEL_78;
        }
        v45 += 7;
        BOOL v17 = v46++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_80;
        }
      }
      v4[*v8] = 1;
LABEL_78:
      if (v4[*v8]) {
        LODWORD(v27) = 0;
      }
LABEL_80:
      if (v27 >= 4) {
        LODWORD(v27) = 0;
      }
      uint64_t v52 = 48;
LABEL_83:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_88:
  }
    v53 = 0;
  else {
LABEL_89:
  }
    v53 = v5;

  return v53;
}

+ (id)columns
{
  v16[12] = *MEMORY[0x1E4F143B8];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intentClass" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intentVerb" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intentType" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"handlingStatus" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interaction" dataType:4 requestOnly:0 fieldNumber:8 protoDataType:14 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemID" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"donatedBySiri" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionDirection" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupIdentifier" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v2;
  v16[3] = v3;
  v16[4] = v4;
  v16[5] = v5;
  v16[6] = v6;
  v16[7] = v7;
  v16[8] = v8;
  v16[9] = v13;
  v16[10] = v9;
  v16[11] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (int)interactionDirection
{
  return self->_interactionDirection;
}

- (void)setHasDonatedBySiri:(BOOL)a3
{
  self->_hasDonatedBySiri = a3;
}

- (BOOL)hasDonatedBySiri
{
  return self->_hasDonatedBySiri;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (int)handlingStatus
{
  return self->_handlingStatus;
}

- (int)intentType
{
  return self->_intentType;
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (NSString)sourceID
{
  return self->_sourceID;
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
    v6 = [(BMAppIntent *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      v9 = [(BMAppIntent *)self absoluteTimestamp];
      char v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_41;
      }
    }
    uint64_t v13 = [(BMAppIntent *)self bundleID];
    uint64_t v14 = [v5 bundleID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      unint64_t v15 = (void *)v14;
      char v16 = [(BMAppIntent *)self bundleID];
      BOOL v17 = [v5 bundleID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_41;
      }
    }
    v19 = [(BMAppIntent *)self sourceID];
    uint64_t v20 = [v5 sourceID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      unint64_t v21 = (void *)v20;
      double v22 = [(BMAppIntent *)self sourceID];
      uint64_t v23 = [v5 sourceID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_41;
      }
    }
    char v25 = [(BMAppIntent *)self intentClass];
    uint64_t v26 = [v5 intentClass];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      uint64_t v27 = (void *)v26;
      uint64_t v28 = [(BMAppIntent *)self intentClass];
      uint64_t v29 = [v5 intentClass];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_41;
      }
    }
    char v31 = [(BMAppIntent *)self intentVerb];
    uint64_t v32 = [v5 intentVerb];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      unsigned int v33 = (void *)v32;
      uint64_t v34 = [(BMAppIntent *)self intentVerb];
      uint64_t v35 = [v5 intentVerb];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_41;
      }
    }
    int v37 = [(BMAppIntent *)self intentType];
    if (v37 != [v5 intentType]) {
      goto LABEL_41;
    }
    int v38 = [(BMAppIntent *)self handlingStatus];
    if (v38 != [v5 handlingStatus]) {
      goto LABEL_41;
    }
    unsigned int v39 = [(BMAppIntent *)self interaction];
    uint64_t v40 = [v5 interaction];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      uint64_t v41 = (void *)v40;
      uint64_t v42 = [(BMAppIntent *)self interaction];
      unint64_t v43 = [v5 interaction];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_41;
      }
    }
    char v45 = [(BMAppIntent *)self itemID];
    uint64_t v46 = [v5 itemID];
    if (v45 == (void *)v46)
    {
    }
    else
    {
      uint64_t v47 = (void *)v46;
      uint64_t v48 = [(BMAppIntent *)self itemID];
      unint64_t v49 = [v5 itemID];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_41;
      }
    }
    if (![(BMAppIntent *)self hasDonatedBySiri]
      && ![v5 hasDonatedBySiri]
      || [(BMAppIntent *)self hasDonatedBySiri]
      && [v5 hasDonatedBySiri]
      && (int v51 = [(BMAppIntent *)self donatedBySiri],
          v51 == [v5 donatedBySiri]))
    {
      int v52 = [(BMAppIntent *)self interactionDirection];
      if (v52 == [v5 interactionDirection])
      {
        v53 = [(BMAppIntent *)self groupIdentifier];
        v54 = [v5 groupIdentifier];
        if (v53 == v54)
        {
          char v12 = 1;
        }
        else
        {
          objc_super v55 = [(BMAppIntent *)self groupIdentifier];
          v56 = [v5 groupIdentifier];
          char v12 = [v55 isEqual:v56];
        }
        goto LABEL_42;
      }
    }
LABEL_41:
    char v12 = 0;
LABEL_42:

    goto LABEL_43;
  }
  char v12 = 0;
LABEL_43:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v45[12] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppIntent *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMAppIntent *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMAppIntent *)self bundleID];
  uint64_t v8 = [(BMAppIntent *)self sourceID];
  uint64_t v9 = [(BMAppIntent *)self intentClass];
  uint64_t v10 = [(BMAppIntent *)self intentVerb];
  unint64_t v43 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntent intentType](self, "intentType"));
  uint64_t v42 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntent handlingStatus](self, "handlingStatus"));
  int v11 = [(BMAppIntent *)self interaction];
  uint64_t v41 = [v11 base64EncodedStringWithOptions:0];

  uint64_t v40 = [(BMAppIntent *)self itemID];
  char v12 = 0;
  if ([(BMAppIntent *)self hasDonatedBySiri])
  {
    char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntent donatedBySiri](self, "donatedBySiri"));
  }
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppIntent interactionDirection](self, "interactionDirection"));
  uint64_t v14 = [(BMAppIntent *)self groupIdentifier];
  v44[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v34 = (void *)v15;
  v45[0] = v15;
  v44[1] = @"bundleID";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v33 = (void *)v16;
  v45[1] = v16;
  v44[2] = @"sourceID";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v17;
  v45[2] = v17;
  v44[3] = @"intentClass";
  uint64_t v18 = v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v39 = (void *)v6;
  char v31 = (void *)v18;
  v45[3] = v18;
  v44[4] = @"intentVerb";
  uint64_t v19 = v10;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v38 = (void *)v7;
  int v30 = (void *)v19;
  v45[4] = v19;
  v44[5] = @"intentType";
  uint64_t v20 = (uint64_t)v43;
  if (!v43)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v37 = (void *)v8;
  v45[5] = v20;
  v44[6] = @"handlingStatus";
  unint64_t v21 = v42;
  if (!v42)
  {
    unint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v29 = (void *)v20;
  int v36 = (void *)v9;
  v45[6] = v21;
  v44[7] = @"interaction";
  double v22 = v41;
  if (!v41)
  {
    double v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = (void *)v10;
  v45[7] = v22;
  v44[8] = @"itemID";
  int v24 = v40;
  if (!v40)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[8] = v24;
  v44[9] = @"donatedBySiri";
  char v25 = v12;
  if (!v12)
  {
    char v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[9] = v25;
  v44[10] = @"interactionDirection";
  uint64_t v26 = v13;
  if (!v13)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[10] = v26;
  v44[11] = @"groupIdentifier";
  uint64_t v27 = v14;
  if (!v14)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[11] = v27;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:12];
  if (v14)
  {
    if (v13) {
      goto LABEL_32;
    }
LABEL_51:

    if (v12) {
      goto LABEL_33;
    }
    goto LABEL_52;
  }

  if (!v13) {
    goto LABEL_51;
  }
LABEL_32:
  if (v12) {
    goto LABEL_33;
  }
LABEL_52:

LABEL_33:
  if (!v40) {

  }
  if (!v41) {
  if (!v42)
  }

  if (!v43) {
  if (!v23)
  }

  if (v36)
  {
    if (v37) {
      goto LABEL_45;
    }
  }
  else
  {

    if (v37)
    {
LABEL_45:
      if (v38) {
        goto LABEL_46;
      }
LABEL_55:

      if (v39) {
        goto LABEL_47;
      }
      goto LABEL_56;
    }
  }

  if (!v38) {
    goto LABEL_55;
  }
LABEL_46:
  if (v39) {
    goto LABEL_47;
  }
LABEL_56:

LABEL_47:

  return v35;
}

- (BMAppIntent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v150[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v126 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    uint64_t v9 = a4;
    id v10 = v7;
    id v11 = [v8 alloc];
    [v10 doubleValue];
    double v13 = v12;

    a4 = v9;
    uint64_t v14 = (id *)[v11 initWithTimeIntervalSinceReferenceDate:v13];
LABEL_6:
    v126 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        uint64_t v29 = 0;
        goto LABEL_106;
      }
      v74 = a4;
      id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v76 = *MEMORY[0x1E4F502C8];
      uint64_t v149 = *MEMORY[0x1E4F28568];
      uint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v150[0] = v28;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:&v149 count:1];
      id v77 = (id)[v75 initWithDomain:v76 code:2 userInfo:v16];
      a4 = 0;
      uint64_t v29 = 0;
      id *v74 = v77;
      goto LABEL_105;
    }
    uint64_t v14 = v7;
    goto LABEL_6;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v126 = [v15 dateFromString:v7];

LABEL_9:
  uint64_t v16 = [v6 objectForKeyedSubscript:@"bundleID"];
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v123 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v123 = v16;
LABEL_12:
    uint64_t v17 = [v6 objectForKeyedSubscript:@"sourceID"];
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v125 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v125 = v17;
LABEL_15:
      uint64_t v18 = [v6 objectForKeyedSubscript:@"intentClass"];
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v124 = 0;
LABEL_18:
        uint64_t v19 = [v6 objectForKeyedSubscript:@"intentVerb"];
        v119 = v19;
        v121 = v7;
        v112 = v18;
        v117 = v16;
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v122 = 0;
              uint64_t v29 = 0;
              uint64_t v28 = v123;
              a4 = v126;
              goto LABEL_102;
            }
            v114 = self;
            uint64_t v42 = a4;
            id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
            int v44 = v17;
            uint64_t v45 = *MEMORY[0x1E4F502C8];
            uint64_t v141 = *MEMORY[0x1E4F28568];
            id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"intentVerb"];
            id v142 = v118;
            uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
            uint64_t v47 = v45;
            uint64_t v17 = v44;
            v116 = (void *)v46;
            id v122 = 0;
            uint64_t v29 = 0;
            *uint64_t v42 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v47, 2);
            self = v114;
            uint64_t v28 = v123;
            a4 = v126;
            goto LABEL_101;
          }
          id v122 = v19;
        }
        else
        {
          id v122 = 0;
        }
        uint64_t v20 = [v6 objectForKeyedSubscript:@"intentType"];
        v116 = (void *)v20;
        if (v20 && (unint64_t v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v118 = v21;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v118 = 0;
                uint64_t v29 = 0;
                uint64_t v28 = v123;
                a4 = v126;
                uint64_t v16 = v117;
                goto LABEL_101;
              }
              v82 = a4;
              id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
              v84 = v17;
              uint64_t v85 = *MEMORY[0x1E4F502C8];
              uint64_t v139 = *MEMORY[0x1E4F28568];
              id v120 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"intentType"];
              id v140 = v120;
              uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
              uint64_t v87 = v85;
              uint64_t v17 = v84;
              v110 = (void *)v86;
              id v118 = 0;
              uint64_t v29 = 0;
              id *v82 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v87, 2);
              uint64_t v28 = v123;
              a4 = v126;
              uint64_t v19 = v119;
              uint64_t v16 = v117;
LABEL_100:

LABEL_101:
              goto LABEL_102;
            }
            id v118 = [NSNumber numberWithInt:BMAppIntentTypeFromString(v21)];
          }
        }
        else
        {
          id v118 = 0;
        }
        uint64_t v48 = [v6 objectForKeyedSubscript:@"handlingStatus"];
        uint64_t v16 = v117;
        v110 = (void *)v48;
        if (v48 && (unint64_t v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          int v50 = self;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v120 = v49;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v120 = 0;
                uint64_t v29 = 0;
                uint64_t v28 = v123;
                a4 = v126;
                uint64_t v19 = v119;
                goto LABEL_100;
              }
              v91 = a4;
              id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
              v93 = v17;
              uint64_t v94 = *MEMORY[0x1E4F502C8];
              uint64_t v137 = *MEMORY[0x1E4F28568];
              id v115 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"handlingStatus"];
              id v138 = v115;
              uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
              uint64_t v96 = v94;
              uint64_t v17 = v93;
              v109 = (void *)v95;
              id v120 = 0;
              uint64_t v29 = 0;
              id *v91 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v96, 2);
              uint64_t v28 = v123;
              self = v50;
              a4 = v126;
              uint64_t v19 = v119;
              goto LABEL_118;
            }
            id v120 = [NSNumber numberWithInt:BMAppIntentHandlingStatusFromString(v49)];
          }
          uint64_t v19 = v119;
        }
        else
        {
          id v120 = 0;
        }
        uint64_t v51 = [v6 objectForKeyedSubscript:@"interaction"];
        v106 = v17;
        v109 = (void *)v51;
        if (!v51 || (int v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v115 = 0;
          goto LABEL_57;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v115 = v52;
LABEL_57:
          uint64_t v53 = [v6 objectForKeyedSubscript:@"itemID"];
          v107 = (void *)v53;
          if (v53)
          {
            v54 = (void *)v53;
            objc_opt_class();
            objc_super v55 = v54;
            uint64_t v7 = v121;
            if (objc_opt_isKindOfClass())
            {
              id v111 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v111 = 0;
                  uint64_t v29 = 0;
                  uint64_t v28 = v123;
                  a4 = v126;
                  goto LABEL_98;
                }
                v67 = a4;
                id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v69 = *MEMORY[0x1E4F502C8];
                uint64_t v133 = *MEMORY[0x1E4F28568];
                id v108 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"itemID"];
                id v134 = v108;
                v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                uint64_t v70 = v69;
                uint64_t v19 = v119;
                id v111 = 0;
                uint64_t v29 = 0;
                id *v67 = (id)[v68 initWithDomain:v70 code:2 userInfo:v56];
                goto LABEL_124;
              }
              id v111 = v55;
            }
          }
          else
          {
            id v111 = 0;
          }
          v56 = [v6 objectForKeyedSubscript:@"donatedBySiri"];
          if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v57 = a4;
            id v108 = 0;
            goto LABEL_68;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v57 = a4;
            id v108 = v56;
LABEL_68:
            v58 = [v6 objectForKeyedSubscript:@"interactionDirection"];
            if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v59 = self;
              v60 = 0;
              goto LABEL_91;
            }
            v59 = self;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = v58;
LABEL_90:
              v60 = v61;
LABEL_91:
              v78 = [v6 objectForKeyedSubscript:@"groupIdentifier"];
              if (!v78 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v57 = 0;
LABEL_94:
                uint64_t v79 = [v118 intValue];
                int v80 = [v120 intValue];
                LODWORD(v102) = [v60 intValue];
                LODWORD(v100) = v80;
                uint64_t v28 = v123;
                uint64_t v29 = [(BMAppIntent *)v59 initWithAbsoluteTimestamp:v126 bundleID:v123 sourceID:v125 intentClass:v124 intentVerb:v122 intentType:v79 handlingStatus:v100 interaction:v115 itemID:v111 donatedBySiri:v108 interactionDirection:v102 groupIdentifier:v57];
                v59 = v29;
LABEL_95:

LABEL_96:
                self = v59;
                uint64_t v7 = v121;
                a4 = v126;
                uint64_t v18 = v112;
                uint64_t v19 = v119;
LABEL_97:

                goto LABEL_98;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v57 = v78;
                goto LABEL_94;
              }
              if (v57)
              {
                id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v103 = *MEMORY[0x1E4F502C8];
                uint64_t v127 = *MEMORY[0x1E4F28568];
                v88 = v57;
                v89 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"groupIdentifier"];
                v128 = v89;
                v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                id *v88 = (id)[v104 initWithDomain:v103 code:2 userInfo:v90];

                v57 = 0;
              }
              uint64_t v29 = 0;
LABEL_122:
              uint64_t v28 = v123;
              goto LABEL_95;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = [NSNumber numberWithInt:BMAppIntentInteractionDirectionFromString(v58)];
              goto LABEL_90;
            }
            if (v57)
            {
              v97 = v57;
              id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v98 = *MEMORY[0x1E4F502C8];
              uint64_t v129 = *MEMORY[0x1E4F28568];
              v57 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interactionDirection"];
              v130 = v57;
              v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
              id v99 = (id)[v105 initWithDomain:v98 code:2 userInfo:v78];
              v60 = 0;
              uint64_t v29 = 0;
              id *v97 = v99;
              goto LABEL_122;
            }
            v60 = 0;
            uint64_t v29 = 0;
LABEL_129:
            uint64_t v28 = v123;
            goto LABEL_96;
          }
          if (a4)
          {
            v59 = self;
            id v71 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v72 = *MEMORY[0x1E4F502C8];
            uint64_t v131 = *MEMORY[0x1E4F28568];
            v73 = a4;
            v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"donatedBySiri"];
            v132 = v60;
            v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
            id v108 = 0;
            uint64_t v29 = 0;
            id *v73 = (id)[v71 initWithDomain:v72 code:2 userInfo:v58];
            goto LABEL_129;
          }
          id v108 = 0;
          uint64_t v29 = 0;
LABEL_124:
          uint64_t v28 = v123;
          a4 = v126;
          goto LABEL_97;
        }
        if (a4)
        {
          v62 = a4;
          id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v64 = *MEMORY[0x1E4F502C8];
          uint64_t v135 = *MEMORY[0x1E4F28568];
          id v65 = [NSString alloc];
          uint64_t v101 = objc_opt_class();
          v66 = v65;
          uint64_t v19 = v119;
          id v111 = (id)[v66 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v101, @"interaction"];
          id v136 = v111;
          v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
          id v115 = 0;
          uint64_t v29 = 0;
          id *v62 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2);
          uint64_t v28 = v123;
          a4 = v126;
LABEL_98:

          uint64_t v17 = v106;
LABEL_99:

          goto LABEL_100;
        }
        id v115 = 0;
        uint64_t v29 = 0;
        uint64_t v28 = v123;
        a4 = v126;
LABEL_118:
        uint64_t v7 = v121;
        goto LABEL_99;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v124 = v18;
        goto LABEL_18;
      }
      if (a4)
      {
        v113 = self;
        int v37 = a4;
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        unsigned int v39 = v17;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v143 = *MEMORY[0x1E4F28568];
        id v122 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"intentClass"];
        id v144 = v122;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
        uint64_t v41 = v40;
        uint64_t v17 = v39;
        id v124 = 0;
        uint64_t v29 = 0;
        *int v37 = (id)[v38 initWithDomain:v41 code:2 userInfo:v19];
        self = v113;
        uint64_t v28 = v123;
        a4 = v126;
LABEL_102:

        goto LABEL_103;
      }
      id v124 = 0;
      uint64_t v29 = 0;
LABEL_85:
      uint64_t v28 = v123;
      a4 = v126;
LABEL_103:

      goto LABEL_104;
    }
    if (a4)
    {
      int v30 = self;
      char v31 = a4;
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      unsigned int v33 = v17;
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v145 = *MEMORY[0x1E4F28568];
      id v124 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceID"];
      id v146 = v124;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      uint64_t v36 = v34;
      uint64_t v17 = v33;
      id v125 = 0;
      uint64_t v29 = 0;
      *char v31 = (id)[v32 initWithDomain:v36 code:2 userInfo:v35];
      self = v30;
      uint64_t v18 = (void *)v35;
      goto LABEL_85;
    }
    id v125 = 0;
    uint64_t v29 = 0;
    uint64_t v28 = v123;
LABEL_81:
    a4 = v126;
LABEL_104:

    goto LABEL_105;
  }
  if (a4)
  {
    double v22 = self;
    uint64_t v23 = a4;
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v147 = *MEMORY[0x1E4F28568];
    id v125 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
    id v148 = v125;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    uint64_t v27 = v25;
    uint64_t v17 = (void *)v26;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    *uint64_t v23 = (id)[v24 initWithDomain:v27 code:2 userInfo:v26];
    self = v22;
    goto LABEL_81;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  a4 = v126;
LABEL_105:

LABEL_106:
  return v29;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppIntent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_intentClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_intentVerb) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_interaction) {
    PBDataWriterWriteDataField();
  }
  if (self->_itemID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDonatedBySiri) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v17 = [(BMAppIntent *)self absoluteTimestamp];
  uint64_t v16 = [(BMAppIntent *)self bundleID];
  v3 = [(BMAppIntent *)self sourceID];
  id v4 = [(BMAppIntent *)self intentClass];
  double v13 = [(BMAppIntent *)self intentVerb];
  id v5 = BMAppIntentTypeAsString([(BMAppIntent *)self intentType]);
  id v6 = BMAppIntentHandlingStatusAsString([(BMAppIntent *)self handlingStatus]);
  uint64_t v7 = [(BMAppIntent *)self interaction];
  uint64_t v8 = [(BMAppIntent *)self itemID];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppIntent donatedBySiri](self, "donatedBySiri"));
  id v10 = BMAppIntentInteractionDirectionAsString([(BMAppIntent *)self interactionDirection]);
  id v11 = [(BMAppIntent *)self groupIdentifier];
  id v15 = (id)[v14 initWithFormat:@"BMAppIntent with absoluteTimestamp: %@, bundleID: %@, sourceID: %@, intentClass: %@, intentVerb: %@, intentType: %@, handlingStatus: %@, interaction: %@, itemID: %@, donatedBySiri: %@, interactionDirection: %@, groupIdentifier: %@", v17, v16, v3, v4, v13, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13 groupIdentifier:(id)a14
{
  id v19 = a3;
  id obj = a4;
  id v20 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a10;
  id v28 = a11;
  id v21 = a12;
  id v22 = a14;
  v33.receiver = self;
  v33.super_class = (Class)BMAppIntent;
  uint64_t v23 = [(BMEventBase *)&v33 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v19)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      [v19 timeIntervalSinceReferenceDate];
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      double v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_bundleID, obj);
    objc_storeStrong((id *)&v23->_sourceID, a5);
    objc_storeStrong((id *)&v23->_intentClass, a6);
    objc_storeStrong((id *)&v23->_intentVerb, a7);
    v23->_intentType = a8;
    v23->_handlingStatus = a9;
    objc_storeStrong((id *)&v23->_interaction, a10);
    objc_storeStrong((id *)&v23->_itemID, a11);
    if (v21)
    {
      v23->_hasDonatedBySiri = 1;
      v23->_donatedBySiri = [v21 BOOLValue];
    }
    else
    {
      v23->_hasDonatedBySiri = 0;
      v23->_donatedBySiri = 0;
    }
    v23->_interactionDirection = a13;
    objc_storeStrong((id *)&v23->_groupIdentifier, a14);
  }

  return v23;
}

+ (id)protoFields
{
  v16[12] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v16[0] = v15;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:2 type:13 subMessageClass:0];
  v16[1] = v14;
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceID" number:3 type:13 subMessageClass:0];
  v16[2] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intentClass" number:4 type:13 subMessageClass:0];
  v16[3] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intentVerb" number:5 type:13 subMessageClass:0];
  v16[4] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intentType" number:6 type:4 subMessageClass:0];
  v16[5] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"handlingStatus" number:7 type:4 subMessageClass:0];
  v16[6] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interaction" number:8 type:14 subMessageClass:0];
  v16[7] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemID" number:9 type:13 subMessageClass:0];
  v16[8] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"donatedBySiri" number:10 type:12 subMessageClass:0];
  v16[9] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionDirection" number:11 type:4 subMessageClass:0];
  v16[10] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupIdentifier" number:12 type:13 subMessageClass:0];
  v16[11] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF39F0;
}

+ (unsigned)latestDataVersion
{
  return 12;
}

- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13
{
  LODWORD(v15) = a13;
  LODWORD(v14) = a9;
  return [(BMAppIntent *)self initWithAbsoluteTimestamp:a3 bundleID:a4 sourceID:a5 intentClass:a6 intentVerb:a7 intentType:*(void *)&a8 handlingStatus:v14 interaction:a10 itemID:a11 donatedBySiri:a12 interactionDirection:v15 groupIdentifier:0];
}

- (NSString)identifier
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntent *)self bundleID];
  id v5 = [(BMAppIntent *)self itemID];
  id v6 = (void *)[v3 initWithFormat:@"%@:%@", v4, v5];

  return (NSString *)v6;
}

@end