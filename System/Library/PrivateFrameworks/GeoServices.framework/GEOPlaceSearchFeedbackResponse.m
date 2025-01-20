@interface GEOPlaceSearchFeedbackResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceSearchFeedbackResponse)initWithDictionary:(id)a3;
- (GEOPlaceSearchFeedbackResponse)initWithJSON:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
@end

@implementation GEOPlaceSearchFeedbackResponse

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceSearchFeedbackResponse;
  v4 = [(GEOPlaceSearchFeedbackResponse *)&v8 description];
  v5 = [(GEOPlaceSearchFeedbackResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (GEOPlaceSearchFeedbackResponse)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchFeedbackResponse *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPlaceSearchFeedbackResponse)initWithJSON:(id)a3
{
  return (GEOPlaceSearchFeedbackResponse *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
      break;
    }
    if (*((unsigned char *)a3 + *v6))
    {
      int v8 = 1;
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      uint64_t v13 = *(void *)((char *)a3 + v12);
      unint64_t v14 = v13 + 1;
      if (v13 == -1 || v14 > *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v13);
      *(void *)((char *)a3 + v12) = v14;
      v11 |= (unint64_t)(v15 & 0x7F) << v9;
      if ((v15 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        LOBYTE(v11) = 0;
        int v8 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v8 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      LOBYTE(v11) = 0;
    }
LABEL_14:
    if (v8) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = (v11 & 7) == 4;
    }
    if (v17) {
      break;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0)
    {
      BOOL v18 = 0;
      goto LABEL_22;
    }
  }
  BOOL v18 = v8 == 0;
LABEL_22:
  PBReaderRecallMark();
  return v18;
}

- (BOOL)readFrom:(id)a3
{
  v3 = (unsigned __int8 *)a3;
  objc_sync_enter(v3);
  if (v3)
  {
    v4 = (int *)MEMORY[0x1E4F940E8];
    v5 = (int *)MEMORY[0x1E4F940E0];
    v6 = (int *)MEMORY[0x1E4F940C8];
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      int v8 = v3[*v6];
      if (*(void *)&v3[*v4] >= *(void *)&v3[*v5]) {
        break;
      }
      if (v3[*v6])
      {
        int v8 = 1;
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        uint64_t v13 = *(void *)&v3[v12];
        unint64_t v14 = v13 + 1;
        if (v13 == -1 || v14 > *(void *)&v3[*v5]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v3[*v7] + v13);
        *(void *)&v3[v12] = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          LOBYTE(v11) = 0;
          int v8 = v3[*v6];
          goto LABEL_15;
        }
      }
      v3[*v6] = 1;
LABEL_13:
      int v8 = v3[*v6];
      if (v3[*v6]) {
        LOBYTE(v11) = 0;
      }
LABEL_15:
      if (v8) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = (v11 & 7) == 4;
      }
      if (v17) {
        break;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        goto LABEL_20;
      }
    }
    BOOL v18 = v8 == 0;
  }
  else
  {
LABEL_20:
    BOOL v18 = 0;
  }
  objc_sync_exit(v3);

  return v18;
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    [(GEOPlaceSearchFeedbackResponse *)self readAll:1];
    [v4 readAll:1];
  }

  return v5;
}

- (unint64_t)hash
{
  return 0;
}

- (void)mergeFrom:(id)a3
{
}

@end