@interface BMAppInFocus
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12;
- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12 dyldPlatform:(id)a13 isNativeArchitecture:(id)a14;
- (BMAppInFocus)initWithLaunchReason:(id)a3 type:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 bundleID:(id)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactVersionString:(id)a11 dyldPlatform:(id)a12 isNativeArchitecture:(id)a13;
- (BOOL)hasDuration;
- (BOOL)hasDyldPlatform;
- (BOOL)hasIsNativeArchitecture;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNativeArchitecture;
- (BOOL)starting;
- (NSDate)absoluteTimestamp;
- (NSString)bundleID;
- (NSString)description;
- (NSString)exactVersionString;
- (NSString)extensionHostID;
- (NSString)launchReason;
- (NSString)parentBundleID;
- (NSString)shortVersionString;
- (double)duration;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (unsigned)dyldPlatform;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasDyldPlatform:(BOOL)a3;
- (void)setHasIsNativeArchitecture:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAppInFocus

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 10)
  {
    v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    v7 = [[BMAppInFocus alloc] initByReadFrom:v6];
    v8 = v7;
    if (v7) {
      v7[10] = 10;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMAppInFocus;
  id v5 = [(BMEventBase *)&v58 init];
  if (!v5) {
    goto LABEL_84;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_45;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_63:
          if (v24 >= 4) {
            LODWORD(v24) = 0;
          }
          v5->_type = v24;
          continue;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  uint64_t v31 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v31 = 0;
          }
LABEL_69:
          BOOL v54 = v31 != 0;
          uint64_t v55 = 32;
          goto LABEL_78;
        case 4u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            double v38 = *(double *)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v38 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v38;
          continue;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_45;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
          goto LABEL_45;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 80;
          goto LABEL_45;
        case 9u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 88;
          goto LABEL_45;
        case 0xAu:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 96;
LABEL_45:
          v39 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xBu:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasDyldPlatform = 1;
          while (2)
          {
            uint64_t v43 = *v6;
            uint64_t v44 = *(void *)&v4[v43];
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v44);
              *(void *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v17 = v41++ >= 9;
                if (v17)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v42) = 0;
          }
LABEL_73:
          v5->_dyldPlatform = v42;
          continue;
        case 0xCu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          v5->_hasIsNativeArchitecture = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_83;
          }
          continue;
      }
      while (1)
      {
        uint64_t v50 = *v6;
        uint64_t v51 = *(void *)&v4[v50];
        unint64_t v52 = v51 + 1;
        if (v51 == -1 || v52 > *(void *)&v4[*v7]) {
          break;
        }
        char v53 = *(unsigned char *)(*(void *)&v4[*v9] + v51);
        *(void *)&v4[v50] = v52;
        v49 |= (unint64_t)(v53 & 0x7F) << v47;
        if ((v53 & 0x80) == 0) {
          goto LABEL_75;
        }
        v47 += 7;
        BOOL v17 = v48++ >= 9;
        if (v17)
        {
          uint64_t v49 = 0;
          goto LABEL_77;
        }
      }
      v4[*v8] = 1;
LABEL_75:
      if (v4[*v8]) {
        uint64_t v49 = 0;
      }
LABEL_77:
      BOOL v54 = v49 != 0;
      uint64_t v55 = 35;
LABEL_78:
      *((unsigned char *)&v5->super.super.isa + v55) = v54;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_83:
  }
    v56 = 0;
  else {
LABEL_84:
  }
    v56 = v5;

  return v56;
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12
{
  return [(BMAppInFocus *)self initWithLaunchReason:a3 type:*(void *)&a4 starting:a5 absoluteTimestamp:a6 bundleID:a8 parentBundleID:a9 extensionHostID:a10 shortVersionString:a11 exactVersionString:a12 dyldPlatform:0 isNativeArchitecture:0];
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 type:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 bundleID:(id)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactVersionString:(id)a11 dyldPlatform:(id)a12 isNativeArchitecture:(id)a13
{
  id v35 = a3;
  id v17 = a5;
  id v18 = a6;
  id v28 = a7;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  v19 = v18;
  id v20 = a12;
  id v21 = a13;
  v36.receiver = self;
  v36.super_class = (Class)BMAppInFocus;
  char v22 = [(BMEventBase *)&v36 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v22->_launchReason, a3);
    v22->_type = a4;
    if (v17)
    {
      v22->_hasStarting = 1;
      v22->_starting = [v17 BOOLValue];
    }
    else
    {
      v22->_hasStarting = 0;
      v22->_starting = 0;
    }
    if (v19)
    {
      v22->_hasRaw_absoluteTimestamp = 1;
      [v19 timeIntervalSinceReferenceDate];
    }
    else
    {
      v22->_hasRaw_absoluteTimestamp = 0;
      double v23 = -1.0;
    }
    v22->_raw_absoluteTimestamp = v23;
    objc_storeStrong((id *)&v22->_bundleID, v28);
    objc_storeStrong((id *)&v22->_parentBundleID, a8);
    objc_storeStrong((id *)&v22->_extensionHostID, a9);
    objc_storeStrong((id *)&v22->_shortVersionString, a10);
    objc_storeStrong((id *)&v22->_exactVersionString, a11);
    if (v20)
    {
      v22->_hasDyldPlatform = 1;
      unsigned int v24 = [v20 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v22->_hasDyldPlatform = 0;
    }
    v22->_dyldPlatform = v24;
    if (v21)
    {
      v22->_hasIsNativeArchitecture = 1;
      v22->_isNativeArchitecture = [v21 BOOLValue];
    }
    else
    {
      v22->_hasIsNativeArchitecture = 0;
      v22->_isNativeArchitecture = 0;
    }
  }

  return v22;
}

+ (unsigned)latestDataVersion
{
  return 10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactVersionString, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_launchReason, 0);
}

+ (id)columns
{
  v17[13] = *MEMORY[0x1E4F143B8];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"launchReason" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"launchType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duration" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"parentBundleID" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"extensionHostID" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shortVersionString" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"exactVersionString" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dyldPlatform" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNativeArchitecture" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v17[3] = v2;
  v17[4] = v3;
  v17[5] = v4;
  v17[6] = v5;
  v17[7] = v6;
  v17[8] = v13;
  v17[9] = v7;
  v17[10] = v12;
  v17[11] = v8;
  v17[12] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];

  return v11;
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppInFocus *)self writeTo:v3];
  v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_launchReason) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  v4 = v5;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_extensionHostID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shortVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_exactVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasDyldPlatform)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasIsNativeArchitecture)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
}

- (int)type
{
  return self->_type;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (BOOL)hasIsNativeArchitecture
{
  return self->_hasIsNativeArchitecture;
}

- (BOOL)hasDyldPlatform
{
  return self->_hasDyldPlatform;
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12 dyldPlatform:(id)a13 isNativeArchitecture:(id)a14
{
  return -[BMAppInFocus initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:](self, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", a3, *(void *)&a4, a5, a6, a8, a9);
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (double)duration
{
  return self->_duration;
}

- (void)setHasIsNativeArchitecture:(BOOL)a3
{
  self->_hasIsNativeArchitecture = a3;
}

- (BOOL)isNativeArchitecture
{
  return self->_isNativeArchitecture;
}

- (void)setHasDyldPlatform:(BOOL)a3
{
  self->_hasDyldPlatform = a3;
}

- (unsigned)dyldPlatform
{
  return self->_dyldPlatform;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMAppInFocus *)self launchReason];
    uint64_t v7 = [v5 launchReason];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppInFocus *)self launchReason];
      char v10 = [v5 launchReason];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_47;
      }
    }
    int v13 = [(BMAppInFocus *)self type];
    if (v13 != [v5 type]) {
      goto LABEL_47;
    }
    if (-[BMAppInFocus hasStarting](self, "hasStarting") || [v5 hasStarting])
    {
      if (![(BMAppInFocus *)self hasStarting]) {
        goto LABEL_47;
      }
      if (![v5 hasStarting]) {
        goto LABEL_47;
      }
      int v14 = [(BMAppInFocus *)self starting];
      if (v14 != [v5 starting]) {
        goto LABEL_47;
      }
    }
    unint64_t v15 = [(BMAppInFocus *)self absoluteTimestamp];
    uint64_t v16 = [v5 absoluteTimestamp];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      id v17 = (void *)v16;
      id v18 = [(BMAppInFocus *)self absoluteTimestamp];
      v19 = [v5 absoluteTimestamp];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_47;
      }
    }
    id v21 = [(BMAppInFocus *)self bundleID];
    uint64_t v22 = [v5 bundleID];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      double v23 = (void *)v22;
      unsigned int v24 = [(BMAppInFocus *)self bundleID];
      uint64_t v25 = [v5 bundleID];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_47;
      }
    }
    unint64_t v27 = [(BMAppInFocus *)self parentBundleID];
    uint64_t v28 = [v5 parentBundleID];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      char v29 = (void *)v28;
      id v30 = [(BMAppInFocus *)self parentBundleID];
      id v31 = [v5 parentBundleID];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_47;
      }
    }
    id v33 = [(BMAppInFocus *)self extensionHostID];
    uint64_t v34 = [v5 extensionHostID];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      id v35 = (void *)v34;
      objc_super v36 = [(BMAppInFocus *)self extensionHostID];
      unint64_t v37 = [v5 extensionHostID];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_47;
      }
    }
    v39 = [(BMAppInFocus *)self shortVersionString];
    uint64_t v40 = [v5 shortVersionString];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      unsigned int v41 = (void *)v40;
      uint64_t v42 = [(BMAppInFocus *)self shortVersionString];
      uint64_t v43 = [v5 shortVersionString];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_47;
      }
    }
    unint64_t v45 = [(BMAppInFocus *)self exactVersionString];
    uint64_t v46 = [v5 exactVersionString];
    if (v45 == (void *)v46)
    {
    }
    else
    {
      char v47 = (void *)v46;
      unsigned int v48 = [(BMAppInFocus *)self exactVersionString];
      uint64_t v49 = [v5 exactVersionString];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_47;
      }
    }
    if (!-[BMAppInFocus hasDyldPlatform](self, "hasDyldPlatform") && ![v5 hasDyldPlatform]
      || [(BMAppInFocus *)self hasDyldPlatform]
      && [v5 hasDyldPlatform]
      && (unsigned int v51 = -[BMAppInFocus dyldPlatform](self, "dyldPlatform"), v51 == [v5 dyldPlatform]))
    {
      if (![(BMAppInFocus *)self hasIsNativeArchitecture]
        && ![v5 hasIsNativeArchitecture])
      {
        LOBYTE(v12) = 1;
        goto LABEL_48;
      }
      if ([(BMAppInFocus *)self hasIsNativeArchitecture]
        && [v5 hasIsNativeArchitecture])
      {
        BOOL v52 = [(BMAppInFocus *)self isNativeArchitecture];
        int v12 = v52 ^ [v5 isNativeArchitecture] ^ 1;
LABEL_48:

        goto LABEL_49;
      }
    }
LABEL_47:
    LOBYTE(v12) = 0;
    goto LABEL_48;
  }
  LOBYTE(v12) = 0;
LABEL_49:

  return v12;
}

- (id)jsonDictionary
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAppInFocus *)self launchReason];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAppInFocus type](self, "type"));
  if ([(BMAppInFocus *)self hasStarting])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppInFocus starting](self, "starting"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(BMAppInFocus *)self absoluteTimestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMAppInFocus *)self absoluteTimestamp];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v10 = [(BMAppInFocus *)self bundleID];
  v39 = [(BMAppInFocus *)self parentBundleID];
  int v38 = [(BMAppInFocus *)self extensionHostID];
  unint64_t v37 = [(BMAppInFocus *)self shortVersionString];
  objc_super v36 = [(BMAppInFocus *)self exactVersionString];
  if ([(BMAppInFocus *)self hasDyldPlatform])
  {
    id v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](self, "dyldPlatform"));
  }
  else
  {
    id v35 = 0;
  }
  if ([(BMAppInFocus *)self hasIsNativeArchitecture])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppInFocus isNativeArchitecture](self, "isNativeArchitecture"));
  }
  else
  {
    int v11 = 0;
  }
  v40[0] = @"launchReason";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  id v30 = (void *)v12;
  uint64_t v51 = v12;
  v40[1] = @"type";
  if (v4)
  {
    uint64_t v52 = v4;
    unsigned int v41 = @"launchType";
    uint64_t v13 = v4;
  }
  else
  {
    int v26 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v52 = (uint64_t)v26;
    unsigned int v41 = @"launchType";
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  char v29 = (void *)v13;
  uint64_t v53 = v13;
  uint64_t v42 = @"starting";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)v14;
  uint64_t v54 = v14;
  uint64_t v43 = @"absoluteTimestamp";
  uint64_t v15 = v9;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v34 = (void *)v3;
  unint64_t v27 = (void *)v15;
  uint64_t v55 = v15;
  int v44 = @"bundleID";
  uint64_t v16 = (void *)v10;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  id v33 = (void *)v4;
  v56 = v16;
  unint64_t v45 = @"parentBundleID";
  id v17 = v39;
  if (!v39)
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v5;
  v57 = v17;
  uint64_t v46 = @"extensionHostID";
  id v18 = v38;
  if (!v38)
  {
    id v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  objc_super v58 = v18;
  char v47 = @"shortVersionString";
  int v20 = v37;
  if (!v37)
  {
    int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  id v21 = (void *)v10;
  v59 = v20;
  unsigned int v48 = @"exactVersionString";
  uint64_t v22 = v36;
  if (!v36)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = v22;
  uint64_t v49 = @"dyldPlatform";
  double v23 = v35;
  if (!v35)
  {
    double v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = v23;
  int v50 = @"isNativeArchitecture";
  unsigned int v24 = v11;
  if (!v11)
  {
    unsigned int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = v24;
  id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:v40 count:12];
  if (!v11) {

  }
  if (!v35) {
  if (!v36)
  }

  if (!v37) {
  if (!v38)
  }

  if (!v39) {
  if (!v21)
  }

  if (v19)
  {
    if (v32) {
      goto LABEL_52;
    }
  }
  else
  {

    if (v32)
    {
LABEL_52:
      if (v33) {
        goto LABEL_53;
      }
LABEL_59:

      if (v34) {
        goto LABEL_54;
      }
      goto LABEL_60;
    }
  }

  if (!v33) {
    goto LABEL_59;
  }
LABEL_53:
  if (v34) {
    goto LABEL_54;
  }
LABEL_60:

LABEL_54:

  return v31;
}

- (BMAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v126[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"launchReason"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"type"];
    if ((v8
       || ([v5 objectForKeyedSubscript:@"launchType"],
           (v8 = objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v9 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v95 = a4;
        uint64_t v10 = v8;
        v8 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            uint64_t v28 = 0;
            goto LABEL_100;
          }
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          unsigned int v48 = a4;
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v123 = *MEMORY[0x1E4F28568];
          id v101 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          id v124 = v101;
          int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
          id v50 = (id)[v47 initWithDomain:v49 code:2 userInfo:v11];
          a4 = 0;
          uint64_t v28 = 0;
          *unsigned int v48 = v50;
          id v7 = v9;
          goto LABEL_99;
        }
        v95 = a4;
        uint64_t v10 = [NSNumber numberWithInt:BMAppInFocusTypeFromString(v8)];
      }
      a4 = v10;
    }
    else
    {
      v95 = a4;
      a4 = 0;
    }
    int v11 = [v5 objectForKeyedSubscript:@"starting"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v95)
        {
          id v101 = 0;
          uint64_t v28 = 0;
LABEL_99:

          goto LABEL_100;
        }
        id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
        objc_super v36 = a4;
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        id v99 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
        id v122 = v99;
        int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        uint64_t v39 = v37;
        a4 = v36;
        id v40 = (id)[v102 initWithDomain:v39 code:2 userInfo:v38];
        id v101 = 0;
        uint64_t v28 = 0;
        id *v95 = v40;
LABEL_98:

        goto LABEL_99;
      }
      id v98 = v7;
      id v101 = v11;
    }
    else
    {
      id v98 = v7;
      id v101 = 0;
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v18 = v12;
        id v19 = [v17 alloc];
        [v18 doubleValue];
        double v21 = v20;

        id v99 = (id)[v19 initWithTimeIntervalSinceReferenceDate:v21];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v41 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v99 = [v41 dateFromString:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              id v99 = 0;
              uint64_t v28 = 0;
              int v38 = v12;
              id v7 = v98;
              goto LABEL_98;
            }
            id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
            v78 = a4;
            uint64_t v79 = *MEMORY[0x1E4F502C8];
            uint64_t v119 = *MEMORY[0x1E4F28568];
            id v97 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
            id v120 = v97;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
            uint64_t v80 = v79;
            a4 = v78;
            id v81 = (id)[v100 initWithDomain:v80 code:2 userInfo:v13];
            id v99 = 0;
            uint64_t v28 = 0;
            id *v95 = v81;
            int v38 = v12;
            goto LABEL_108;
          }
          id v99 = v12;
        }
      }
    }
    else
    {
      id v99 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"bundleID"];
    v94 = v12;
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v97 = 0;
LABEL_24:
      uint64_t v14 = [v5 objectForKeyedSubscript:@"parentBundleID"];
      v91 = v13;
      v92 = a4;
      v93 = (void *)v14;
      if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v51 = v8;
          if (!v95)
          {
            id v96 = 0;
            uint64_t v28 = 0;
            id v7 = v98;
            int v38 = v12;
            goto LABEL_96;
          }
          id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v53 = v11;
          uint64_t v54 = *MEMORY[0x1E4F502C8];
          uint64_t v115 = *MEMORY[0x1E4F28568];
          uint64_t v55 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"parentBundleID"];
          uint64_t v116 = v55;
          uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
          v57 = v52;
          a4 = v92;
          uint64_t v58 = v54;
          int v11 = v53;
          id v16 = (id)v55;
          v90 = (void *)v56;
          uint64_t v28 = 0;
          id v96 = 0;
          id *v95 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2);
          goto LABEL_105;
        }
        id v96 = v15;
      }
      else
      {
        id v96 = 0;
      }
      id v16 = [v5 objectForKeyedSubscript:@"extensionHostID"];
      v87 = v6;
      v90 = v16;
      if (!v16)
      {
LABEL_42:
        char v29 = [v5 objectForKeyedSubscript:@"shortVersionString"];
        if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v63 = v8;
            if (!v95)
            {
              id v89 = 0;
              uint64_t v28 = 0;
              int v38 = v94;
              id v7 = v98;
              goto LABEL_94;
            }
            v64 = v11;
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v66 = *MEMORY[0x1E4F502C8];
            uint64_t v111 = *MEMORY[0x1E4F28568];
            id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"shortVersionString"];
            id v112 = v88;
            id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
            v67 = v65;
            int v11 = v64;
            uint64_t v28 = 0;
            id v89 = 0;
            id *v95 = (id)[v67 initWithDomain:v66 code:2 userInfo:v30];
            goto LABEL_111;
          }
          id v89 = v29;
        }
        else
        {
          id v89 = 0;
        }
        id v30 = [v5 objectForKeyedSubscript:@"exactVersionString"];
        v84 = v11;
        if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v88 = 0;
LABEL_48:
          id v31 = [v5 objectForKeyedSubscript:@"dyldPlatform"];
          id v86 = v16;
          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v85 = v8;
              if (!v95)
              {
                id v33 = 0;
                uint64_t v28 = 0;
                goto LABEL_91;
              }
              int v32 = self;
              id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v73 = *MEMORY[0x1E4F502C8];
              uint64_t v107 = *MEMORY[0x1E4F28568];
              id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dyldPlatform"];
              id v108 = v35;
              uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
              id v74 = (id)[v82 initWithDomain:v73 code:2 userInfo:v34];
              uint64_t v28 = 0;
              id v33 = 0;
              id *v95 = v74;
              goto LABEL_89;
            }
            int v32 = self;
            id v33 = v31;
          }
          else
          {
            int v32 = self;
            id v33 = 0;
          }
          uint64_t v34 = [v5 objectForKeyedSubscript:@"isNativeArchitecture"];
          if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v35 = 0;
LABEL_54:
            uint64_t v28 = -[BMAppInFocus initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:](v32, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", v98, [v92 intValue], v101, v99, v97, v96, v86, v89, v88, v33, v35);
            int v32 = v28;
LABEL_90:
            self = v32;

            int v11 = v84;
            id v16 = v86;
            goto LABEL_91;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v35 = v34;
            goto LABEL_54;
          }
          v85 = v8;
          if (v95)
          {
            id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v83 = *MEMORY[0x1E4F502C8];
            uint64_t v105 = *MEMORY[0x1E4F28568];
            v75 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isNativeArchitecture"];
            v106 = v75;
            v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
            id *v95 = (id)[v104 initWithDomain:v83 code:2 userInfo:v76];
          }
          id v35 = 0;
          uint64_t v28 = 0;
LABEL_89:
          v8 = v85;
          goto LABEL_90;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v88 = v30;
          goto LABEL_48;
        }
        uint64_t v63 = v8;
        if (v95)
        {
          id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v69 = v16;
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v109 = *MEMORY[0x1E4F28568];
          id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"exactVersionString"];
          id v110 = v33;
          id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
          v71 = v68;
          int v11 = v84;
          uint64_t v72 = v70;
          id v16 = v69;
          uint64_t v28 = 0;
          id v88 = 0;
          id *v95 = (id)[v71 initWithDomain:v72 code:2 userInfo:v31];
LABEL_91:

LABEL_92:
          id v7 = v98;
          goto LABEL_93;
        }
        id v88 = 0;
        uint64_t v28 = 0;
LABEL_111:
        v8 = v63;
        goto LABEL_92;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = 0;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v16;
        goto LABEL_42;
      }
      uint64_t v51 = v8;
      if (v95)
      {
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        v60 = v11;
        uint64_t v61 = *MEMORY[0x1E4F502C8];
        uint64_t v113 = *MEMORY[0x1E4F28568];
        id v89 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"extensionHostID"];
        id v114 = v89;
        char v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        uint64_t v62 = v61;
        int v11 = v60;
        uint64_t v28 = 0;
        id v16 = 0;
        id *v95 = (id)[v59 initWithDomain:v62 code:2 userInfo:v29];
        id v7 = v98;
LABEL_93:
        int v38 = v94;
        uint64_t v13 = v91;
LABEL_94:

        v6 = v87;
        a4 = v92;
LABEL_95:

        goto LABEL_96;
      }
      id v16 = 0;
      uint64_t v28 = 0;
LABEL_105:
      id v7 = v98;
      v8 = v51;
      int v38 = v94;
      goto LABEL_95;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v97 = v13;
      goto LABEL_24;
    }
    if (v95)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v43 = a4;
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v117 = *MEMORY[0x1E4F28568];
      id v96 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
      id v118 = v96;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      uint64_t v46 = v44;
      a4 = v43;
      v93 = (void *)v45;
      uint64_t v28 = 0;
      id v97 = 0;
      id *v95 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v46, 2);
      int v38 = v12;
      id v7 = v98;
LABEL_96:

LABEL_97:
      goto LABEL_98;
    }
    id v97 = 0;
    uint64_t v28 = 0;
    int v38 = v12;
LABEL_108:
    id v7 = v98;
    goto LABEL_97;
  }
  if (a4)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    double v23 = a4;
    uint64_t v24 = *MEMORY[0x1E4F502C8];
    uint64_t v125 = *MEMORY[0x1E4F28568];
    uint64_t v25 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"launchReason"];
    v126[0] = v25;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:&v125 count:1];
    uint64_t v26 = v24;
    a4 = v25;
    id v27 = (id)[v22 initWithDomain:v26 code:2 userInfo:v8];
    id v7 = 0;
    uint64_t v28 = 0;
    *double v23 = v27;
LABEL_100:

    goto LABEL_101;
  }
  id v7 = 0;
  uint64_t v28 = 0;
LABEL_101:

  return v28;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = [(BMAppInFocus *)self launchReason];
  uint64_t v13 = BMAppInFocusTypeAsString([(BMAppInFocus *)self type]);
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppInFocus starting](self, "starting"));
  uint64_t v3 = [(BMAppInFocus *)self absoluteTimestamp];
  uint64_t v4 = [(BMAppInFocus *)self bundleID];
  id v5 = [(BMAppInFocus *)self parentBundleID];
  v6 = [(BMAppInFocus *)self extensionHostID];
  id v7 = [(BMAppInFocus *)self shortVersionString];
  v8 = [(BMAppInFocus *)self exactVersionString];
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](self, "dyldPlatform"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppInFocus isNativeArchitecture](self, "isNativeArchitecture"));
  id v16 = (void *)[v15 initWithFormat:@"BMAppInFocus with launchReason: %@, type: %@, starting: %@, absoluteTimestamp: %@, bundleID: %@, parentBundleID: %@, extensionHostID: %@, shortVersionString: %@, exactVersionString: %@, dyldPlatform: %@, isNativeArchitecture: %@", v14, v13, v12, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v16;
}

+ (id)protoFields
{
  v16[12] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"launchReason" number:1 type:13 subMessageClass:0];
  v16[0] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:2 type:4 subMessageClass:0];
  v16[1] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:3 type:12 subMessageClass:0];
  v16[2] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:4 type:0 subMessageClass:0];
  v16[3] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"duration" number:5 type:0 subMessageClass:0];
  v16[4] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:6 type:13 subMessageClass:0];
  v16[5] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parentBundleID" number:7 type:13 subMessageClass:0];
  v16[6] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"extensionHostID" number:8 type:13 subMessageClass:0];
  v16[7] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shortVersionString" number:9 type:13 subMessageClass:0];
  v16[8] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"exactVersionString" number:10 type:13 subMessageClass:0];
  v16[9] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dyldPlatform" number:11 type:4 subMessageClass:0];
  v16[10] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNativeArchitecture" number:12 type:12 subMessageClass:0];
  v16[11] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4D70;
}

@end