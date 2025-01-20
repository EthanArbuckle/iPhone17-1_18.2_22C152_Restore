@interface BMMediaRendered
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMediaRendered)initWithAbsoluteTimestamp:(double)a3 mediaAttributes:(id)a4 isOnScreen:(BOOL)a5 isFirstView:(BOOL)a6;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasIsFirstView;
- (BOOL)hasIsOnScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstView;
- (BOOL)isOnScreen;
- (NSArray)mediaAttributes;
- (NSString)description;
- (double)absoluteTimestamp;
- (id)initByReadFrom:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasIsFirstView:(BOOL)a3;
- (void)setHasIsOnScreen:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaRendered

- (BMMediaRendered)initWithAbsoluteTimestamp:(double)a3 mediaAttributes:(id)a4 isOnScreen:(BOOL)a5 isFirstView:(BOOL)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMMediaRendered;
  v12 = [(BMEventBase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_hasAbsoluteTimestamp = 1;
    v12->_absoluteTimestamp = a3;
    objc_storeStrong((id *)&v12->_mediaAttributes, a4);
    v13->_hasIsOnScreen = 1;
    v13->_isOnScreen = a5;
    v13->_hasIsFirstView = 1;
    v13->_isFirstView = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = NSNumber;
  [(BMMediaRendered *)self absoluteTimestamp];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = [(BMMediaRendered *)self mediaAttributes];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaRendered isOnScreen](self, "isOnScreen"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaRendered isFirstView](self, "isFirstView"));
  v9 = (void *)[v3 initWithFormat:@"BMMediaRendered with absoluteTimestamp: %@, mediaAttributes: %@, isOnScreen: %@, isFirstView: %@", v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMMediaRendered;
  v5 = [(BMEventBase *)&v47 init];
  if (!v5) {
    goto LABEL_56;
  }
  v6 = objc_opt_new();
  v7 = (int *)MEMORY[0x1E4F940E8];
  v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasAbsoluteTimestamp = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            double v23 = *(double *)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v23 = 0.0;
          }
          v5->_absoluteTimestamp = v23;
          continue;
        case 2u:
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_58;
          }
          id v24 = [[BMMediaRenderedMediaAttributes alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_58;
          }
          v25 = v24;
          [v6 addObject:v24];
          PBReaderRecallMark();

          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasIsOnScreen = 1;
          while (2)
          {
            uint64_t v29 = *v7;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v10] + v30);
              *(void *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v18 = v27++ >= 9;
                if (v18)
                {
                  uint64_t v28 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v28 = 0;
          }
LABEL_45:
          BOOL v40 = v28 != 0;
          uint64_t v41 = 18;
          goto LABEL_50;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsFirstView = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        uint64_t v36 = *v7;
        uint64_t v37 = *(void *)&v4[v36];
        unint64_t v38 = v37 + 1;
        if (v37 == -1 || v38 > *(void *)&v4[*v8]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v37);
        *(void *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0) {
          goto LABEL_47;
        }
        v33 += 7;
        BOOL v18 = v34++ >= 9;
        if (v18)
        {
          uint64_t v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9]) {
        uint64_t v35 = 0;
      }
LABEL_49:
      BOOL v40 = v35 != 0;
      uint64_t v41 = 20;
LABEL_50:
      *((unsigned char *)&v5->super.super.isa + v41) = v40;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v42 = [v6 copy];
  mediaAttributes = v5->_mediaAttributes;
  v5->_mediaAttributes = (NSArray *)v42;

  int v44 = v4[*v9];
  if (v44) {
LABEL_55:
  }
    v45 = 0;
  else {
LABEL_56:
  }
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasAbsoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_mediaAttributes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasIsOnScreen) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFirstView) {
    PBDataWriterWriteBOOLField();
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
    v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v4 = [[BMMediaRendered alloc] initByReadFrom:v7];
  }

  return v4;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMMediaRendered *)self writeTo:v3];
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
    if ([(BMMediaRendered *)self hasAbsoluteTimestamp]
      || [v5 hasAbsoluteTimestamp])
    {
      if ([(BMMediaRendered *)self hasAbsoluteTimestamp]
        && [v5 hasAbsoluteTimestamp])
      {
        [(BMMediaRendered *)self absoluteTimestamp];
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
    long long v11 = [(BMMediaRendered *)self mediaAttributes];
    long long v12 = [v5 mediaAttributes];
    if (v11 == v12)
    {
      char v15 = 1;
    }
    else
    {
      long long v13 = [(BMMediaRendered *)self mediaAttributes];
      long long v14 = [v5 mediaAttributes];
      char v15 = [v13 isEqual:v14];
    }
    if (-[BMMediaRendered hasIsOnScreen](self, "hasIsOnScreen") || [v5 hasIsOnScreen])
    {
      if (-[BMMediaRendered hasIsOnScreen](self, "hasIsOnScreen") && [v5 hasIsOnScreen])
      {
        BOOL v16 = [(BMMediaRendered *)self isOnScreen];
        int v17 = v16 ^ [v5 isOnScreen] ^ 1;
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 1;
    }
    if (-[BMMediaRendered hasIsFirstView](self, "hasIsFirstView") || [v5 hasIsFirstView])
    {
      if (-[BMMediaRendered hasIsFirstView](self, "hasIsFirstView") && [v5 hasIsFirstView])
      {
        BOOL v18 = [(BMMediaRendered *)self isFirstView];
        int v19 = v18 ^ [v5 isFirstView] ^ 1;
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 1;
    }
    BOOL v10 = v9 & v15 & v17 & v19;
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

- (NSArray)mediaAttributes
{
  return self->_mediaAttributes;
}

- (BOOL)hasIsOnScreen
{
  return self->_hasIsOnScreen;
}

- (void)setHasIsOnScreen:(BOOL)a3
{
  self->_hasIsOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (BOOL)hasIsFirstView
{
  return self->_hasIsFirstView;
}

- (void)setHasIsFirstView:(BOOL)a3
{
  self->_hasIsFirstView = a3;
}

- (BOOL)isFirstView
{
  return self->_isFirstView;
}

- (void).cxx_destruct
{
}

@end