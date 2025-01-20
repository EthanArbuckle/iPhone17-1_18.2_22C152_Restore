@interface BMMediaReaction
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMediaReaction)initWithAbsoluteTimestamp:(double)a3 mediaUUID:(id)a4 type:(int)a5;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)mediaUUID;
- (double)absoluteTimestamp;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaReaction

- (BMMediaReaction)initWithAbsoluteTimestamp:(double)a3 mediaUUID:(id)a4 type:(int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMMediaReaction;
  v10 = [(BMEventBase *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_hasAbsoluteTimestamp = 1;
    v10->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v10->_mediaUUID, a4);
    v11->_hasType = 1;
    v11->_type = a5;
  }

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = NSNumber;
  [(BMMediaReaction *)self absoluteTimestamp];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [(BMMediaReaction *)self mediaUUID];
  uint64_t v7 = [(BMMediaReaction *)self type];
  if (v7 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E55D7B38[(int)v7];
  }
  id v9 = (void *)[v3 initWithFormat:@"BMMediaReaction with absoluteTimestamp: %@, mediaUUID: %@, type: %@", v5, v6, v8];

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMediaReaction;
  v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_44;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        v5->_hasType = 1;
        while (1)
        {
          uint64_t v27 = *v6;
          uint64_t v28 = *(void *)&v4[v27];
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)&v4[*v7]) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
          *(void *)&v4[v27] = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0) {
            goto LABEL_36;
          }
          v24 += 7;
          BOOL v17 = v25++ >= 9;
          if (v17)
          {
            LODWORD(v26) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8]) {
          LODWORD(v26) = 0;
        }
LABEL_38:
        v5->_type = v26;
      }
      else if (v20 == 2)
      {
        uint64_t v31 = PBReaderReadString();
        mediaUUID = v5->_mediaUUID;
        v5->_mediaUUID = (NSString *)v31;
      }
      else if (v20 == 1)
      {
        v5->_hasAbsoluteTimestamp = 1;
        uint64_t v21 = *v6;
        unint64_t v22 = *(void *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v7])
        {
          double v23 = *(double *)(*(void *)&v4[*v9] + v22);
          *(void *)&v4[v21] = v22 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v23 = 0.0;
        }
        v5->_absoluteTimestamp = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    v33 = 0;
  else {
LABEL_44:
  }
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasAbsoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_mediaUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasType)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (unsigned)dataVersion
{
  return 0;
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMMediaReaction alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMMediaReaction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMMediaReaction *)self hasAbsoluteTimestamp]
      || [v5 hasAbsoluteTimestamp])
    {
      if ([(BMMediaReaction *)self hasAbsoluteTimestamp]
        && [v5 hasAbsoluteTimestamp])
      {
        [(BMMediaReaction *)self absoluteTimestamp];
        double v7 = v6;
        [v5 absoluteTimestamp];
        BOOL v9 = v7 == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
    unsigned int v11 = [(BMMediaReaction *)self mediaUUID];
    unint64_t v12 = [v5 mediaUUID];
    if (v11 == v12)
    {
      char v15 = 1;
    }
    else
    {
      uint64_t v13 = [(BMMediaReaction *)self mediaUUID];
      uint64_t v14 = [v5 mediaUUID];
      char v15 = [v13 isEqual:v14];
    }
    if (-[BMMediaReaction hasType](self, "hasType") || [v5 hasType])
    {
      if (-[BMMediaReaction hasType](self, "hasType") && [v5 hasType])
      {
        int v16 = [(BMMediaReaction *)self type];
        BOOL v17 = v16 == [v5 type];
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
    BOOL v10 = v9 & v15 & v17;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)hasAbsoluteTimestamp
{
  return self->_hasAbsoluteTimestamp;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  self->_hasAbsoluteTimestamp = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)mediaUUID
{
  return self->_mediaUUID;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end