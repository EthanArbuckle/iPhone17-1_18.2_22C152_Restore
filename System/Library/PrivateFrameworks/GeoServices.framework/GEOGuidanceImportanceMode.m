@interface GEOGuidanceImportanceMode
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOGuidanceImportanceMode)initWithDictionary:(id)a3;
- (GEOGuidanceImportanceMode)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)guidancePreferenceTypesAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsGuidancePreferenceTypes:(id)a3;
- (int)guidancePreferenceTypeAtIndex:(unint64_t)a3;
- (int)guidancePreferenceTypes;
- (unint64_t)guidancePreferenceTypesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addGuidancePreferenceType:(int)a3;
- (void)clearGuidancePreferenceTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGuidancePreferenceTypes:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOGuidanceImportanceMode

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOGuidanceImportanceMode;
  [(GEOGuidanceImportanceMode *)&v3 dealloc];
}

- (unint64_t)guidancePreferenceTypesCount
{
  return self->_guidancePreferenceTypes.count;
}

- (int)guidancePreferenceTypes
{
  return self->_guidancePreferenceTypes.list;
}

- (void)clearGuidancePreferenceTypes
{
}

- (void)addGuidancePreferenceType:(int)a3
{
}

- (int)guidancePreferenceTypeAtIndex:(unint64_t)a3
{
  p_guidancePreferenceTypes = &self->_guidancePreferenceTypes;
  unint64_t count = self->_guidancePreferenceTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_guidancePreferenceTypes->list[a3];
}

- (void)setGuidancePreferenceTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)guidancePreferenceTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"ALERTS_ONLY";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsGuidancePreferenceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ALERTS_ONLY"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOGuidanceImportanceMode;
  int v4 = [(GEOGuidanceImportanceMode *)&v8 description];
  v5 = [(GEOGuidanceImportanceMode *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceImportanceMode _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v6 = a1 + 2;
      if (a1[3])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if (v8)
          {
            if (v8 == 1)
            {
              v9 = @"ALERTS_ONLY";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
              v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v9 = @"UNKNOWN";
          }
          [v5 addObject:v9];

          ++v7;
          v6 = a1 + 2;
        }
        while (v7 < a1[3]);
      }
      if (a2) {
        v10 = @"guidancePreferenceType";
      }
      else {
        v10 = @"guidance_preference_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    v11 = (void *)a1[1];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __55__GEOGuidanceImportanceMode__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOGuidanceImportanceMode _dictionaryRepresentation:](self, 1);
}

void __55__GEOGuidanceImportanceMode__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOGuidanceImportanceMode)initWithDictionary:(id)a3
{
  return (GEOGuidanceImportanceMode *)-[GEOGuidanceImportanceMode _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"guidancePreferenceType";
      }
      else {
        v6 = @"guidance_preference_type";
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
          goto LABEL_22;
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
              if ([v14 isEqualToString:@"UNKNOWN"]) {
                uint64_t v15 = 0;
              }
              else {
                uint64_t v15 = [v14 isEqualToString:@"ALERTS_ONLY"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_20;
              }
              uint64_t v15 = [v13 intValue];
            }
            objc_msgSend(a1, "addGuidancePreferenceType:", v15, v17, v18, (void)v19);
LABEL_20:
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (!v10)
          {
LABEL_22:

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

- (GEOGuidanceImportanceMode)initWithJSON:(id)a3
{
  return (GEOGuidanceImportanceMode *)-[GEOGuidanceImportanceMode _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceImportanceModeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceImportanceModeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_guidancePreferenceTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_guidancePreferenceTypes.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOGuidanceImportanceMode *)self readAll:0];
  if ([(GEOGuidanceImportanceMode *)self guidancePreferenceTypesCount])
  {
    [v7 clearGuidancePreferenceTypes];
    unint64_t v4 = [(GEOGuidanceImportanceMode *)self guidancePreferenceTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addGuidancePreferenceType:", -[GEOGuidanceImportanceMode guidancePreferenceTypeAtIndex:](self, "guidancePreferenceTypeAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    [(GEOGuidanceImportanceMode *)self readAll:1];
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
  [(GEOGuidanceImportanceMode *)self readAll:1];

  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 guidancePreferenceTypesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOGuidanceImportanceMode addGuidancePreferenceType:](self, "addGuidancePreferenceType:", [v7 guidancePreferenceTypeAtIndex:i]);
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
    [(GEOGuidanceImportanceMode *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end