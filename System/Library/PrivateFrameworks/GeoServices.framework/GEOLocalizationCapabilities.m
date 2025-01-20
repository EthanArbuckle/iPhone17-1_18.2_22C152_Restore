@interface GEOLocalizationCapabilities
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSupportsLocalizedTrafficControlIcons;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsLocalizedTrafficControlIcons;
- (GEOLocalizationCapabilities)initWithDictionary:(id)a3;
- (GEOLocalizationCapabilities)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)supportedPhoneticTypesAsString:(int)a3;
- (int)StringAsSupportedPhoneticTypes:(id)a3;
- (int)supportedPhoneticTypeAtIndex:(unint64_t)a3;
- (int)supportedPhoneticTypes;
- (unint64_t)hash;
- (unint64_t)supportedPhoneticTypesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSupportedPhoneticType:(int)a3;
- (void)clearSupportedPhoneticTypes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasSupportsLocalizedTrafficControlIcons:(BOOL)a3;
- (void)setSupportedPhoneticTypes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportsLocalizedTrafficControlIcons:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalizationCapabilities

- (void).cxx_destruct
{
}

- (void)setSupportsLocalizedTrafficControlIcons:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_supportsLocalizedTrafficControlIcons = a3;
}

- (void)addSupportedPhoneticType:(int)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_supportedPhoneticTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_supportedPhoneticTypes.count);
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v4 + 40) = self->_supportsLocalizedTrafficControlIcons;
    *(unsigned char *)(v4 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLocalizationCapabilities;
  [(GEOLocalizationCapabilities *)&v3 dealloc];
}

- (unint64_t)supportedPhoneticTypesCount
{
  return self->_supportedPhoneticTypes.count;
}

- (int)supportedPhoneticTypes
{
  return self->_supportedPhoneticTypes.list;
}

- (void)clearSupportedPhoneticTypes
{
}

- (int)supportedPhoneticTypeAtIndex:(unint64_t)a3
{
  p_supportedPhoneticTypes = &self->_supportedPhoneticTypes;
  unint64_t count = self->_supportedPhoneticTypes.count;
  if (count <= a3)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedPhoneticTypes->list[a3];
}

- (void)setSupportedPhoneticTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedPhoneticTypesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53EB9C8[a3];
  }

  return v3;
}

- (int)StringAsSupportedPhoneticTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NUANCE_LHPLUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNABBREVIATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"XSAMPA"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)supportsLocalizedTrafficControlIcons
{
  return self->_supportsLocalizedTrafficControlIcons;
}

- (void)setHasSupportsLocalizedTrafficControlIcons:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSupportsLocalizedTrafficControlIcons
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalizationCapabilities;
  int v4 = [(GEOLocalizationCapabilities *)&v8 description];
  unint64_t v5 = [(GEOLocalizationCapabilities *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizationCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      id v6 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
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
            v9 = off_1E53EB9C8[v8];
          }
          [v5 addObject:v9];

          ++v7;
          id v6 = (void *)(a1 + 16);
        }
        while (v7 < *(void *)(a1 + 24));
      }
      if (a2) {
        v10 = @"supportedPhoneticType";
      }
      else {
        v10 = @"supported_phonetic_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (*(unsigned char *)(a1 + 44))
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      if (a2) {
        v12 = @"supportsLocalizedTrafficControlIcons";
      }
      else {
        v12 = @"supports_localized_traffic_control_icons";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __57__GEOLocalizationCapabilities__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOLocalizationCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOLocalizationCapabilities__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalizationCapabilities)initWithDictionary:(id)a3
{
  return (GEOLocalizationCapabilities *)-[GEOLocalizationCapabilities _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"supportedPhoneticType";
      }
      else {
        id v6 = @"supported_phonetic_type";
      }
      unint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v20 = a3;
        id v21 = v5;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v19 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (!v9) {
          goto LABEL_26;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        while (1)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              if ([v14 isEqualToString:@"NUANCE_LHPLUS"])
              {
                uint64_t v15 = 0;
              }
              else if ([v14 isEqualToString:@"UNABBREVIATED"])
              {
                uint64_t v15 = 1;
              }
              else if ([v14 isEqualToString:@"XSAMPA"])
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
            [a1 addSupportedPhoneticType:v15];
LABEL_24:
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (!v10)
          {
LABEL_26:

            id v5 = v21;
            a3 = v20;
            unint64_t v7 = v19;
            break;
          }
        }
      }

      if (a3) {
        v16 = @"supportsLocalizedTrafficControlIcons";
      }
      else {
        v16 = @"supports_localized_traffic_control_icons";
      }
      id v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsLocalizedTrafficControlIcons:", objc_msgSend(v17, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLocalizationCapabilities)initWithJSON:(id)a3
{
  return (GEOLocalizationCapabilities *)-[GEOLocalizationCapabilities _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizationCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizationCapabilitiesReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  unint64_t v7 = a3;
  [(GEOLocalizationCapabilities *)self readAll:0];
  if ([(GEOLocalizationCapabilities *)self supportedPhoneticTypesCount])
  {
    [v7 clearSupportedPhoneticTypes];
    unint64_t v4 = [(GEOLocalizationCapabilities *)self supportedPhoneticTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSupportedPhoneticType:", -[GEOLocalizationCapabilities supportedPhoneticTypeAtIndex:](self, "supportedPhoneticTypeAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v7[40] = self->_supportsLocalizedTrafficControlIcons;
    v7[44] |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_5;
  }
  [(GEOLocalizationCapabilities *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_5;
  }
  BOOL v5 = (v4[44] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[44] & 1) == 0)
    {
LABEL_5:
      BOOL v5 = 0;
      goto LABEL_6;
    }
    if (self->_supportsLocalizedTrafficControlIcons)
    {
      if (!v4[40]) {
        goto LABEL_5;
      }
    }
    else if (v4[40])
    {
      goto LABEL_5;
    }
    BOOL v5 = 1;
  }
LABEL_6:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLocalizationCapabilities *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_supportsLocalizedTrafficControlIcons;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v7 = (BOOL *)a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 supportedPhoneticTypesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLocalizationCapabilities addSupportedPhoneticType:](self, "addSupportedPhoneticType:", [v7 supportedPhoneticTypeAtIndex:i]);
  }
  if (v7[44])
  {
    self->_supportsLocalizedTrafficControlIcons = v7[40];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOLocalizationCapabilities *)self readAll:0];
  }
}

@end