@interface GEOLogMsgStateUGCPhoto
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateUGCPhoto)initWithDictionary:(id)a3;
- (GEOLogMsgStateUGCPhoto)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoSourcesAsString:(int)a3;
- (int)StringAsPhotoSources:(id)a3;
- (int)photoSourceAtIndex:(unint64_t)a3;
- (int)photoSources;
- (unint64_t)hash;
- (unint64_t)photoSourcesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addPhotoSource:(int)a3;
- (void)clearPhotoSources;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPhotoSources:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateUGCPhoto

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgStateUGCPhoto;
  [(GEOLogMsgStateUGCPhoto *)&v3 dealloc];
}

- (unint64_t)photoSourcesCount
{
  return self->_photoSources.count;
}

- (int)photoSources
{
  return self->_photoSources.list;
}

- (void)clearPhotoSources
{
}

- (void)addPhotoSource:(int)a3
{
}

- (int)photoSourceAtIndex:(unint64_t)a3
{
  p_photoSources = &self->_photoSources;
  unint64_t count = self->_photoSources.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_photoSources->list[a3];
}

- (void)setPhotoSources:(int *)a3 count:(unint64_t)a4
{
}

- (id)photoSourcesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53F8440[a3];
  }

  return v3;
}

- (int)StringAsPhotoSources:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIBRARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TAKEN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateUGCPhoto;
  int v4 = [(GEOLogMsgStateUGCPhoto *)&v8 description];
  v5 = [(GEOLogMsgStateUGCPhoto *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateUGCPhoto _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v6 = a1 + 1;
      if (a1[2])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53F8440[v8];
          }
          [v5 addObject:v9];

          ++v7;
          v6 = a1 + 1;
        }
        while (v7 < a1[2]);
      }
      if (a2) {
        v10 = @"photoSource";
      }
      else {
        v10 = @"photo_source";
      }
      [v4 setObject:v5 forKey:v10];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateUGCPhoto _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateUGCPhoto)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateUGCPhoto *)-[GEOLogMsgStateUGCPhoto _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"photoSource";
      }
      else {
        v6 = @"photo_source";
      }
      unint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = v7;
        id v18 = v5;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (!v9) {
          goto LABEL_26;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        while (1)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              if ([v14 isEqualToString:@"UNKNOWN"])
              {
                uint64_t v15 = 0;
              }
              else if ([v14 isEqualToString:@"LIBRARY"])
              {
                uint64_t v15 = 1;
              }
              else if ([v14 isEqualToString:@"TAKEN"])
              {
                uint64_t v15 = 2;
              }
              else
              {
                uint64_t v15 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_24;
              }
              uint64_t v15 = [v13 intValue];
            }
            objc_msgSend(a1, "addPhotoSource:", v15, v17, v18, (void)v19);
LABEL_24:
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (!v10)
          {
LABEL_26:

            unint64_t v7 = v17;
            id v5 = v18;
            break;
          }
        }
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateUGCPhoto)initWithJSON:(id)a3
{
  return (GEOLogMsgStateUGCPhoto *)-[GEOLogMsgStateUGCPhoto _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateUGCPhotoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateUGCPhotoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  p_photoSources = &self->_photoSources;
  if (self->_photoSources.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_photoSources->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOLogMsgStateUGCPhoto *)self readAll:0];
  if ([(GEOLogMsgStateUGCPhoto *)self photoSourcesCount])
  {
    [v7 clearPhotoSources];
    unint64_t v4 = [(GEOLogMsgStateUGCPhoto *)self photoSourcesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPhotoSource:", -[GEOLogMsgStateUGCPhoto photoSourceAtIndex:](self, "photoSourceAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    [(GEOLogMsgStateUGCPhoto *)self readAll:1];
    [v4 readAll:1];
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateUGCPhoto *)self readAll:1];

  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 photoSourcesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLogMsgStateUGCPhoto addPhotoSource:](self, "addPhotoSource:", [v7 photoSourceAtIndex:i]);
  }
}

@end