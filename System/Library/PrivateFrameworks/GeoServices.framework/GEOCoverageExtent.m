@interface GEOCoverageExtent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMaxX;
- (BOOL)hasMaxY;
- (BOOL)hasMinX;
- (BOOL)hasMinY;
- (BOOL)hasZoom;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCoverageException)coverageExceptionAtIndex:(SEL)a3;
- (GEOCoverageException)coverageExceptions;
- (GEOCoverageExtent)initWithDictionary:(id)a3;
- (GEOCoverageExtent)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveCoverageExceptions:(uint64_t)a1;
- (unint64_t)coverageExceptionsCount;
- (unint64_t)hash;
- (unsigned)maxX;
- (unsigned)maxY;
- (unsigned)minX;
- (unsigned)minY;
- (unsigned)zoom;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addCoverageException:(GEOCoverageException *)a3;
- (void)clearCoverageExceptions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCoverageExceptions:(GEOCoverageException *)a3 count:(unint64_t)a4;
- (void)setHasMaxX:(BOOL)a3;
- (void)setHasMaxY:(BOOL)a3;
- (void)setHasMinX:(BOOL)a3;
- (void)setHasMinY:(BOOL)a3;
- (void)setHasZoom:(BOOL)a3;
- (void)setMaxX:(unsigned int)a3;
- (void)setMaxY:(unsigned int)a3;
- (void)setMinX:(unsigned int)a3;
- (void)setMinY:(unsigned int)a3;
- (void)setZoom:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCoverageExtent

- (void)dealloc
{
  [(GEOCoverageExtent *)self clearCoverageExceptions];
  v3.receiver = self;
  v3.super_class = (Class)GEOCoverageExtent;
  [(GEOCoverageExtent *)&v3 dealloc];
}

- (unsigned)minX
{
  return self->_minX;
}

- (void)setMinX:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_minX = a3;
}

- (void)setHasMinX:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasMinX
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)minY
{
  return self->_minY;
}

- (void)setMinY:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_minY = a3;
}

- (void)setHasMinY:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMinY
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_maxX = a3;
}

- (void)setHasMaxX:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMaxX
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_maxY = a3;
}

- (void)setHasMaxY:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMaxY
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)zoom
{
  return self->_zoom;
}

- (void)setZoom:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_zoom = a3;
}

- (void)setHasZoom:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasZoom
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unint64_t)coverageExceptionsCount
{
  return self->_coverageExceptionsCount;
}

- (GEOCoverageException)coverageExceptions
{
  return self->_coverageExceptions;
}

- (uint64_t)_reserveCoverageExceptions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 32);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 24 * v9, 0xC606ED09uLL);
    if (result)
    {
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 16) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 24)), 24 * (v9 - *(void *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)clearCoverageExceptions
{
  self->_coverageExceptionsSpace = 0;
  self->_coverageExceptionsCount = 0;
  free(self->_coverageExceptions);
  self->_coverageExceptions = 0;
}

- (void)addCoverageException:(GEOCoverageException *)a3
{
  if (-[GEOCoverageExtent _reserveCoverageExceptions:]((uint64_t)self, 1uLL))
  {
    unint64_t v5 = &self->_coverageExceptions[self->_coverageExceptionsCount];
    uint64_t v6 = *(void *)&a3->var4;
    *(_OWORD *)&v5->var0 = *(_OWORD *)&a3->var0;
    *(void *)&v5->var4 = v6;
    ++self->_coverageExceptionsCount;
  }
}

- (GEOCoverageException)coverageExceptionAtIndex:(SEL)a3
{
  unint64_t v5 = self;
  unint64_t v7 = *(void *)&self[1].var0;
  if (v7 <= a4)
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C4A8];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, v7);
    v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];
    [v11 raise];
  }
  unint64_t v12 = *(void *)&v5->var4 + 24 * a4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v12;
  *(void *)&retstr->var4 = *(void *)(v12 + 16);
  return self;
}

- (void)setCoverageExceptions:(GEOCoverageException *)a3 count:(unint64_t)a4
{
  if (-[GEOCoverageExtent _reserveCoverageExceptions:]((uint64_t)self, a4))
  {
    memcpy(self->_coverageExceptions, a3, 24 * a4);
    self->_coverageExceptionsCount = a4;
  }
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCoverageExtent;
  unint64_t v4 = [(GEOCoverageExtent *)&v8 description];
  unint64_t v5 = [(GEOCoverageExtent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCoverageExtent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_17;
  }
  [(id)a1 readAll:1];
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 4) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v4 setObject:v18 forKey:@"minX"];

    char v5 = *(unsigned char *)(a1 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)(a1 + 60) & 8) == 0)
  {
    goto LABEL_4;
  }
  v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
  [v4 setObject:v19 forKey:@"minY"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_23:
    v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
    [v4 setObject:v21 forKey:@"maxY"];

    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v4 setObject:v20 forKey:@"maxX"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    [v4 setObject:v6 forKey:@"zoom"];
  }
LABEL_8:
  if (*(void *)(a1 + 24))
  {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
    if (*(void *)(a1 + 24))
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        v10 = _GEOCoverageExceptionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v8));
        [v7 addObject:v10];

        ++v9;
        v8 += 24;
      }
      while (v9 < *(void *)(a1 + 24));
    }
    [v4 setObject:v7 forKey:@"coverageException"];
  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    unint64_t v12 = [v11 dictionaryRepresentation];
    v13 = v12;
    if (a2)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__GEOCoverageExtent__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E53D8860;
      id v15 = v14;
      id v23 = v15;
      [v13 enumerateKeysAndObjectsUsingBlock:v22];
      id v16 = v15;

      v13 = v16;
    }
    [v4 setObject:v13 forKey:@"Unknown Fields"];
  }
LABEL_17:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCoverageExtent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOCoverageExtent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCoverageExtent)initWithDictionary:(id)a3
{
  return (GEOCoverageExtent *)-[GEOCoverageExtent _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      unint64_t v4 = [v3 objectForKeyedSubscript:@"minX"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinX:", objc_msgSend(v4, "unsignedIntValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"minY"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinY:", objc_msgSend(v5, "unsignedIntValue"));
      }

      uint64_t v6 = [v3 objectForKeyedSubscript:@"maxX"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxX:", objc_msgSend(v6, "unsignedIntValue"));
      }

      unint64_t v7 = [v3 objectForKeyedSubscript:@"maxY"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxY:", objc_msgSend(v7, "unsignedIntValue"));
      }

      uint64_t v8 = [v3 objectForKeyedSubscript:@"zoom"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setZoom:", objc_msgSend(v8, "unsignedIntValue"));
      }

      unint64_t v9 = [v3 objectForKeyedSubscript:@"coverageException"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v19 = 0uLL;
                uint64_t v20 = 0;
                _GEOCoverageExceptionFromDictionaryRepresentation(v15, (uint64_t)&v19);
                long long v17 = v19;
                uint64_t v18 = v20;
                [a1 addCoverageException:&v17];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v12);
        }
      }
    }
  }

  return a1;
}

- (GEOCoverageExtent)initWithJSON:(id)a3
{
  return (GEOCoverageExtent *)-[GEOCoverageExtent _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoverageExtentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoverageExtentReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_coverageExceptionsCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOCoverageExceptionWriteTo((uint64_t)&self->_coverageExceptions[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_coverageExceptionsCount);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOCoverageExtent *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v4[12] = self->_minX;
    *((unsigned char *)v4 + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_minY;
  *((unsigned char *)v4 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
LABEL_15:
    v4[11] = self->_maxY;
    *((unsigned char *)v4 + 60) |= 2u;
    if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  v4[10] = self->_maxX;
  *((unsigned char *)v4 + 60) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_15;
  }
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    v4[14] = self->_zoom;
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
LABEL_7:
  if ([(GEOCoverageExtent *)self coverageExceptionsCount])
  {
    [v4 clearCoverageExceptions];
    unint64_t v6 = [(GEOCoverageExtent *)self coverageExceptionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(GEOCoverageExtent *)self coverageExceptionAtIndex:i];
        [v4 addCoverageException:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v4 + 48) = self->_minX;
    *(unsigned char *)(v4 + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 52) = self->_minY;
  *(unsigned char *)(v4 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v4 + 40) = self->_maxX;
  *(unsigned char *)(v4 + 60) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *(_DWORD *)(v4 + 44) = self->_maxY;
  *(unsigned char *)(v4 + 60) |= 2u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 56) = self->_zoom;
    *(unsigned char *)(v4 + 60) |= 0x10u;
  }
LABEL_7:
  unint64_t coverageExceptionsCount = self->_coverageExceptionsCount;
  if (coverageExceptionsCount)
  {
    -[GEOCoverageExtent _reserveCoverageExceptions:](v4, coverageExceptionsCount);
    memcpy(*(void **)(v5 + 16), self->_coverageExceptions, 24 * self->_coverageExceptionsCount);
    *(void *)(v5 + 24) = self->_coverageExceptionsCount;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOCoverageExtent *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_minX != *((_DWORD *)v4 + 12)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_minY != *((_DWORD *)v4 + 13)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_maxX != *((_DWORD *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_maxY != *((_DWORD *)v4 + 11)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_zoom != *((_DWORD *)v4 + 14)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  unint64_t coverageExceptionsCount = self->_coverageExceptionsCount;
  if ((const void *)coverageExceptionsCount != v4[3])
  {
LABEL_29:
    BOOL v6 = 0;
    goto LABEL_30;
  }
  BOOL v6 = memcmp(self->_coverageExceptions, v4[2], 24 * coverageExceptionsCount) == 0;
LABEL_30:

  return v6;
}

- (unint64_t)hash
{
  [(GEOCoverageExtent *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_minX;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_minY;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_maxX;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBHashBytes();
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_maxY;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_zoom;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_minX = v4[12];
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v4[15] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_minY = v4[13];
  *(unsigned char *)&self->_flags |= 8u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_maxX = v4[10];
  *(unsigned char *)&self->_flags |= 1u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  self->_maxY = v4[11];
  *(unsigned char *)&self->_flags |= 2u;
  if ((v4[15] & 0x10) != 0)
  {
LABEL_6:
    self->_zoom = v4[14];
    *(unsigned char *)&self->_flags |= 0x10u;
  }
LABEL_7:
  uint64_t v6 = [v4 coverageExceptionsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v4 coverageExceptionAtIndex:i];
      [(GEOCoverageExtent *)self addCoverageException:v9];
    }
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCoverageExtent *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end