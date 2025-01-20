@interface BMMLSEVirtualFeatureStoreFeatureFeatureValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7;
- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7 missingReason:(int)a8;
- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)stringValue;
- (double)doubleValue;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)missingReason;
- (int)timeBucketValue;
- (unsigned)dataVersion;
- (unsigned)intValue;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEVirtualFeatureStoreFeatureFeatureValue

- (void).cxx_destruct
{
}

- (int)missingReason
{
  return self->_missingReason;
}

- (int)timeBucketValue
{
  return self->_timeBucketValue;
}

- (void)setHasBoolValue:(BOOL)a3
{
  self->_hasBoolValue = a3;
}

- (BOOL)hasBoolValue
{
  return self->_hasBoolValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  self->_hasDoubleValue = a3;
}

- (BOOL)hasDoubleValue
{
  return self->_hasDoubleValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setHasIntValue:(BOOL)a3
{
  self->_hasIntValue = a3;
}

- (BOOL)hasIntValue
{
  return self->_hasIntValue;
}

- (unsigned)intValue
{
  return self->_intValue;
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
    if ([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasIntValue]
      || [v5 hasIntValue])
    {
      if (![(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasIntValue]) {
        goto LABEL_24;
      }
      if (![v5 hasIntValue]) {
        goto LABEL_24;
      }
      unsigned int v6 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self intValue];
      if (v6 != [v5 intValue]) {
        goto LABEL_24;
      }
    }
    if ([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasDoubleValue]
      || [v5 hasDoubleValue])
    {
      if (![(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasDoubleValue]) {
        goto LABEL_24;
      }
      if (![v5 hasDoubleValue]) {
        goto LABEL_24;
      }
      [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self doubleValue];
      double v8 = v7;
      [v5 doubleValue];
      if (v8 != v9) {
        goto LABEL_24;
      }
    }
    v10 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self stringValue];
    uint64_t v11 = [v5 stringValue];
    if (v10 == (void *)v11)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self stringValue];
      v14 = [v5 stringValue];
      int v15 = [v13 isEqual:v14];

      if (!v15) {
        goto LABEL_24;
      }
    }
    if (![(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasBoolValue]
      && ![v5 hasBoolValue]
      || [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasBoolValue]
      && [v5 hasBoolValue]
      && (int v17 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self BOOLValue],
          v17 == [v5 BOOLValue]))
    {
      int v18 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self timeBucketValue];
      if (v18 == [v5 timeBucketValue])
      {
        int v19 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self missingReason];
        BOOL v16 = v19 == [v5 missingReason];
LABEL_25:

        goto LABEL_26;
      }
    }
LABEL_24:
    BOOL v16 = 0;
    goto LABEL_25;
  }
  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (id)jsonDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  if ([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasIntValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue intValue](self, "intValue"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (![(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasDoubleValue]
    || ([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self doubleValue], fabs(v4) == INFINITY))
  {
    unsigned int v6 = 0;
  }
  else
  {
    [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self doubleValue];
    id v5 = NSNumber;
    [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self doubleValue];
    unsigned int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  double v7 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self stringValue];
  if ([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self hasBoolValue])
  {
    double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
  }
  else
  {
    double v8 = 0;
  }
  double v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue timeBucketValue](self, "timeBucketValue"));
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue missingReason](self, "missingReason"));
  v23[0] = @"intValue";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v11;
  v22 = (void *)v3;
  v24[0] = v11;
  v23[1] = @"doubleValue";
  uint64_t v12 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v24[1] = v12;
  v23[2] = @"stringValue";
  v13 = v7;
  if (!v7)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21);
  }
  v24[2] = v13;
  v23[3] = @"BOOLValue";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v14;
  v23[4] = @"timeBucketValue";
  int v15 = v9;
  if (!v9)
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v15;
  v23[5] = @"missingReason";
  BOOL v16 = v10;
  if (!v10)
  {
    BOOL v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v16;
  int v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  if (v10)
  {
    if (v9) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v9)
    {
LABEL_25:
      if (v8) {
        goto LABEL_26;
      }
      goto LABEL_35;
    }
  }

  if (v8)
  {
LABEL_26:
    if (v7) {
      goto LABEL_27;
    }
LABEL_36:

    if (v6) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_35:

  if (!v7) {
    goto LABEL_36;
  }
LABEL_27:
  if (v6) {
    goto LABEL_28;
  }
LABEL_37:

LABEL_28:
  if (!v22) {

  }
  return v17;
}

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"intValue"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"doubleValue"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v18 = 0;
          v20 = 0;
          goto LABEL_50;
        }
        id v21 = v8;
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v45 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"doubleValue"];
        id v61 = v11;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        v24 = v22;
        id v8 = v21;
        int v18 = 0;
        v20 = 0;
        id *v45 = (id)[v24 initWithDomain:v23 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v50 = v9;
    }
    else
    {
      id v50 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"stringValue"];
    v51 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v20 = 0;
          int v18 = v50;
          goto LABEL_49;
        }
        id v25 = v8;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        v46 = a4;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        id v49 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringValue"];
        id v59 = v49;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v28 = v26;
        id v8 = v25;
        id v11 = 0;
        v20 = 0;
        id *v46 = (id)[v28 initWithDomain:v27 code:2 userInfo:v12];
LABEL_48:
        int v18 = v50;

        self = v51;
LABEL_49:

        goto LABEL_50;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"BOOLValue"];
    id v47 = v11;
    id v48 = v8;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v49 = 0;
          v20 = 0;
          goto LABEL_48;
        }
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        v31 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"BOOLValue"];
        v57 = a4;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        id v32 = (id)[v29 initWithDomain:v30 code:2 userInfo:v13];
        id v49 = 0;
        v20 = 0;
        id *v31 = v32;
        goto LABEL_47;
      }
      id v49 = v12;
    }
    else
    {
      id v49 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"timeBucketValue"];
    v44 = a4;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v20 = 0;
            goto LABEL_47;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"timeBucketValue"];
          v55 = v34;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v33];
          a4 = 0;
          v20 = 0;
          id *v44 = v39;
          goto LABEL_46;
        }
        v14 = [NSNumber numberWithInt:BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString(v13)];
      }
      a4 = v14;
    }
    else
    {
      a4 = 0;
    }
    v33 = [v6 objectForKeyedSubscript:@"missingReason"];
    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v35 = v33;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v44)
          {
            id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v42 = *MEMORY[0x1E4F502C8];
            uint64_t v52 = *MEMORY[0x1E4F28568];
            v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"missingReason"];
            v53 = v40;
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
            id *v44 = (id)[v43 initWithDomain:v42 code:2 userInfo:v41];
          }
          v34 = 0;
          v20 = 0;
          goto LABEL_46;
        }
        objc_msgSend(NSNumber, "numberWithInt:", bsearch_b(v33, BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_75) != 0);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v35;
    }
    else
    {
      v34 = 0;
    }
    v20 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:](v51, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:", v48, v50, v47, v49, [a4 intValue], objc_msgSend(v34, "intValue"));
    v51 = v20;
LABEL_46:

LABEL_47:
    id v11 = v47;
    id v8 = v48;
    goto LABEL_48;
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
    goto LABEL_51;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  BOOL v16 = a4;
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v62 = *MEMORY[0x1E4F28568];
  int v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"intValue"];
  v63[0] = v18;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
  id v19 = (id)[v15 initWithDomain:v17 code:2 userInfo:v9];
  id v8 = 0;
  v20 = 0;
  *BOOL v16 = v19;
LABEL_50:

LABEL_51:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasIntValue) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDoubleValue) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasBoolValue) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMMLSEVirtualFeatureStoreFeatureFeatureValue;
  id v5 = [(BMEventBase *)&v55 init];
  if (!v5) {
    goto LABEL_80;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
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
          v5->_hasIntValue = 1;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_57:
          v5->_intValue = v22;
          continue;
        case 2u:
          v5->_hasDoubleValue = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(double *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0.0;
          }
          v5->_doubleValue = v29;
          continue;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v30;

          continue;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasBoolValue = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                BOOL v17 = v33++ >= 9;
                if (v17)
                {
                  uint64_t v34 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v34 = 0;
          }
LABEL_61:
          v5->_BOOLValue = v34 != 0;
          continue;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          while (1)
          {
            uint64_t v42 = *v6;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v7]) {
              break;
            }
            char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if ((v45 & 0x80) == 0) {
              goto LABEL_63;
            }
            v39 += 7;
            BOOL v17 = v40++ >= 9;
            if (v17)
            {
              LODWORD(v41) = 0;
              goto LABEL_65;
            }
          }
          v4[*v8] = 1;
LABEL_63:
          if (v4[*v8]) {
            LODWORD(v41) = 0;
          }
LABEL_65:
          if (v41 >= 0x17) {
            LODWORD(v41) = 0;
          }
          uint64_t v52 = 28;
          goto LABEL_74;
        case 6u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v41 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_79;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v6;
        uint64_t v49 = *(void *)&v4[v48];
        unint64_t v50 = v49 + 1;
        if (v49 == -1 || v50 > *(void *)&v4[*v7]) {
          break;
        }
        char v51 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
        *(void *)&v4[v48] = v50;
        v41 |= (unint64_t)(v51 & 0x7F) << v46;
        if ((v51 & 0x80) == 0) {
          goto LABEL_69;
        }
        v46 += 7;
        BOOL v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v41) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8]) {
        LODWORD(v41) = 0;
      }
LABEL_71:
      if (v41 >= 2) {
        LODWORD(v41) = 0;
      }
      uint64_t v52 = 32;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v41;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_79:
  }
    v53 = 0;
  else {
LABEL_80:
  }
    v53 = v5;

  return v53;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue intValue](self, "intValue"));
  id v5 = NSNumber;
  [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self doubleValue];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self stringValue];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
  double v9 = BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self timeBucketValue]);
  char v10 = BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonAsString([(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self missingReason]);
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMLSEVirtualFeatureStoreFeatureFeatureValue with intValue: %@, doubleValue: %@, stringValue: %@, BOOLValue: %@, timeBucketValue: %@, missingReason: %@", v4, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7 missingReason:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMMLSEVirtualFeatureStoreFeatureFeatureValue;
  int v18 = [(BMEventBase *)&v22 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v18->_hasIntValue = 1;
      unsigned int v19 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v19 = 0;
      v18->_hasIntValue = 0;
    }
    v18->_intValue = v19;
    if (v15)
    {
      v18->_hasDoubleValue = 1;
      [v15 doubleValue];
    }
    else
    {
      v18->_hasDoubleValue = 0;
      double v20 = -1.0;
    }
    v18->_doubleValue = v20;
    objc_storeStrong((id *)&v18->_stringValue, a5);
    if (v17)
    {
      v18->_hasBoolValue = 1;
      v18->_BOOLValue = [v17 BOOLValue];
    }
    else
    {
      v18->_hasBoolValue = 0;
      v18->_BOOLValue = 0;
    }
    v18->_timeBucketValue = a7;
    v18->_missingReason = a8;
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intValue" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"doubleValue" number:2 type:0 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stringValue" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"BOOLValue" number:4 type:12 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeBucketValue" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"missingReason" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3D68;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"intValue" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"doubleValue" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringValue" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"BOOLValue" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeBucketValue" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"missingReason" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMLSEVirtualFeatureStoreFeatureFeatureValue alloc] initByReadFrom:v7];
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

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7
{
  return [(BMMLSEVirtualFeatureStoreFeatureFeatureValue *)self initWithIntValue:a3 doubleValue:a4 stringValue:a5 BOOLValue:a6 timeBucketValue:*(void *)&a7 missingReason:0];
}

@end